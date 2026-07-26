# 폭군식당 ep001~003 owner adoption receipt

```yaml
decision_id: owner-adopt-all-20260726-tyrant-restaurant-v2
decision: ADOPT_ALL
decided_at: "2026-07-26T14:59:09+09:00"
owner_scope:
  frozen_pitch: approved
  story_plan: approved
  exact_manuscript_revision: "ep001_revised + ep002_revised + ep003_v2_revised"
  episodes: [ep001, ep002, ep003]
publication: false
storyyard_sync: false
manuscript_producer: web_gpt_pro
reviewer: codex_desktop
source_root: 20_model_runs/web_gpt_pro/restaurant_revision_20260726/tyrant_restaurant
canon_note_required: false
```

## 승인 원고 무결성

| episode | source SHA-256 | canonical snapshot | authority |
|---|---|---|---|
| ep001 | `127efdd4a70bdfbca0e313b05fe9a642ebcb9c40c5cfa4fb7384b87d11fd54ac` | `../04_manuscript/ep001_manuscript.md` | `owner_approved` |
| ep002 | `a86b7fa75219f9356d0155594aa4b4d8c0ddeccdabe4cda388540e4b0393e60d` | `../04_manuscript/ep002_manuscript.md` | `owner_approved` |
| ep003 | `4968744ccb5ec55ac472efa48b9c2bfa07fe93da0c6bf21d27cc688ecb47a39d` | `../04_manuscript/ep003_manuscript.md` | `owner_approved` |

- 승인 revision-set SHA-256: `abab318a104088bfadcf2f1f9c161eaba1b544b5cc1248569bfe8fa01e8bbb0b`
- entry order와 recipe의 정본: `../04_manuscript/manifest.yaml`
- 승인 원고 사실의 재생성 가능 투영: `../08_state/narrative_state.yaml`

## 감리 근거

| review | SHA-256 | verdict |
|---|---|---|
| `br0_v2_review.md` | `c1cab42a63c758bc74262148ce1b241c3a0dd041b244136848a34caffa4d03f4` | PASS — ep001·ep002와 압축된 ep003 v2를 원고만으로 재복원 |
| `br1_v2_review.md` | `40b935dfdef640bfae28a5167ec93738eb9c1a55c9b2a7d60967cea81aaa09be` | PASS — 상업성 재감리 MUST 및 REVISE 보존 계약 충족 |

생산자는 Web GPT Pro, 감리자는 Codex Desktop으로 분리됐다. 최종 권위 행위는 owner가 직접 수행했고 이 receipt가 그 결정을 기록한다.

## 승격 범위

- `01_pitch/pitch.md`는 Frozen Pitch다.
- `02_story/` 및 `03_episode_bet/ep001~003`은 승인 원고에서 역복원한 history 계약이다.
- `04_manuscript/ep001~003`만 현재 승인 원고 history다.
- ep004 이후의 정확한 사건·문장·메뉴·인물 추가는 승인 원고가 아니다. B001의 ep004 Episode Bet을 먼저 작성·감리한다.

## 최종 판정

`PASS — FROZEN PITCH, STORY PLAN, AND EXACT ep001~003 REVISIONS ADOPTED`

공개 발행, Storyyard 동기화, Git stage/commit/push는 이 결정에 포함되지 않는다.
