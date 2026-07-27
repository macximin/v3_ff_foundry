from __future__ import annotations

import argparse
import datetime as dt
import hashlib
import json
import re
import sys
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any

try:
    import yaml
    from jsonschema import Draft202012Validator
except ImportError as exc:  # pragma: no cover - environment preflight
    raise SystemExit(
        "screenplay doctor requires PyYAML and jsonschema: "
        f"{exc.name} is not installed"
    ) from exc


REPO_ROOT = Path(__file__).resolve().parents[2]
SCREENWORK_ROOT = (REPO_ROOT / "45_screenworks").resolve()
NOVEL_ROOT = (REPO_ROOT / "40_works").resolve()
SCHEMA_ROOT = REPO_ROOT / "schemas" / "screenplay"
DEFAULT_TARGET = SCREENWORK_ROOT / "_template" / "variants" / "_template"
SHA256_RE = re.compile(r"^[a-f0-9]{64}$")
SCENE_ID_RE = re.compile(
    r"/\*\s*scene_id:\s*([A-Z0-9][A-Z0-9_-]+)\s*\*/", re.IGNORECASE
)


@dataclass(frozen=True)
class Diagnostic:
    severity: str
    code: str
    message: str
    path: str


class Doctor:
    def __init__(self, target: Path) -> None:
        self.target = target.resolve()
        self.diagnostics: list[Diagnostic] = []

    def add(self, severity: str, code: str, message: str, path: Path | str) -> None:
        try:
            rendered_path = str(Path(path).resolve().relative_to(REPO_ROOT))
        except (ValueError, OSError):
            rendered_path = str(path)
        self.diagnostics.append(Diagnostic(severity, code, message, rendered_path))

    def error(self, code: str, message: str, path: Path | str) -> None:
        self.add("error", code, message, path)

    def warn(self, code: str, message: str, path: Path | str) -> None:
        self.add("warning", code, message, path)

    def run(self) -> dict[str, Any]:
        if self.target.is_relative_to(NOVEL_ROOT):
            self.error(
                "scope.novel_forbidden",
                "screenplay tools must never target 40_works",
                self.target,
            )
            return self.result()
        if not self.target.is_relative_to(SCREENWORK_ROOT):
            self.error(
                "scope.outside_screenworks",
                "target must be inside 45_screenworks",
                self.target,
            )
            return self.result()
        if not self.target.is_dir():
            self.error("target.missing", "variant directory does not exist", self.target)
            return self.result()

        required = [
            "00_status.yaml",
            "00_source_manifest.yaml",
            "00_stage_context_contract.md",
            "00_artifact_index.yaml",
            "01_screen_brief/screen_brief.md",
            "02_format_bible/format_bible.md",
            "03_season/season_design.md",
            "04_episode_promises",
            "05_scene_cards",
            "06_timed_scripts",
            "07_reviews/review_manifest.yaml",
            "08_approved_scripts/manifest.yaml",
            "09_state/planning_state.yaml",
            "90_receipts",
        ]
        for relative in required:
            path = self.target / relative
            if not path.exists():
                self.error("layout.required_missing", f"required path missing: {relative}", path)

        if any(d.code == "layout.required_missing" for d in self.diagnostics):
            return self.result()

        family_manifest = self.target.parent.parent / "00_family" / "family_manifest.yaml"
        if not family_manifest.is_file():
            self.error(
                "layout.family_manifest_missing",
                "variant must have a sibling 00_family/family_manifest.yaml",
                family_manifest,
            )
        else:
            family = self.validate_with_schema(
                family_manifest, SCHEMA_ROOT / "screen_family_v1.schema.json"
            )
            if isinstance(family, dict):
                status_path = self.target / "00_status.yaml"
                early_status = self.load_yaml(status_path)
                if (
                    isinstance(early_status, dict)
                    and family.get("family_id") != early_status.get("family_id")
                ):
                    self.error(
                        "identity.family_mismatch",
                        "family manifest and variant status family_id differ",
                        status_path,
                    )

        status = self.validate_with_schema(
            self.target / "00_status.yaml",
            SCHEMA_ROOT / "screenwork_status_v1.schema.json",
        )
        source = self.validate_with_schema(
            self.target / "00_source_manifest.yaml",
            SCHEMA_ROOT / "screen_source_manifest_v1.schema.json",
        )
        self.validate_status_and_source(status, source)
        self.validate_stage(status)
        self.validate_scripts(status)
        self.validate_reviews()
        self.validate_approved_scripts()
        self.validate_artifact_index()
        self.validate_planning_state()
        return self.result()

    def result(self) -> dict[str, Any]:
        errors = sum(d.severity == "error" for d in self.diagnostics)
        warnings = sum(d.severity == "warning" for d in self.diagnostics)
        return {
            "ok": errors == 0,
            "target": str(self.target),
            "errors": errors,
            "warnings": warnings,
            "diagnostics": [asdict(d) for d in self.diagnostics],
        }

    def load_yaml(self, path: Path) -> Any:
        try:
            return yaml.safe_load(path.read_text(encoding="utf-8"))
        except (OSError, UnicodeError, yaml.YAMLError) as exc:
            self.error("parse.yaml", str(exc), path)
            return None

    def load_json(self, path: Path) -> Any:
        try:
            return json.loads(path.read_text(encoding="utf-8"))
        except (OSError, UnicodeError, json.JSONDecodeError) as exc:
            self.error("parse.json", str(exc), path)
            return None

    def validate_with_schema(self, data_path: Path, schema_path: Path) -> Any:
        data = self.load_json(data_path) if data_path.suffix == ".json" else self.load_yaml(data_path)
        schema = self.load_json(schema_path)
        if data is None or schema is None:
            return data
        validator = Draft202012Validator(schema)
        for issue in sorted(validator.iter_errors(normalize_dates(data)), key=lambda e: list(e.path)):
            location = ".".join(str(part) for part in issue.path) or "<root>"
            self.error(
                "schema.invalid",
                f"{location}: {issue.message}",
                data_path,
            )
        return data

    def validate_status_and_source(self, status: Any, source: Any) -> None:
        if not isinstance(status, dict) or not isinstance(source, dict):
            return
        status_path = self.target / "00_status.yaml"
        source_path = self.target / "00_source_manifest.yaml"
        if status.get("screenwork_id") != source.get("screenwork_id"):
            self.error("identity.screenwork_mismatch", "status and source screenwork_id differ", source_path)
        if status.get("source_kind") != source.get("source_kind"):
            self.error("source.kind_mismatch", "status and source source_kind differ", source_path)
        if status.get("variant_id") != status.get("screenwork_id"):
            self.error(
                "identity.variant_mismatch",
                "v1 requires variant_id and screenwork_id to match",
                status_path,
            )

        runtime = status.get("target_runtime_seconds")
        if isinstance(runtime, dict) and comparable_number(runtime.get("min")) and comparable_number(runtime.get("max")):
            if runtime["min"] > runtime["max"]:
                self.error("timing.range", "target runtime min exceeds max", status_path)

        source_kind = source.get("source_kind")
        revisions = source.get("bound_revisions")
        if source_kind == "novel_adaptation":
            if source.get("binding_mode") != "exact_revision":
                self.error("source.binding_mode", "novel_adaptation requires exact_revision", source_path)
            if not isinstance(revisions, list) or not revisions:
                self.error("source.revision_required", "novel_adaptation requires at least one bound revision", source_path)
            if not is_sha256(source.get("current_binding_sha256")):
                self.error("source.binding_hash_required", "novel_adaptation requires current_binding_sha256", source_path)
        elif source_kind == "screen_original":
            if source.get("binding_mode") != "no_external_source":
                self.error("source.binding_mode", "screen_original requires no_external_source", source_path)
            if revisions:
                self.error("source.unexpected_revision", "screen_original cannot carry bound source revisions", source_path)
            if source.get("current_binding_sha256") is not None:
                self.error("source.unexpected_hash", "screen_original current_binding_sha256 must be null", source_path)

        if status.get("source_binding_sha256") != source.get("current_binding_sha256"):
            self.error("source.status_hash_mismatch", "status source hash must match source manifest", status_path)

    def validate_stage(self, status: Any) -> None:
        if not isinstance(status, dict):
            return
        stages = [
            "none",
            "source_binding",
            "screen_brief",
            "format_bible",
            "season_design",
            "episode_promise",
            "scene_cards",
            "timed_script",
            "review",
            "approved_script",
        ]
        current = status.get("screen_stage")
        if current not in stages:
            return
        current_index = stages.index(current)
        text_requirements = [
            ("screen_brief", self.target / "01_screen_brief" / "screen_brief.md"),
            ("format_bible", self.target / "02_format_bible" / "format_bible.md"),
            ("season_design", self.target / "03_season" / "season_design.md"),
        ]
        for stage, path in text_requirements:
            if current_index >= stages.index(stage):
                body = path.read_text(encoding="utf-8")
                if "TBD" in body:
                    self.error(
                        "stage.placeholder",
                        f"{stage} cannot be current or complete while TBD remains",
                        path,
                    )
        if current_index >= stages.index("episode_promise"):
            promises = list((self.target / "04_episode_promises").glob("*_promise.md"))
            if not promises or all("TBD" in path.read_text(encoding="utf-8") for path in promises):
                self.error("stage.episode_promise_missing", "stage requires a completed Episode Promise", self.target / "04_episode_promises")
        if current_index >= stages.index("scene_cards"):
            cards = list((self.target / "05_scene_cards").glob("*_scene_cards.yaml"))
            if not cards:
                self.error("stage.scene_cards_missing", "stage requires Scene Cards", self.target / "05_scene_cards")
            for path in cards:
                data = self.load_yaml(path)
                if isinstance(data, dict) and data.get("status") == "template_placeholder":
                    self.error("stage.scene_cards_placeholder", "stage cannot use placeholder Scene Cards", path)
        if current_index >= stages.index("timed_script"):
            metadata_paths = list((self.target / "06_timed_scripts").glob("*.scenes.json"))
            if not metadata_paths:
                self.error("stage.script_missing", "stage requires a Timed Script", self.target / "06_timed_scripts")
            for path in metadata_paths:
                data = self.load_json(path)
                if isinstance(data, dict) and data.get("status") == "template_placeholder":
                    self.error("stage.script_placeholder", "stage cannot use a placeholder Timed Script", path)
        if current_index >= stages.index("review"):
            review = self.load_yaml(self.target / "07_reviews" / "review_manifest.yaml")
            if not isinstance(review, dict) or not review.get("entries"):
                self.error("stage.review_missing", "review stage requires review entries", self.target / "07_reviews")
        if current == "approved_script":
            approved = self.load_yaml(self.target / "08_approved_scripts" / "manifest.yaml")
            if not isinstance(approved, dict) or not approved.get("entries"):
                self.error("stage.approval_missing", "approved_script stage requires owner-approved entries", self.target / "08_approved_scripts")

    def validate_scripts(self, status: Any) -> None:
        script_dir = self.target / "06_timed_scripts"
        fountain_paths = sorted(script_dir.glob("*.fountain"))
        metadata_paths = sorted(script_dir.glob("*.scenes.json"))
        fountain_bases = {path.name.removesuffix(".fountain") for path in fountain_paths}
        metadata_bases = {path.name.removesuffix(".scenes.json") for path in metadata_paths}
        for base in sorted(fountain_bases - metadata_bases):
            self.error("script.sidecar_missing", "Fountain script requires matching .scenes.json", script_dir / f"{base}.fountain")
        for base in sorted(metadata_bases - fountain_bases):
            self.error("script.body_missing", "scene metadata requires matching .fountain", script_dir / f"{base}.scenes.json")

        for metadata_path in metadata_paths:
            data = self.validate_with_schema(
                metadata_path, SCHEMA_ROOT / "script_scene_metadata_v1.schema.json"
            )
            if not isinstance(data, dict):
                continue
            if isinstance(status, dict) and data.get("screenwork_id") != status.get("screenwork_id"):
                self.error("identity.script_screenwork_mismatch", "script metadata screenwork_id differs from status", metadata_path)
            script_path = script_dir / str(data.get("script_file", ""))
            if script_path.parent.resolve() != script_dir.resolve():
                self.error("script.path_escape", "script_file must stay in 06_timed_scripts", metadata_path)
                continue
            if not script_path.is_file():
                self.error("script.file_missing", "script_file does not exist", script_path)
                continue
            fountain_ids = SCENE_ID_RE.findall(script_path.read_text(encoding="utf-8"))
            scenes = data.get("scenes")
            if not isinstance(scenes, list):
                continue
            metadata_ids = [scene.get("scene_id") for scene in scenes if isinstance(scene, dict)]
            if fountain_ids != metadata_ids:
                self.error(
                    "script.scene_id_mismatch",
                    f"Fountain scene IDs {fountain_ids} differ from metadata {metadata_ids}",
                    metadata_path,
                )
            if len(metadata_ids) != len(set(metadata_ids)):
                self.error("scene.id_duplicate", "scene IDs must be unique within a script revision", metadata_path)

            active_orders: list[Any] = []
            total_min = 0.0
            total_max = 0.0
            for scene in scenes:
                if not isinstance(scene, dict):
                    continue
                timing = scene.get("estimated_seconds")
                if isinstance(timing, dict) and comparable_number(timing.get("min")) and comparable_number(timing.get("max")):
                    if timing["min"] > timing["max"]:
                        self.error("timing.scene_range", f"{scene.get('scene_id')} min exceeds max", metadata_path)
                    if scene.get("status") == "active" and scene.get("operation") != "omit":
                        total_min += float(timing["min"])
                        total_max += float(timing["max"])
                if scene.get("status") == "active" and scene.get("operation") != "omit":
                    active_orders.append(scene.get("screen_order"))
                parents = scene.get("parent_scene_ids")
                operation = scene.get("operation")
                if operation == "split" and (not isinstance(parents, list) or len(parents) < 1):
                    self.error("scene.split_parent", "split requires at least one parent_scene_id", metadata_path)
                if operation == "merge" and (not isinstance(parents, list) or len(parents) < 2):
                    self.error("scene.merge_parents", "merge requires at least two parent_scene_ids", metadata_path)
                if operation == "omit" and scene.get("status") != "retired":
                    self.error("scene.omit_status", "omit scene must be retained as status=retired", metadata_path)
            if len(active_orders) != len(set(active_orders)):
                self.error("scene.screen_order_duplicate", "active screen_order values must be unique", metadata_path)

            if isinstance(status, dict) and data.get("status") != "template_placeholder":
                runtime = status.get("target_runtime_seconds")
                if isinstance(runtime, dict) and comparable_number(runtime.get("min")) and comparable_number(runtime.get("max")):
                    if total_max < float(runtime["min"]) or total_min > float(runtime["max"]):
                        self.error(
                            "timing.episode_budget",
                            f"scene estimate {total_min:g}-{total_max:g}s does not overlap target "
                            f"{runtime['min']}-{runtime['max']}s",
                            metadata_path,
                        )

    def validate_reviews(self) -> None:
        path = self.target / "07_reviews" / "review_manifest.yaml"
        data = self.load_yaml(path)
        if not isinstance(data, dict):
            return
        if data.get("schema_version") != "firefly_screen_review_manifest_v1":
            self.error("review.schema", "unsupported review manifest schema", path)
        status = self.load_yaml(self.target / "00_status.yaml")
        if isinstance(status, dict) and data.get("screenwork_id") != status.get("screenwork_id"):
            self.error("identity.review_screenwork_mismatch", "review manifest screenwork_id differs from status", path)
        entries = data.get("entries")
        if not isinstance(entries, list):
            self.error("review.entries", "entries must be a list", path)
            return
        sealed_br0: set[tuple[Any, Any]] = set()
        for entry in entries:
            if not isinstance(entry, dict):
                self.error("review.entry", "review entry must be an object", path)
                continue
            stage = entry.get("review_stage")
            key = (entry.get("episode_id"), entry.get("script_sha256"))
            if not is_sha256(entry.get("script_sha256")):
                self.error("review.hash", "review entry requires a lowercase SHA-256", path)
            if entry.get("producer_family") == entry.get("reviewer_family"):
                self.error("review.independence", "reviewer family must differ from producer family", path)
            if stage == "BR0":
                if entry.get("sealed_at") and entry.get("verdict") in {"pass", "revise", "restart"}:
                    sealed_br0.add(key)
                else:
                    self.error("review.br0_unsealed", "BR0 requires sealed_at and a valid verdict", path)
            elif stage == "BR1":
                if key not in sealed_br0:
                    self.error("review.br1_before_br0", "BR1 requires an earlier sealed BR0 for the same script hash", path)
            else:
                self.error("review.stage", "review_stage must be BR0 or BR1", path)

    def validate_approved_scripts(self) -> None:
        path = self.target / "08_approved_scripts" / "manifest.yaml"
        data = self.validate_with_schema(
            path, SCHEMA_ROOT / "approved_script_manifest_v1.schema.json"
        )
        if not isinstance(data, dict):
            return
        status = self.load_yaml(self.target / "00_status.yaml")
        if isinstance(status, dict) and data.get("screenwork_id") != status.get("screenwork_id"):
            self.error("identity.approval_screenwork_mismatch", "approved manifest screenwork_id differs from status", path)
        review_data = self.load_yaml(self.target / "07_reviews" / "review_manifest.yaml")
        reviews = review_data.get("entries", []) if isinstance(review_data, dict) else []
        passed_br1 = {
            (entry.get("episode_id"), entry.get("script_sha256"))
            for entry in reviews
            if isinstance(entry, dict)
            and entry.get("review_stage") == "BR1"
            and entry.get("verdict") == "pass"
        }
        for entry in data.get("entries", []):
            if not isinstance(entry, dict):
                continue
            artifact = safe_variant_path(self.target, entry.get("path"))
            if artifact is None:
                self.error("approval.path_escape", "approved script path must stay inside variant", path)
                continue
            if not artifact.is_file():
                self.error("approval.file_missing", "approved script file does not exist", artifact)
                continue
            approved_root = (self.target / "08_approved_scripts").resolve()
            if not artifact.is_relative_to(approved_root):
                self.error(
                    "approval.snapshot_location",
                    "approved script must be an immutable snapshot under 08_approved_scripts",
                    artifact,
                )
            actual = sha256_file(artifact)
            if actual != entry.get("sha256"):
                self.error("approval.hash_mismatch", f"expected {entry.get('sha256')}, got {actual}", artifact)
            if (entry.get("episode_id"), entry.get("sha256")) not in passed_br1:
                self.error("approval.br1_missing", "owner approval requires a passing BR1 for the exact script hash", path)

    def validate_artifact_index(self) -> None:
        path = self.target / "00_artifact_index.yaml"
        data = self.load_yaml(path)
        if not isinstance(data, dict):
            return
        if data.get("schema_version") != "firefly_screen_artifact_index_v1":
            self.error("artifact.schema", "unsupported artifact index schema", path)
        artifacts = data.get("artifacts")
        if not isinstance(artifacts, list):
            self.error("artifact.entries", "artifacts must be a list", path)
            return
        for artifact in artifacts:
            if not isinstance(artifact, dict):
                self.error("artifact.entry", "artifact entry must be an object", path)
                continue
            artifact_path = safe_variant_path(self.target, artifact.get("path"))
            if artifact_path is None:
                self.error("artifact.path_escape", "artifact path must stay inside variant", path)
                continue
            if not artifact_path.is_file():
                self.error("artifact.file_missing", "indexed artifact file does not exist", artifact_path)
                continue
            expected = artifact.get("sha256")
            actual = sha256_file(artifact_path)
            if not is_sha256(expected) or expected != actual:
                self.error("artifact.hash_mismatch", f"indexed hash does not match {actual}", artifact_path)
            freshness = artifact.get("freshness")
            if freshness not in {"fresh", "stale_review_required", "invalid"}:
                self.error("artifact.freshness", "freshness must be fresh, stale_review_required, or invalid", path)
            for parent in artifact.get("parents", []):
                if not isinstance(parent, dict):
                    self.error("artifact.parent", "parent dependency must be an object", path)
                    continue
                parent_path = safe_variant_path(self.target, parent.get("path"))
                if parent_path is None or not parent_path.is_file():
                    self.error("artifact.parent_missing", "parent dependency does not exist", path)
                    continue
                parent_actual = sha256_file(parent_path)
                if parent_actual != parent.get("sha256"):
                    if freshness == "fresh":
                        self.error(
                            "artifact.parent_stale",
                            "parent hash changed; mark downstream stale_review_required or invalid",
                            artifact_path,
                        )
                    else:
                        self.warn(
                            "artifact.parent_stale_acknowledged",
                            f"parent hash changed and artifact is marked {freshness}",
                            artifact_path,
                        )

    def validate_planning_state(self) -> None:
        path = self.target / "09_state" / "planning_state.yaml"
        data = self.load_yaml(path)
        if not isinstance(data, dict):
            return
        if data.get("schema_version") != "firefly_screen_planning_state_v1":
            self.error("state.schema", "unsupported Planning State schema", path)
        status = self.load_yaml(self.target / "00_status.yaml")
        if isinstance(status, dict) and data.get("screenwork_id") != status.get("screenwork_id"):
            self.error("identity.state_screenwork_mismatch", "Planning State screenwork_id differs from status", path)
        if data.get("projection_kind") != "provisional":
            self.error("state.authority", "Planning State must remain provisional", path)
        if data.get("rebuildable") is not True:
            self.error("state.rebuildable", "Planning State must be rebuildable", path)


def normalize_dates(value: Any) -> Any:
    if isinstance(value, (dt.date, dt.datetime)):
        return value.isoformat()
    if isinstance(value, list):
        return [normalize_dates(item) for item in value]
    if isinstance(value, dict):
        return {key: normalize_dates(item) for key, item in value.items()}
    return value


def comparable_number(value: Any) -> bool:
    return isinstance(value, (int, float)) and not isinstance(value, bool)


def is_sha256(value: Any) -> bool:
    return isinstance(value, str) and SHA256_RE.fullmatch(value) is not None


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def safe_variant_path(root: Path, value: Any) -> Path | None:
    if not isinstance(value, str) or not value:
        return None
    candidate = (root / value).resolve()
    return candidate if candidate.is_relative_to(root.resolve()) else None


def render_text(result: dict[str, Any]) -> str:
    verdict = "PASS" if result["ok"] else "FAIL"
    lines = [
        f"Screenplay Doctor: {verdict}",
        f"Target: {result['target']}",
        f"Errors: {result['errors']}  Warnings: {result['warnings']}",
    ]
    for item in result["diagnostics"]:
        lines.append(
            f"[{item['severity'].upper()}] {item['code']} "
            f"({item['path']}): {item['message']}"
        )
    return "\n".join(lines)


def parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Read-only validator for Firefly 45_screenworks variants."
    )
    parser.add_argument(
        "target",
        nargs="?",
        type=Path,
        default=DEFAULT_TARGET,
        help="variant directory inside 45_screenworks",
    )
    parser.add_argument("--json", action="store_true", dest="as_json")
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = parse_args(argv)
    result = Doctor(args.target).run()
    if args.as_json:
        print(json.dumps(result, ensure_ascii=False, indent=2))
    else:
        print(render_text(result))
    return 0 if result["ok"] else 1


if __name__ == "__main__":
    sys.exit(main())
