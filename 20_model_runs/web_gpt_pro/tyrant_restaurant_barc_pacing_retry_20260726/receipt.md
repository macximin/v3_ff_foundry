# Web GPT Pro receipt — 폭군식당 B-Arc pacing retry

```yaml
work_slug: tyrant_restaurant
run_id: tyrant_restaurant_barc_pacing_retry_20260726
producer: web_gpt_pro
purpose: attachment-readback gate, then one B-Arc candidate dispatch only if passed
status: preflight
source_run: tyrant_restaurant_barc_pacing_20260726
promotion: not_started
owner_constraints:
  manuscript_body_korean_characters: 4000_to_8000_inclusive
  count_includes: [all Korean characters, spaces]
  count_excludes: [title, metadata_front_matter, receipts, scene_break_control_markers]
```

## Recovery gate

The source run has been preserved as fail-closed. This retry may proceed exactly once only after the Web GPT chat visibly shows all 11 actual local file chips and returns a source readback containing real text evidence from each of the three successful originals. No B-Arc request will be sent if that readback fails.

## Planned actual-file inputs

| group | files |
|---|---:|
| successful originals | 3 cached TXT files |
| current owner-approved manuscript | ep001, ep002, ep003 (3 actual Markdown files; no historical candidates) |
| current planning/state | Narrative State + Living Spine + A-Rail + B-Rail + Rolling Corridor (5 files) |

## Event log

| time | event | result |
|---|---|---|
| 2026-07-26T21:44:xx+09:00 | recovery authorization | exactly one retry allowed; attachment-readback gate required before B-Arc dispatch |
| 2026-07-26T21:5x+09:00 | native-UI critical section acquired | `/tmp/firefly_chrome_native_ui.lock` held while 11 local files were selected/uploaded |
| 2026-07-26T21:5x+09:00 | actual file chips verified | 11 visible: three originals, ep001–ep003, Narrative State, Living Spine, A-Rail, B-Rail, Rolling Corridor |
| 2026-07-26T21:5x+09:00 | native-UI critical section released | lock removed immediately after attachment verification |
| 2026-07-26T21:5x+09:00 | attachment-readback sent | one gate-only request; no B-Arc generation requested |
| 2026-07-26T22:0x+09:00 | attachment-readback passed | Web GPT reported all 11 direct files opened as UTF-8; supplied two actual short textual anchors for each successful original and identifiable state facts for all current-work inputs |
| 2026-07-26T22:0x+09:00 | B-Arc dispatch submitted once | same verified-attachment chat; includes the owner 4,000–8,000 Korean-character body constraint and required layout review check |
| 2026-07-26T22:0x+09:00 | 5-minute heartbeat activated | existing `web-gpt-pro-5` heartbeat updated to this single retry chat; no duplicate automation created |
| 2026-07-26T22:08:49+09:00 | B-Arc response completed | one response after 17m 3s; raw text preserved unchanged as `raw_response.md` |
| 2026-07-26T22:08:49+09:00 | raw-response integrity | SHA-256 `d2124fdefd15bc90e14b5e0c91f895df5d3f39225737aead0a061451f3127698` (20,805 characters) |
| 2026-07-26T22:08:49+09:00 | independent assessment created | `proposal_assessment.md`; no canonical or Storyyard surface modified |
