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
| ep002 | `../04_manuscript/ep002_v2_manuscript.md` | `01802d4862a5b607f42b335c7a3126c0418a3ac2a2a406199f090d046d45595a` | owner-directed local revision |
| ep003 | `../04_manuscript/ep003_v3_manuscript.md` | `7138bace3e357d2e6369cdf27445c6c92e0a70bbf429632b88c7d4982ceb3f5a` | owner-directed scene-break revision |
| ep004 | `../04_manuscript/ep004_manuscript.md` | `f5ec74b51a97e76d2accf20a1b39bf00dc57d525df917876f35eae9c04b40dcc` | Web GPT Pro |

- revision-set SHA-256: `6a471ce7f3ab629dd3dae55603ff17a71d0479c1ef2fcf71f90cd18777adfeb4`
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
