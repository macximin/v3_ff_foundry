from __future__ import annotations

import importlib.util
import tempfile
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
FIXTURE_DIR = ROOT / "tests" / "fixtures" / "hermes_e2e"
VERIFIER_PATH = FIXTURE_DIR / "verify_candidate.py"

SPEC = importlib.util.spec_from_file_location("verify_hermes_e2e_candidate", VERIFIER_PATH)
assert SPEC is not None and SPEC.loader is not None
VERIFIER = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(VERIFIER)


VALID_CANDIDATE = """---
fixture_contract: firefly_hermes_e2e_canary_v1
work_slug: sentinel_canary
episode: ep004
authority: noncanonical_test_artifact
production_eligible: false
storyyard_publishable: false
---

# Hermes E2E canary candidate

CANARY_TOKEN: FIREFLY_HERMES_E2E_SENTINEL_CANARY_V1

Writer profile: author_cheese

Result: local ticket-to-artifact wiring verified
"""


class HermesE2EFixtureTests(unittest.TestCase):
    def test_fixture_contract_is_self_consistent(self) -> None:
        result = VERIFIER.verify_fixture(FIXTURE_DIR / "foundry")
        self.assertTrue(result["valid"])
        self.assertTrue(result["fixture_only"])
        self.assertEqual(result["writer_profile"], "author_cheese")
        self.assertEqual(result["b_arc_count"], 50)

    def test_generated_candidate_verifier_accepts_only_ignored_runtime_path(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            fixture_root = Path(temporary)
            runtime = fixture_root / ".runtime"
            runtime.mkdir()
            candidate = runtime / "ep004_candidate.md"
            candidate.write_text(VALID_CANDIDATE, encoding="utf-8")

            result = VERIFIER.verify_candidate(fixture_root, candidate)

            self.assertTrue(result["valid"])
            self.assertTrue(result["fixture_only"])
            self.assertEqual(result["candidate"], ".runtime/ep004_candidate.md")
            self.assertEqual(len(result["sha256"]), 64)

    def test_generated_candidate_verifier_rejects_production_markers(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            fixture_root = Path(temporary)
            runtime = fixture_root / ".runtime"
            runtime.mkdir()
            candidate = runtime / "ep004_candidate.md"
            candidate.write_text(
                VALID_CANDIDATE.replace(
                    "authority: noncanonical_test_artifact",
                    "authority: owner_approved",
                ),
                encoding="utf-8",
            )

            with self.assertRaises(VERIFIER.FixtureVerificationError):
                VERIFIER.verify_candidate(fixture_root, candidate)

    def test_generated_candidate_verifier_rejects_output_outside_runtime(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            fixture_root = Path(temporary)
            candidate = fixture_root / "ep004_candidate.md"
            candidate.write_text(VALID_CANDIDATE, encoding="utf-8")

            with self.assertRaises(VERIFIER.FixtureVerificationError):
                VERIFIER.verify_candidate(fixture_root, candidate)


if __name__ == "__main__":
    unittest.main()
