import json
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[1]
TEMPLATE = ROOT / "40_works" / "_template"
RELAY = ROOT / "tools" / "draft_relay" / "Invoke-DraftRelay.ps1"
SCHEMA = ROOT / "schemas" / "webnovel_workbench_v1.schema.json"
LEGACY_WORKS = (
    "afterlife_restaurant",
    "cheongma_restaurant",
    "isekai_restaurant",
    "knights_restaurant",
    "romance_fantasy_restaurant",
    "tyrant_restaurant",
)


def read(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def front_matter(text: str) -> str:
    match = re.match(r"\A\ufeff?---[ \t]*\r?\n(.*?)\r?\n---(?:\r?\n|\Z)", text, re.S)
    if not match:
        raise AssertionError("missing YAML front matter")
    return match.group(1)


def scalar(yaml_text: str, field: str) -> str | None:
    match = re.search(rf"(?m)^{re.escape(field)}:\s*([^#\r\n]+?)\s*$", yaml_text)
    return match.group(1).strip().strip("\"'") if match else None


class WebnovelWorkbenchContractTests(unittest.TestCase):
    def test_template_status_front_matter_is_the_profile_ssot(self) -> None:
        status = front_matter(read(TEMPLATE / "00_status.md"))
        self.assertEqual(scalar(status, "surface_profile"), "plan_arc_manuscript_v1")
        self.assertEqual(scalar(status, "arc_pacing_profile"), "webnovel_1_to_3")

    def test_template_rails_use_the_three_episode_boundary(self) -> None:
        b_rail = read(TEMPLATE / "02_story" / "arc_route_rail.md")
        corridor = read(TEMPLATE / "02_story" / "rolling_corridor.md")
        closeout = read(TEMPLATE / "05_review" / "arc_closeout_template.md")

        self.assertIn("arc_episode_cap: 3", b_rail)
        self.assertIn("arc_episode_cap: 3", corridor)
        self.assertIn("planned_end_episode: ep003", corridor)
        self.assertIn("hard_end_episode: ep003", corridor)
        self.assertIn("episode_span: 1_to_3", corridor)
        self.assertIn("episode_cap: 3", closeout)
        self.assertIn("ceil(250 / 3) = 84", b_rail)
        self.assertIn("route_status: scaffold_required", b_rail)
        self.assertIn("route_status: route_to_ending_ready", b_rail)

    def test_template_startup_commits_only_the_first_bet(self) -> None:
        corridor = read(TEMPLATE / "02_story" / "rolling_corridor.md")
        readme = read(TEMPLATE / "README.md")
        committed = re.search(
            r"(?ms)^  committed:\s*\n(?P<body>(?:    - ep\d+\s*\n)+)", corridor
        )
        provisional = re.search(
            r"(?ms)^  provisional:\s*\n(?P<body>(?:    - ep\d+\s*\n)+)", corridor
        )
        self.assertIsNotNone(committed)
        self.assertIsNotNone(provisional)
        self.assertEqual(re.findall(r"ep\d+", committed.group("body")), ["ep001"])
        self.assertEqual(re.findall(r"ep\d+", provisional.group("body")), ["ep002", "ep003"])
        self.assertIn("Git commit을 뜻하지 않는다", readme)
        self.assertIn("`ep001~ep003`을 모두 committed로 잠그는 초기화 규칙은 없다", readme)

    def test_existing_six_works_remain_profileless_legacy_inputs(self) -> None:
        for work_slug in LEGACY_WORKS:
            with self.subTest(work_slug=work_slug):
                status_path = ROOT / "40_works" / work_slug / "00_status.md"
                self.assertTrue(status_path.is_file())
                status = front_matter(read(status_path))
                self.assertIsNone(scalar(status, "surface_profile"))
                self.assertIsNone(scalar(status, "arc_pacing_profile"))

    def test_schema_validates_the_clean_room_workbench_contract(self) -> None:
        schema = json.loads(read(SCHEMA))
        instance = {
            "surface_profile": "plan_arc_manuscript_v1",
            "arc_pacing_profile": "webnovel_1_to_3",
            "surface": {
                "levels": ["plan", "arc", "manuscript"],
                "sidecars_are_authority_tiers": False,
                "sidecars": ["episode_bet", "review", "narrative_state"],
            },
            "arc": {
                "episode_cap": 3,
                "episode_span": "1_to_3",
                "planned_span_max": 3,
                "hard_span_max": 3,
            },
            "startup": {
                "first_episode_bet_status": "committed",
                "following_episode_bet_statuses": ["provisional", "provisional"],
                "same_arc_only": True,
                "committed_semantics": "episode_bet_body_status",
            },
            "capacity": {
                "target_episode_count": 250,
                "minimum_arc_slots": 84,
                "calculation": "ceil(250/3)=84",
            },
        }
        self.assertEqual(schema["$schema"], "https://json-schema.org/draft/2020-12/schema")
        self.assertEqual(schema["properties"]["surface_profile"]["const"], instance["surface_profile"])
        self.assertEqual(schema["properties"]["arc_pacing_profile"]["const"], instance["arc_pacing_profile"])
        try:
            from jsonschema import Draft202012Validator
        except ModuleNotFoundError:
            return
        Draft202012Validator.check_schema(schema)
        Draft202012Validator(schema).validate(instance)

    def test_relay_contains_one_profile_resolver_and_dynamic_checks(self) -> None:
        relay = read(RELAY)
        self.assertEqual(relay.count("function Resolve-WorkSurfaceProfile"), 1)
        self.assertIn("Get-MarkdownFrontMatter", relay)
        self.assertNotIn("Get-YamlScalar $status 'arc_pacing_profile'", relay)
        self.assertNotIn('Get-YamlScalar $status "arc_pacing_profile"', relay)
        self.assertIn("'legacy_1_to_5'", relay)
        self.assertIn("'webnovel_1_to_3'", relay)
        self.assertIn("Unknown arc_pacing_profile in status front matter", relay)
        self.assertIn("surface_profile=plan_arc_manuscript_v1 requires arc_pacing_profile=webnovel_1_to_3", relay)
        self.assertIn("$ProfileContract.EpisodeCap", relay)
        self.assertIn("$ProfileContract.EpisodeSpan", relay)
        self.assertIn("$ProfileContract.MinimumArcSlots", relay)
        self.assertIn("route_to_ending_ready", relay)
        self.assertIn("Story Arc planned span exceeds profile cap", relay)
        self.assertIn("Story Arc hard span exceeds profile cap", relay)
        self.assertIn("Requested episode is outside the active Story Arc", relay)

    def make_arc_fixture(
        self,
        root: Path,
        *,
        pacing_profile: str | None,
        cap: int,
        span: str,
        current_episode: str,
        hard_end: str,
        surface_profile: str | None = "plan_arc_manuscript_v1",
        route_slot_count: int | None = None,
        route_status: str | None = None,
    ) -> Path:
        work = root / "profile_fixture"
        story = work / "02_story"
        story.mkdir(parents=True)
        profile_lines = []
        if surface_profile is not None:
            profile_lines.append(f"surface_profile: {surface_profile}")
        if pacing_profile is not None:
            profile_lines.append(f"arc_pacing_profile: {pacing_profile}")
        (work / "00_status.md").write_text(
            "\n".join(
                [
                    "---",
                    "schema_version: firefly_work_status_v4",
                    "workflow_schema: anchored_story_loop_v3",
                    *profile_lines,
                    "work_slug: profile_fixture",
                    "target_episode: ep250",
                    f"current_episode: {current_episode}",
                    "current_b_arc: B001",
                    "---",
                    "",
                ]
            ),
            encoding="utf-8",
        )
        slot_count = route_slot_count or (84 if pacing_profile == "webnovel_1_to_3" else 2)
        slot_lines: list[str] = []
        for index in range(1, slot_count + 1):
            b_id = f"B{index:03d}"
            status = "active" if index == 1 else "provisional" if index == 2 else "hypothesis"
            slot_lines.extend(
                [
                    f"  - b_id: {b_id}",
                    f"    route_order: {index * 100}",
                    f"    status: {status}",
                    f"    target_anchor: A{min(12, ((index - 1) // 7) + 1):02d}",
                    f"    narrative_function: route_function_{index:03d}",
                    f"    payoff_axis: payoff_axis_{index:03d}",
                    "    carried_reader_debt: none",
                    f"    contrast_requirement: contrast_{index:03d}",
                ]
            )
        slot_yaml = "\n".join(slot_lines)
        effective_route_status = route_status or (
            "route_to_ending_ready" if pacing_profile == "webnovel_1_to_3" else "opening_baseline"
        )
        (story / "arc_route_rail.md").write_text(
            f"""# fixture

```yaml
schema_version: firefly_arc_route_rail_v1
route_to_ending: required
route_status: {effective_route_status}
arc_episode_cap: {cap}
active_b_arc: B001
next_b_arc: B002
hypothesis_detail_policy: durable_only
reflow_policy: revalidate_durable_invalidate_volatile
slots:
{slot_yaml}
```
""",
            encoding="utf-8",
        )
        (story / "rolling_corridor.md").write_text(
            f"""# fixture

```yaml
schema_version: firefly_rolling_corridor_v2
arc_episode_cap: {cap}
current_b_arc:
  b_id: B001
  status: active
  start_episode: ep001
  planned_end_episode: {hard_end}
  hard_end_episode: {hard_end}
  central_question: can_the_first_arc_close
  close_condition: the_transaction_changes_ownership
  anchor_contribution: A01
next_b_arc:
  b_id: B002
  status: provisional
  starts_after: B001_close
  episode_span: {span}
  function: escalate_after_close
  entry_dependency: B001_close
reflow_on_b_close:
  required: true
  trigger: owner_approved_arc_close
  b_rail_durable_fields: revalidate
  b_rail_volatile_fields: invalidate_and_rebuild
```
""",
            encoding="utf-8",
        )
        return work

    def run_smoke(self, work: Path, episode: int) -> subprocess.CompletedProcess[str]:
        return subprocess.run(
            [
                shutil.which("pwsh") or "pwsh",
                "-NoProfile",
                "-File",
                str(RELAY),
                "-Step",
                "arc-contract-smoke",
                "-WorkSlug",
                "profile_fixture",
                "-Episode",
                str(episode),
                "-WorkDir",
                str(work),
            ],
            cwd=ROOT,
            text=True,
            capture_output=True,
            check=False,
        )

    @unittest.skipUnless(shutil.which("pwsh"), "PowerShell is required for relay smoke")
    def test_relay_accepts_webnovel_profile_at_ep003_boundary(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            work = self.make_arc_fixture(
                Path(tmp),
                pacing_profile="webnovel_1_to_3",
                cap=3,
                span="1_to_3",
                current_episode="ep003",
                hard_end="ep003",
            )
            result = self.run_smoke(work, 3)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("arc pacing profile: webnovel_1_to_3", result.stdout)
        self.assertIn("episode cap: 3", result.stdout)

    @unittest.skipUnless(shutil.which("pwsh"), "PowerShell is required for relay smoke")
    def test_relay_rejects_requested_episode_after_ep003_boundary(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            work = self.make_arc_fixture(
                Path(tmp),
                pacing_profile="webnovel_1_to_3",
                cap=3,
                span="1_to_3",
                current_episode="ep004",
                hard_end="ep003",
            )
            result = self.run_smoke(work, 4)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("Requested episode is outside the active Story Arc", result.stdout + result.stderr)

    @unittest.skipUnless(shutil.which("pwsh"), "PowerShell is required for relay smoke")
    def test_relay_rejects_incomplete_webnovel_route_capacity(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            work = self.make_arc_fixture(
                Path(tmp),
                pacing_profile="webnovel_1_to_3",
                cap=3,
                span="1_to_3",
                current_episode="ep001",
                hard_end="ep003",
                route_slot_count=83,
            )
            result = self.run_smoke(work, 1)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("B-Rail route capacity is incomplete", result.stdout + result.stderr)

    @unittest.skipUnless(shutil.which("pwsh"), "PowerShell is required for relay smoke")
    def test_relay_rejects_scaffold_route_status_for_webnovel_profile(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            work = self.make_arc_fixture(
                Path(tmp),
                pacing_profile="webnovel_1_to_3",
                cap=3,
                span="1_to_3",
                current_episode="ep001",
                hard_end="ep003",
                route_status="scaffold_required",
            )
            result = self.run_smoke(work, 1)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("route_status must be route_to_ending_ready", result.stdout + result.stderr)

    @unittest.skipUnless(shutil.which("pwsh"), "PowerShell is required for relay smoke")
    def test_relay_rejects_unknown_arc_profile(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            work = self.make_arc_fixture(
                Path(tmp),
                pacing_profile="unknown_9_to_99",
                cap=3,
                span="1_to_3",
                current_episode="ep001",
                hard_end="ep003",
            )
            result = self.run_smoke(work, 1)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("Unknown arc_pacing_profile in status front matter", result.stdout + result.stderr)

    @unittest.skipUnless(shutil.which("pwsh"), "PowerShell is required for relay smoke")
    def test_relay_accepts_explicit_legacy_profile_at_cap_five(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            work = self.make_arc_fixture(
                Path(tmp),
                pacing_profile="legacy_1_to_5",
                cap=5,
                span="1_to_5",
                current_episode="ep005",
                hard_end="ep005",
                surface_profile=None,
            )
            result = self.run_smoke(work, 5)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("arc pacing profile: legacy_1_to_5", result.stdout)
        self.assertIn("episode cap: 5", result.stdout)

    @unittest.skipUnless(shutil.which("pwsh"), "PowerShell is required for relay smoke")
    def test_relay_rejects_plan_surface_with_legacy_pacing(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            work = self.make_arc_fixture(
                Path(tmp),
                pacing_profile="legacy_1_to_5",
                cap=5,
                span="1_to_5",
                current_episode="ep001",
                hard_end="ep005",
                surface_profile="plan_arc_manuscript_v1",
            )
            result = self.run_smoke(work, 1)
        self.assertNotEqual(result.returncode, 0)
        output = result.stdout + result.stderr
        self.assertIn("surface_profile=plan_arc_manuscript_v1 requires", output)
        self.assertIn("arc_pacing_profile=webnovel_1_to_3", output)

    @unittest.skipUnless(shutil.which("pwsh"), "PowerShell is required for relay smoke")
    def test_repository_legacy_fixture_uses_cap_five_fallback(self) -> None:
        work = ROOT / "tests" / "fixtures" / "hermes_e2e" / "foundry" / "40_works" / "sentinel_canary"
        result = subprocess.run(
            [
                shutil.which("pwsh") or "pwsh",
                "-NoProfile",
                "-File",
                str(RELAY),
                "-Step",
                "arc-contract-smoke",
                "-WorkSlug",
                "sentinel_canary",
                "-Episode",
                "4",
                "-WorkDir",
                str(work),
            ],
            cwd=ROOT,
            text=True,
            capture_output=True,
            check=False,
        )
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("surface profile: legacy_surface_compat", result.stdout)
        self.assertIn("arc pacing profile: legacy_1_to_5", result.stdout)
        self.assertIn("episode cap: 5", result.stdout)


if __name__ == "__main__":
    unittest.main()
