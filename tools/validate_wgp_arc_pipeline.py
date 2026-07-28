#!/usr/bin/env python3
"""Fail-closed verifier for the staged Web GPT Pro B-Arc pipeline."""

from __future__ import annotations

import argparse
import hashlib
import re
import sys
from pathlib import Path


PHASES = {
    1: ("phase_01_b001_b010_review", "review", "B001-B010", "ARC_REVIEW_PASS"),
    2: ("phase_02_b011_b015_design", "design", "B011-B015", "ARC_DESIGN_COMPLETE"),
    3: ("phase_03_b011_b015_review", "review", "B011-B015", "ARC_REVIEW_PASS"),
    4: ("phase_04_b016_b020_design", "design", "B016-B020", "ARC_DESIGN_COMPLETE"),
    5: ("phase_05_b016_b020_review", "review", "B016-B020", "ARC_REVIEW_PASS"),
}


def fail(message: str) -> None:
    raise ValueError(message)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def front_matter(path: Path) -> dict[str, str]:
    text = path.read_text(encoding="utf-8")
    match = re.match(r"\A---[ \t]*\n(.*?)\n---(?:\n|\Z)", text, re.DOTALL)
    if not match:
        fail(f"{path}: missing YAML-style front matter")
    values: dict[str, str] = {}
    for line in match.group(1).splitlines():
        property_match = re.match(r"\s*([A-Za-z0-9_-]+)\s*:\s*(.*?)\s*$", line)
        if not property_match:
            continue
        key, value = property_match.groups()
        if key in values:
            fail(f"{path}: duplicate front matter key {key}")
        values[key] = value.strip().strip("\"'")
    return values


def expected_ids(arc_range: str) -> list[str]:
    match = re.fullmatch(r"B(\d{3})-B(\d{3})", arc_range)
    if not match:
        fail(f"invalid arc range {arc_range}")
    start, end = map(int, match.groups())
    return [f"B{number:03d}" for number in range(start, end + 1)]


def verify_phase(root: Path, work: str, number: int, chat_url: str | None) -> str:
    directory_name, phase_kind, arc_range, marker = PHASES[number]
    phase_root = root / directory_name
    raw_path = phase_root / "raw_response.md"
    receipt_path = phase_root / "receipt.md"
    if not raw_path.is_file():
        fail(f"phase {number}: missing {raw_path}")
    if not receipt_path.is_file():
        fail(f"phase {number}: missing {receipt_path}")

    raw = raw_path.read_text(encoding="utf-8")
    marker_matches = re.findall(rf"(?im)^\s*{re.escape(marker)}\s*:\s*(true|false)\s*$", raw)
    if len(marker_matches) != 1 or marker_matches[0].lower() != "true":
        fail(f"phase {number}: requires exactly one {marker}: true marker")

    receipt = front_matter(receipt_path)
    required = {
        "schema_version": "firefly_wgp_arc_phase_receipt_v1",
        "work_slug": work,
        "phase": phase_kind,
        "arc_range": arc_range,
        "phase_pass": "true",
    }
    for key, expected in required.items():
        if receipt.get(key) != expected:
            fail(f"phase {number}: receipt {key} must be {expected}")
    response_sha = receipt.get("response_sha256", "")
    if not re.fullmatch(r"[A-Fa-f0-9]{64}", response_sha) or response_sha.lower() != sha256(raw_path):
        fail(f"phase {number}: response SHA-256 mismatch")
    current_chat = receipt.get("wgp_chat_url", "")
    if not re.fullmatch(r"https://chatgpt\.com/c/[A-Za-z0-9-]+", current_chat):
        fail(f"phase {number}: invalid WGP chat URL")
    if chat_url and current_chat != chat_url:
        fail(f"phase {number}: WGP chat changed from {chat_url} to {current_chat}")

    if phase_kind == "design":
        proposal_path = phase_root / "proposal.md"
        if not proposal_path.is_file():
            fail(f"phase {number}: missing {proposal_path}")
        ids = sorted(set(re.findall(r"\bB\d{3}\b", proposal_path.read_text(encoding="utf-8"))))
        wanted = expected_ids(arc_range)
        if ids != wanted:
            fail(f"phase {number}: proposal IDs must be exactly {', '.join(wanted)}")
    return current_chat


def verify_final(foundry_root: Path, pipeline_root: Path, work: str, chat_url: str) -> None:
    pipeline_receipt = pipeline_root / "pipeline_receipt.md"
    if not pipeline_receipt.is_file():
        fail(f"missing final pipeline receipt: {pipeline_receipt}")
    receipt = front_matter(pipeline_receipt)
    if receipt.get("schema_version") != "firefly_wgp_arc_pipeline_receipt_v1":
        fail("final pipeline receipt schema mismatch")
    if receipt.get("work_slug") != work or receipt.get("pipeline_pass") != "true":
        fail("final pipeline receipt must bind the work and pipeline_pass: true")
    if receipt.get("wgp_chat_url") != chat_url:
        fail("final pipeline receipt WGP chat URL mismatch")

    route_path = foundry_root / "40_works" / work / "02_story" / "arc_route_rail.md"
    route_ids = set(re.findall(r"\bB\d{3}\b", route_path.read_text(encoding="utf-8")))
    missing = [arc_id for arc_id in expected_ids("B001-B020") if arc_id not in route_ids]
    if missing:
        fail(f"canonical A/B route is missing: {', '.join(missing)}")
    extension = foundry_root / "40_works" / work / "02_story" / "first_twenty_arc_route_extension.md"
    if not extension.is_file():
        fail(f"missing reviewed twenty-arc extension: {extension}")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--work", required=True)
    parser.add_argument("--pipeline-root", required=True)
    parser.add_argument("--through-phase", type=int, choices=range(1, 6), default=5)
    parser.add_argument("--foundry-root", default=".")
    args = parser.parse_args()

    foundry_root = Path(args.foundry_root).resolve()
    pipeline_root = (foundry_root / args.pipeline_root).resolve()
    try:
        pipeline_root.relative_to(foundry_root)
    except ValueError:
        fail("pipeline root escapes the Foundry root")

    chat_url: str | None = None
    for phase_number in range(1, args.through_phase + 1):
        chat_url = verify_phase(pipeline_root, args.work, phase_number, chat_url)
    if args.through_phase == 5:
        verify_final(foundry_root, pipeline_root, args.work, chat_url or "")
    print(f"PASS: {args.work} WGP arc pipeline through phase {args.through_phase}")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except ValueError as error:
        print(f"BLOCKED: {error}", file=sys.stderr)
        raise SystemExit(1)
