from __future__ import annotations

import hashlib
import json
from pathlib import Path
import shutil
import tempfile
import unittest

import yaml


ROOT = Path(__file__).resolve().parents[1]
TEMPLATE_FAMILY = ROOT / "45_screenworks" / "_template"
TEMPLATE_VARIANT = TEMPLATE_FAMILY / "variants" / "_template"

import sys

sys.path.insert(0, str(ROOT / "tools" / "screenplay_relay"))
from screenplay_doctor import Doctor  # noqa: E402


class ScreenplayLaneContractTests(unittest.TestCase):
    def test_template_passes_read_only_doctor(self) -> None:
        result = Doctor(TEMPLATE_VARIANT).run()
        self.assertTrue(result["ok"], result["diagnostics"])
        self.assertEqual(0, result["errors"])

    def test_doctor_rejects_novel_lane(self) -> None:
        result = Doctor(ROOT / "40_works" / "_template").run()
        self.assertFalse(result["ok"])
        self.assertEqual("scope.novel_forbidden", result["diagnostics"][0]["code"])

    def test_scene_id_mismatch_is_detected(self) -> None:
        with tempfile.TemporaryDirectory(dir=ROOT / "45_screenworks") as temp_dir:
            family = Path(temp_dir) / "family"
            shutil.copytree(TEMPLATE_FAMILY, family)
            variant = family / "variants" / "_template"
            metadata_path = variant / "06_timed_scripts" / "ep000_v001.scenes.json"
            metadata = json.loads(metadata_path.read_text(encoding="utf-8"))
            metadata["scenes"][0]["scene_id"] = "SCN-OTHER"
            metadata_path.write_text(
                json.dumps(metadata, ensure_ascii=False, indent=2) + "\n",
                encoding="utf-8",
            )
            result = Doctor(variant).run()
            codes = {item["code"] for item in result["diagnostics"]}
            self.assertIn("script.scene_id_mismatch", codes)

    def test_br1_requires_sealed_br0_for_exact_hash(self) -> None:
        with tempfile.TemporaryDirectory(dir=ROOT / "45_screenworks") as temp_dir:
            family = Path(temp_dir) / "family"
            shutil.copytree(TEMPLATE_FAMILY, family)
            variant = family / "variants" / "_template"
            review_path = variant / "07_reviews" / "review_manifest.yaml"
            review = yaml.safe_load(review_path.read_text(encoding="utf-8"))
            review["entries"] = [
                {
                    "review_stage": "BR1",
                    "episode_id": "ep001",
                    "script_sha256": "a" * 64,
                    "producer_family": "webgpt",
                    "reviewer_family": "codex",
                    "verdict": "pass",
                    "sealed_at": "2026-07-27T00:00:00+09:00",
                }
            ]
            review_path.write_text(
                yaml.safe_dump(review, allow_unicode=True, sort_keys=False),
                encoding="utf-8",
            )
            result = Doctor(variant).run()
            codes = {item["code"] for item in result["diagnostics"]}
            self.assertIn("review.br1_before_br0", codes)

    def test_exact_owner_approval_checks_file_hash_and_br1(self) -> None:
        with tempfile.TemporaryDirectory(dir=ROOT / "45_screenworks") as temp_dir:
            family = Path(temp_dir) / "family"
            shutil.copytree(TEMPLATE_FAMILY, family)
            variant = family / "variants" / "_template"
            candidate = variant / "06_timed_scripts" / "ep000_v001.fountain"
            script = variant / "08_approved_scripts" / "ep000_v001.fountain"
            shutil.copy2(candidate, script)
            digest = hashlib.sha256(script.read_bytes()).hexdigest()

            review_path = variant / "07_reviews" / "review_manifest.yaml"
            review = yaml.safe_load(review_path.read_text(encoding="utf-8"))
            review["entries"] = [
                {
                    "review_stage": "BR0",
                    "episode_id": "ep000",
                    "script_sha256": digest,
                    "producer_family": "webgpt",
                    "reviewer_family": "codex",
                    "verdict": "pass",
                    "sealed_at": "2026-07-27T00:00:00+09:00",
                },
                {
                    "review_stage": "BR1",
                    "episode_id": "ep000",
                    "script_sha256": digest,
                    "producer_family": "webgpt",
                    "reviewer_family": "codex",
                    "verdict": "pass",
                    "sealed_at": "2026-07-27T00:01:00+09:00",
                },
            ]
            review_path.write_text(
                yaml.safe_dump(review, allow_unicode=True, sort_keys=False),
                encoding="utf-8",
            )

            approval_path = variant / "08_approved_scripts" / "manifest.yaml"
            approval = yaml.safe_load(approval_path.read_text(encoding="utf-8"))
            approval["entries"] = [
                {
                    "episode_id": "ep000",
                    "revision": "v001",
                    "path": "08_approved_scripts/ep000_v001.fountain",
                    "sha256": digest,
                    "owner_approved": True,
                    "approved_at": "2026-07-27T00:02:00+09:00",
                    "approval_receipt": None,
                }
            ]
            approval_path.write_text(
                yaml.safe_dump(approval, allow_unicode=True, sort_keys=False),
                encoding="utf-8",
            )

            result = Doctor(variant).run()
            self.assertTrue(result["ok"], result["diagnostics"])

    def test_novel_loop_contract_files_remain_separate(self) -> None:
        screenplay_loop = (ROOT / "00_charter" / "screenplay_loop.md").read_text(encoding="utf-8")
        novel_status = (ROOT / "40_works" / "_template" / "00_status.md").read_text(encoding="utf-8")
        novel_relay = (ROOT / "tools" / "draft_relay" / "Invoke-DraftRelay.ps1").read_text(encoding="utf-8")
        self.assertIn("screen_stage", screenplay_loop)
        self.assertIn("production_stage: none", novel_status)
        self.assertIn("firefly_work_status_v4", novel_status)
        self.assertIn("production_stage=manuscript", novel_relay)
        self.assertNotIn("45_screenworks", novel_relay)


if __name__ == "__main__":
    unittest.main()
