# 기사식당 ep001~003 owner adoption receipt

```yaml
decision_id: owner-adopt-all-20260725-knights-restaurant-v1-rc4
decision: ADOPT_ALL
decided_at: "2026-07-25T17:53:33+09:00"
owner_scope:
  frozen_pitch: approved
  story_plan: approved
  exact_manuscript_revision: v1-rc4
  episodes:
    - ep001
    - ep002
    - ep003
publication: false
storyyard_sync: false
manuscript_producer: web_gpt_pro
independent_br0_reviewer: google_gemini_pro
plan_compiler_and_br1_reviewer: codex_desktop
source_root: 20_model_runs/web_gpt_pro/restaurant_candidates_20260724/기사식당/v1-rc4
canon_note_required: false
```

## 승인 원고 무결성

| episode | source SHA-256 | canonical snapshot | authority |
|---|---|---|---|
| ep001 | `39abb22f6fa301781b87a5acbd719d953bd5725a9e63027075913b41e6b29a5f` | `../04_manuscript/ep001_manuscript.md` | `owner_approved` |
| ep002 | `adeb995cc16ce7dbe2fe71e78c7a220681daf8428f46e0bfe90553781614f23d` | `../04_manuscript/ep002_manuscript.md` | `owner_approved` |
| ep003 | `a4bc888a51b1597fc0a443fd5d06ae68c1a619cad7ccf6184e7d005206eef198` | `../04_manuscript/ep003_manuscript.md` | `owner_approved` |

- 승인 revision-set SHA-256: `68e646deef2eeae2d1075f7fc61e62f6372068d33fdae688491bd48f55d42975`
- 해시 recipe와 entry order의 정본: `../04_manuscript/manifest.yaml`
- 승인 원고 사실의 재생성 가능 투영: `../08_state/narrative_state.yaml`

## 감리 근거

| review | SHA-256 | verdict |
|---|---|---|
| `ep001-003_br0.md` | `1336ae7f6aec415780bf30e5095ed93ca23bb35985aec8004915a23c56b215a9` | PASS — 치명 산술·계약 오류 없음 |
| `ep001-003_br1.md` | `f3a390ef550e72828a6f9f6503cbd3d09263859995aa6fa86efc2a119e945b3c` | PASS — OWNER ADOPT DECISION RECORDED |

원고 생산자와 독립 BR0 감리자는 분리됐다. Story Plan compiler와 BR1 reviewer가 같은 Codex 계열이므로 최종 권위 행위는 owner가 직접 수행했고 이 receipt가 그 결정을 기록한다. BR0 원문의 `P0 (수정 없이 즉시...)` 표기는 심각도 용어 오사용이며 BR1에서 `blocking_defect: none`으로 정규화했다.

## 승격 범위

- `01_pitch/pitch.md`는 Frozen Pitch다.
- `02_story/`와 `03_episode_bet/ep001~003`은 승인된 작품 계획과 history 계약이다.
- `04_manuscript/ep001~003`만 현재 승인 원고 history다.
- ep004 이후의 정확한 사건·문장·음식·손님은 승인 원고가 아니다. ep004 Episode Bet을 먼저 작성·감리해야 한다.
- 로맨스 메인 축과 인물 연령은 후속 Story Plan 판정이며 승인 1~3화의 과거 사실로 소급하지 않는다.

## 최종 판정

`PASS — FROZEN PITCH AND EXACT v1-rc4 ep001~003 ADOPTED`

공개 발행, Storyyard 동기화, 커밋·푸시는 이 결정에 포함되지 않는다.
