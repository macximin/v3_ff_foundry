# Restaurant candidate versioning

## Scope

- Candidates: `기사식당`, `저승식당`
- Producer: Web GPT Pro
- Independent reviewer: Codex Desktop `gpt-5.6-terra`
- Current state: noncanonical candidate

## Version flow

1. `source-v0`: supplied original episode files
2. `v1-rc1`: first full Web GPT Pro revision, frozen with response receipt and SHA-256 manifest
3. `v1-rc2`: only independently verified defects from `v1-rc1` are patched
4. `rc1-vs-rc2`: Codex textual diff and regression review
5. `ab-review`: a fresh Web GPT Pro conversation compares blinded A/B texts
6. `v1-rc3`: the A/B winner receives one bounded commercial-polish pass; exact responses are frozen and independently diff-reviewed
7. `post-rc3-review`: a fresh Web GPT Pro conversation reviews the unblinded `v1-rc3` manuscript as a release candidate
8. `v1-rc3.1`: only the two sentence-level consistency defects and the approved 2~3 episode compression from `post-rc3-review` are applied; exact responses are frozen and independently diff-reviewed
9. `canonical-recheck`: a fresh Web GPT Pro conversation reads only `v1-rc3.1` and decides whether it may enter owner Adopt review
10. `v1.0-canon`: created only after all gates pass and the owner explicitly approves promotion

## Gates

- A producer self-audit is evidence, not the final review gate.
- `v1-rc2` must preserve the established premise, voice, payoff scenes, episode titles, and commercial web-fiction priorities unless a patch specification explicitly requires a local change.
- `v1-rc3` must preserve the A/B-winning causal repairs and use the A/B opinion only for bounded pacing, character, and reward-calibration edits.
- `v1-rc3.1` must preserve every `v1-rc3` event and numeric chain while applying only the post-RC3 sentence fixes and approved explanation/reaction compression.
- A patch may not silently expand the supernatural or system rules.
- Every received full-text episode is stored exactly, hashed, and linked to its conversation receipt.
- Canon promotion is prohibited before:
  - the `rc1-vs-rc2` regression review passes;
  - the fresh A/B review prefers or accepts `rc2`;
  - the `v1-rc3` diff review and post-RC3 review pass;
  - the `v1-rc3.1` diff review passes and the canonical recheck has no unresolved manuscript condition;
  - the owner reads the comparison and explicitly approves promotion.
