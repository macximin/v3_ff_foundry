# 저승식당 ep001~004 owner 직접 승인 기록

```yaml
decision_id: owner-adopt-afterlife-restaurant-three-year-ep001-ep004-20260727-r2
decision: ADOPT
decided_at: "2026-07-27"
scope:
  exact_manuscript_revision:
    - ep001_v2_manuscript.md
    - ep002_v2_manuscript.md
    - ep003_v3_manuscript.md
    - ep004_manuscript.md
  canon_note: canon_note_003_three_year_return_contract.md
  story_plan: early_five_arc_plan.md
publication: false
review_mode: owner_direct_adoption_after_transport_qa
```

## 무결성

| episode | canonical snapshot | SHA-256 | producer |
|---|---|---|---|
| ep001 | `../04_manuscript/ep001_v2_manuscript.md` | `d8a017f4de5cea7f463983a22f84dcad4f298257df495a519362a6cd6d1f8a57` | owner-directed local revision |
| ep002 | `../04_manuscript/ep002_v2_manuscript.md` | `e0ada71ce768a01e14717f04f5615890d5c8a14777f096b5bc781c3f01ccb788` | owner-directed local revision |
| ep003 | `../04_manuscript/ep003_v3_manuscript.md` | `2d95ad8ee5d577941b974643c23371996d20aaccc4cd99e3a04b32d838611bd7` | owner-directed scene-break revision |
| ep004 | `../04_manuscript/ep004_manuscript.md` | `beecf896db49348e40d18c298567b80d95bc944061fbedcc7d1fc2542c9e8966` | Web GPT Pro |

- revision-set SHA-256: `23d336d3d3160267da6290ebc433f5e814b0d646e179453bac2b57be94315178`
- 정본 entry order와 recipe는 `../04_manuscript/manifest.yaml`에 있다.
- 이전 `ep001_manuscript.md`~`ep003_manuscript.md`와 당시 감리는 승인 history로 그대로 보존한다.

## 운송 QA

- ep001과 ep004 정본은 보존 원문과 바이트 단위로 일치한다.
- ep002는 후보 끝의 여분 빈 줄만 정규화했으며 본문 문자는 일치한다.
- ep003 v3는 v2 본문을 한 글자도 바꾸지 않고 `식당→황천장`, `황천장→식당` 경계에 단독 `***` 두 개만 추가했다.
- ep004 정본은 Web GPT Pro 응답 보존본과 바이트 단위로 일치한다.
- ep004의 장면전환 `***`는 2개이며 `---`는 없다.
- ep004에는 `1,095`, `1095`, `게이지`, `만족도`, `하루 적립`, 공주 본명 `연화`가 없다.
- 혀 없는 손님은 해결되거나 퇴장하지 않았다. 감각을 느낀 시험 음식을 마지막 식사로 거절하고, 다음 질문을 남긴 채 식당에 머문다.

## 감리 경계

이 승격은 owner의 직접 지시를 기록한다. 이번 운송 턴에서는 계획을 보지 않은 독립 BR0를 새로 수행하지 않았고, Codex는 정합성·형식·금지 설정·원문 무결성만 확인했다. 따라서 이 문서는 독립 감리를 가장하지 않으며 최종 권위는 owner 승인에 있다.

## 판정

`PASS — OWNER DIRECT ADOPTION RECORDED`
