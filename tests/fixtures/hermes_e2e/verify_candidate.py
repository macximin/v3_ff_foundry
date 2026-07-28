#!/usr/bin/env python3
"""Validate the non-production Hermes ticket-to-artifact fixture."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from pathlib import Path


FIXTURE_CONTRACT = "firefly_hermes_e2e_canary_v1"
CANARY_TOKEN = "FIREFLY_HERMES_E2E_SENTINEL_CANARY_V1"
EXPECTED_CANDIDATE = Path(".runtime/ep004_candidate.md")
EXPECTED_B_IDS = {f"B{number:03d}" for number in range(1, 51)}


class FixtureVerificationError(ValueError):
    """Raised when fixture or candidate evidence is unsafe or incomplete."""


def sha256_path(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def require(condition: bool, message: str) -> None:
    if not condition:
        raise FixtureVerificationError(message)


def verify_fixture(fixture_root: Path) -> dict[str, object]:
    root = fixture_root.resolve()
    marker = root / "FIXTURE_ONLY.md"
    registry_path = root / "00_charter/hermes_writer_operations.json"
    instruction_path = root / "instructions/ep004_canary.md"
    wgp_receipt_path = root / "receipts/ep004_wgp.md"
    ticket_path = root / "ticket.fixture.json"
    anchor_path = root / "40_works/sentinel_canary/02_story/anchor_rail.md"
    b_rail_path = root / "40_works/sentinel_canary/02_story/arc_route_rail.md"
    runtime_ignore = root / ".runtime/.gitignore"

    for required_path in (
        marker,
        registry_path,
        instruction_path,
        wgp_receipt_path,
        ticket_path,
        anchor_path,
        b_rail_path,
        runtime_ignore,
    ):
        require(required_path.is_file(), f"missing fixture file: {required_path}")

    require(
        "NON-PRODUCTION FIXTURE ONLY" in marker.read_text(encoding="utf-8"),
        "fixture marker is missing the non-production declaration",
    )
    instruction_text = instruction_path.read_text(encoding="utf-8")
    for required_line in (
        "execution_runtime: Hermes",
        "producer_lane: hermes_owner_selected_alternate",
        "producer_decision_id: fixture-only-hermes-producer-decision-do-not-promote",
    ):
        require(required_line in instruction_text, f"fixture instruction is missing: {required_line}")

    registry = json.loads(registry_path.read_text(encoding="utf-8"))
    require(registry.get("fixtureOnly") is True, "fixture registry must set fixtureOnly=true")
    assignments = registry.get("assignments", [])
    require(len(assignments) == 1, "fixture registry must contain exactly one assignment")
    assignment = assignments[0]
    require(assignment.get("workSlug") == "sentinel_canary", "fixture assignment work mismatch")
    require(assignment.get("writerProfile") == "author_cheese", "fixture writer must be author_cheese")
    require(bool(assignment.get("assignmentDecisionId")), "fixture assignment decision is missing")
    batches = registry.get("batches", [])
    require(len(batches) == 1, "fixture registry must contain exactly one batch")
    require(batches[0].get("workSlug") == "sentinel_canary", "fixture batch work mismatch")
    require(batches[0].get("activeBatch") == 1, "fixture batch must be 1")
    require(bool(batches[0].get("approvalDecisionId")), "fixture batch decision is missing")

    ticket = json.loads(ticket_path.read_text(encoding="utf-8"))
    require(ticket.get("fixtureOnly") is True, "ticket fixture must set fixtureOnly=true")
    require(ticket.get("productionQueueEligible") is False, "ticket fixture must block production queue")
    require(
        ticket.get("fixtureWgpReceipt")
        == "tests/fixtures/hermes_e2e/foundry/receipts/ep004_wgp.md",
        "fixture WGP receipt path changed",
    )
    require(
        ticket.get("fixtureWgpReceiptSha256") == sha256_path(wgp_receipt_path),
        "fixture WGP receipt SHA-256 does not match",
    )
    require(
        "fixture_only: true" in wgp_receipt_path.read_text(encoding="utf-8"),
        "fixture WGP receipt must remain non-production",
    )
    properties = ticket.get("ticketProperties", {})
    expected_properties = {
        "Target repo": "v3_ff_foundry",
        "Hermes profile": "author_cheese",
        "Execution runtime": "Hermes",
        "Firefly environment": "canary",
        "Resume policy": "New session",
        "Instruction MD path": "tests/fixtures/hermes_e2e/foundry/instructions/ep004_canary.md",
        "Firefly work slug": "sentinel_canary",
        "Firefly B arc": "B001",
        "Firefly arc batch": 1,
        "Firefly episode": "ep004",
        "Firefly operation": "manuscript",
    }
    for name, expected in expected_properties.items():
        require(properties.get(name) == expected, f"ticket property mismatch: {name}")
    require(
        properties.get("Instruction MD SHA-256") == sha256_path(instruction_path),
        "instruction SHA-256 does not match ticket fixture",
    )
    require(properties.get("Automation mode") == "Manual", "fixture ticket must remain Manual")
    require(properties.get("Execution mode") == "Manual", "fixture execution must remain Manual")
    require(properties.get("Allowed actions") == ["edit", "test"], "fixture actions must remain edit/test only")
    require(
        properties.get("Workspace path") == "__V3_FF_FOUNDRY_ROOT__",
        "fixture Workspace path token changed",
    )
    require(
        properties.get("File scope")
        == "tests/fixtures/hermes_e2e/foundry/.runtime/ep004_candidate.md",
        "fixture File scope must remain inside the ignored canary runtime",
    )
    require(properties.get("External action conditions") == "No external transmission", "external action must be closed")

    b_rail_text = b_rail_path.read_text(encoding="utf-8")
    b_ids = set(re.findall(r"\bB\d{3}\b", b_rail_text))
    require(b_ids == EXPECTED_B_IDS, "fixture B-Rail must contain exactly B001 through B050")
    require("fixture_only: true" in b_rail_text, "fixture B-Rail marker is missing")
    require("fixture_only" in anchor_path.read_text(encoding="utf-8"), "fixture A-Rail marker is missing")
    require(runtime_ignore.read_text(encoding="utf-8").splitlines() == ["*", "!.gitignore"], "runtime ignore contract changed")

    return {
        "valid": True,
        "fixture_only": True,
        "work_slug": "sentinel_canary",
        "writer_profile": "author_cheese",
        "episode": "ep004",
        "b_arc_count": len(b_ids),
        "instruction_sha256": sha256_path(instruction_path),
    }


def parse_front_matter(text: str) -> dict[str, str]:
    match = re.match(r"\A---\r?\n(?P<body>.*?)\r?\n---(?:\r?\n|\Z)", text, re.DOTALL)
    require(match is not None, "candidate must start with YAML-style front matter")
    values: dict[str, str] = {}
    for line in match.group("body").splitlines():
        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        values[key.strip()] = value.strip()
    return values


def verify_candidate(fixture_root: Path, candidate_path: Path) -> dict[str, object]:
    root = fixture_root.resolve()
    expected = (root / EXPECTED_CANDIDATE).resolve()
    candidate = candidate_path.resolve()
    require(candidate == expected, f"candidate path must be exactly {expected}")
    require(candidate.is_file(), f"candidate is missing: {candidate}")
    payload = candidate.read_bytes()
    require(len(payload) <= 16_384, "fixture candidate exceeds 16 KiB")
    try:
        text = payload.decode("utf-8")
    except UnicodeDecodeError as error:
        raise FixtureVerificationError("candidate must be UTF-8") from error

    front_matter = parse_front_matter(text)
    expected_metadata = {
        "fixture_contract": FIXTURE_CONTRACT,
        "work_slug": "sentinel_canary",
        "episode": "ep004",
        "authority": "noncanonical_test_artifact",
        "production_eligible": "false",
        "storyyard_publishable": "false",
    }
    for name, expected_value in expected_metadata.items():
        require(front_matter.get(name) == expected_value, f"candidate metadata mismatch: {name}")

    require(text.count(CANARY_TOKEN) == 1, "candidate must contain the canary token exactly once")
    require(text.count("Writer profile: author_cheese") == 1, "candidate must name author_cheese exactly once")
    require(
        text.count("Result: local ticket-to-artifact wiring verified") == 1,
        "candidate must contain the exact local verification result",
    )
    lowered = text.lower()
    for forbidden in (
        "authority: owner_approved",
        "authority: canonical",
        "production_eligible: true",
        "storyyard_publishable: true",
        "published: true",
    ):
        require(forbidden not in lowered, f"candidate contains forbidden production marker: {forbidden}")

    return {
        "valid": True,
        "fixture_only": True,
        "candidate": EXPECTED_CANDIDATE.as_posix(),
        "sha256": hashlib.sha256(payload).hexdigest(),
        "bytes": len(payload),
    }


def main() -> int:
    script_root = Path(__file__).resolve().parent
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--fixture-root",
        type=Path,
        default=script_root / "foundry",
        help="Synthetic Foundry fixture root",
    )
    parser.add_argument(
        "--candidate",
        type=Path,
        default=None,
        help="Generated ignored candidate path",
    )
    parser.add_argument(
        "--fixture-only",
        action="store_true",
        help="Verify fixture inputs without requiring a generated candidate",
    )
    args = parser.parse_args()

    try:
        result = verify_fixture(args.fixture_root)
        if not args.fixture_only:
            candidate = args.candidate or (args.fixture_root / EXPECTED_CANDIDATE)
            result["candidate_receipt"] = verify_candidate(args.fixture_root, candidate)
    except (FixtureVerificationError, OSError, json.JSONDecodeError) as error:
        print(json.dumps({"valid": False, "error": str(error)}, ensure_ascii=False))
        return 1

    print(json.dumps(result, ensure_ascii=False, sort_keys=True))
    return 0


if __name__ == "__main__":
    sys.exit(main())
