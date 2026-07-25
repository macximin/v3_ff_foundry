# 저승식당 ep001~003 owner adoption receipt

```yaml
decision_id: owner-adopt-all-20260725-afterlife-restaurant-v1-rc3.2
decision: ADOPT_ALL
decided_at: "2026-07-25T10:51:32+09:00"
owner_scope:
  frozen_pitch: approved
  story_plan: approved
  exact_manuscript_revision: v1-rc3.2
  episodes:
    - ep001
    - ep002
    - ep003
publication: false
manuscript_producer: web_gpt_pro
reviewer: codex_desktop_gpt_5_6_terra
source_root: 20_model_runs/web_gpt_pro/restaurant_candidates_20260724/저승식당/v1-rc3.2
canon_note_required: false
```

## 승인 원고 무결성

| episode | source SHA-256 | canonical snapshot | authority |
|---|---|---|---|
| ep001 | `2b8d1bca981c1c7b0731c918e581b36ce7d4d1dc169bec4571311eab72eb241a` | `../04_manuscript/ep001_manuscript.md` | `owner_approved` |
| ep002 | `6baec3ac49cc771f6e9be445347bfda6faa5dea0de9281d6e1dbf33b8aebb94c` | `../04_manuscript/ep002_manuscript.md` | `owner_approved` |
| ep003 | `65ab2508218b7dfb1b462f2daa37d96712e307d9cc4ce554575675eca320d6ad` | `../04_manuscript/ep003_manuscript.md` | `owner_approved` |

- 승인 revision-set SHA-256: `4aa9de3ba689973cd86ba45377387024ca6d09ed2ac4e52eb6e22aa7a3483ea6`
- 해시 recipe와 entry order의 정본: `../04_manuscript/manifest.yaml`
- 승인 원고 사실의 재생성 가능 투영: `../08_state/narrative_state.yaml`

## 감리 근거

| review | SHA-256 | verdict |
|---|---|---|
| `ep001-003_br0.md` | `59f2224a38ebabf7acd0f76f39ea11cb35eae89d96321a48c01581b146ed939f` | BR0 complete; BR1 진행 가능 |
| `ep001-003_br1.md` | `2afa240c7ca8d3b8ab7568f8e22290bad4aa6e2b6380a028cb19d20aa24ae421` | PASS — OWNER ADOPT DECISION READY |

원고 생산자와 감리자는 분리됐다. Story Plan compiler와 BR1 reviewer가 같은 Codex 계열이므로 최종 권위 행위는 owner가 직접 수행했고, 이 receipt는 그 결정을 기록한다.

## 승격 범위

- `01_pitch/pitch.md`는 Frozen Pitch다.
- `02_story/`와 `03_episode_bet/ep001~003`은 승인된 작품 계획과 history 계약이다.
- `04_manuscript/ep001~003`만 현재 승인 원고 history다.
- `연화`, `곽진복`, 개인별 변동 노잣돈, 도윤의 식당 운영 공백은 승인된 미래 Story Plan이다. 1~3화 승인 원고에 아직 드러나지 않은 항목은 Narrative State의 과거 사실로 소급하지 않는다.
- ep004 이후 내용은 승인 원고가 아니다. ep004 Episode Bet을 먼저 작성·감리해야 한다.

## 최종 판정

`PASS — FROZEN PITCH AND EXACT v1-rc3.2 ep001~003 ADOPTED`

공개 발행과 원격 저장소 반영은 이 결정에 포함되지 않는다.
