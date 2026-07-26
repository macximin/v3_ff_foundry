# 기사식당 ep001~003 current owner adoption receipt

```yaml
decision_id: owner-adopt-all-20260726-knights-restaurant-v2
decision: ADOPT_REPLACEMENT
decided_at: "2026-07-26T15:01:22+09:00"
owner_scope:
  frozen_pitch: approved
  story_plan: approved
  exact_manuscript_revision: "ep001_v2 + ep002_retained + ep003_v2"
  episodes:
    - ep001
    - ep002
    - ep003
publication: false
storyyard_sync: false
manuscript_producer: web_gpt_pro
reviewer: codex_desktop
source_root: 20_model_runs/web_gpt_pro/restaurant_revision_20260726/knights_restaurant
canon_note_required: false
```

## 승인 원고 무결성

| episode | source SHA-256 | canonical snapshot | authority |
|---|---|---|---|
| ep001 | `667f7c1f671e17035df8061b5138ca8835e19f5deb3a1286eeaa6c72b66ba1c3` | `../04_manuscript/ep001_manuscript.md` | `owner_approved` |
| ep002 | `adeb995cc16ce7dbe2fe71e78c7a220681daf8428f46e0bfe90553781614f23d` | `../04_manuscript/ep002_manuscript.md` | `owner_approved` |
| ep003 | `b307ab921805bc5b1859d1ff007d846d1914f88d154ca19c238784392f27eb40` | `../04_manuscript/ep003_manuscript.md` | `owner_approved` |

- 승인 revision-set SHA-256: `12fe64579c23c6f78a567515c50a1634dfbbad5f4550d0060870557b6e96a596`
- 해시 recipe와 entry order의 정본: `../04_manuscript/manifest.yaml`
- 승인 원고 사실의 재생성 가능 투영: `../08_state/narrative_state.yaml`

## 감리 근거

| review | SHA-256 | verdict |
|---|---|---|
| `07_v2_codex_review/br0_blind_readback.md` | `0d55ee1afa340c5092453971ff16537481ca7a2e52c5241b57fb1c4669ebabe5` | PASS — 상업성·연속성·산술 재검 통과 |
| `07_v2_codex_review/br1_plan_aware_review.md` | `95e9bfd58e8a1322ebfbea79565e6b1b9c2035f88f851bbd0f8b53d3be51c9b7` | PASS — Story Plan과 상태 투영 대조 통과 |

원고 생산자는 Web GPT Pro, 감리자는 Codex Desktop으로 분리됐다. 2화의 본문 SHA는 기존 승인본을 유지했지만, 세 화를 하나의 현행 revision set으로 승인한 owner 결정에 함께 귀속한다.

## 승격 범위

- `01_pitch/pitch.md`는 Frozen Pitch다.
- `02_story/`와 `03_episode_bet/ep001~003`은 승인된 작품 계획과 history 계약이다.
- `04_manuscript/ep001~003`만 현재 승인 원고 history다.
- ep004 이후의 정확한 사건·문장·음식·손님은 승인 원고가 아니다. ep004 Episode Bet을 먼저 작성·감리해야 한다.
- 로맨스 메인 축과 인물 연령은 후속 Story Plan 판정이며 승인 1~3화의 과거 사실로 소급하지 않는다.

## 최종 판정

`PASS — FROZEN PITCH, STORY PLAN, AND EXACT ep001 v2 + ep002 retained + ep003 v2 ADOPTED`

공개 발행, Storyyard 동기화, 커밋·푸시는 별도 권위 행위다.
