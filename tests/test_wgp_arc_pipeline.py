from __future__ import annotations

import hashlib
import importlib.util
import tempfile
import unittest
from pathlib import Path


MODULE_PATH = Path(__file__).parents[1] / "tools" / "validate_wgp_arc_pipeline.py"
SPEC = importlib.util.spec_from_file_location("validate_wgp_arc_pipeline", MODULE_PATH)
assert SPEC and SPEC.loader
VALIDATOR = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(VALIDATOR)


class WgpArcPipelineTests(unittest.TestCase):
    def write_phase(self, root: Path, number: int, pass_value: str = "true") -> None:
        name, kind, arc_range, marker = VALIDATOR.PHASES[number]
        phase_root = root / name
        phase_root.mkdir(parents=True)
        raw = phase_root / "raw_response.md"
        raw.write_text(f"# synthetic fixture\n\n{marker}: {pass_value}\n", encoding="utf-8")
        digest = hashlib.sha256(raw.read_bytes()).hexdigest()
        (phase_root / "receipt.md").write_text(
            "---\n"
            "schema_version: firefly_wgp_arc_phase_receipt_v1\n"
            "work_slug: fixture_work\n"
            f"phase: {kind}\n"
            f"arc_range: {arc_range}\n"
            "phase_pass: true\n"
            "wgp_chat_url: https://chatgpt.com/c/fixture-chat\n"
            f"response_sha256: {digest}\n"
            "---\n",
            encoding="utf-8",
        )
        if kind == "design":
            ids = VALIDATOR.expected_ids(arc_range)
            (phase_root / "proposal.md").write_text(
                "\n".join(f"- b_id: {arc_id}" for arc_id in ids) + "\n",
                encoding="utf-8",
            )

    def test_five_arc_design_ranges_pass(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            for number in range(1, 5):
                self.write_phase(root, number)
            chat = None
            for number in range(1, 5):
                chat = VALIDATOR.verify_phase(root, "fixture_work", number, chat)
            self.assertEqual(chat, "https://chatgpt.com/c/fixture-chat")

    def test_review_false_blocks_the_next_phase(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            self.write_phase(root, 1, pass_value="false")
            with self.assertRaisesRegex(ValueError, "ARC_REVIEW_PASS: true"):
                VALIDATOR.verify_phase(root, "fixture_work", 1, None)

    def test_design_must_contain_exactly_five_ids(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            self.write_phase(root, 2)
            proposal = root / VALIDATOR.PHASES[2][0] / "proposal.md"
            proposal.write_text(proposal.read_text(encoding="utf-8") + "- b_id: B016\n", encoding="utf-8")
            with self.assertRaisesRegex(ValueError, "proposal IDs must be exactly"):
                VALIDATOR.verify_phase(root, "fixture_work", 2, None)


if __name__ == "__main__":
    unittest.main()
