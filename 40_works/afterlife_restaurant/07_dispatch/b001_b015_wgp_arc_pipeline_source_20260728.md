---
schema_version: firefly_wgp_arc_pipeline_source_v1
work_slug: afterlife_restaurant
arc_range: B001-B010
pipeline_target_range: B001-B015
target_episode: ep250
authority: owner_approved_story_plan_input
owner_decision_id: owner-afterlife-wgp-five-arc-to-b015-20260728
---

# 저승식당 B001~B010 감리 및 B011~B015 설계 입력

이 패킷은 원고 발주가 아니다. 현재 owner-approved A/B Story Plan을 먼저
감리하고, 통과했을 때만 B011~B015 다섯 개의 내구 가설을 설계·감리한다.
B016 이후 설계, Episode Bet, 원고, Storyyard 작업은 이번 범위가 아니다.

## 정확본 해시

| 파일 | SHA-256 |
|---|---|
| `40_works/afterlife_restaurant/00_status.md` | `c9688b505fda37130357f77454f4fd4fc149d8b290d59cbc244c1b86be6828fd` |
| `40_works/afterlife_restaurant/02_story/anchor_rail.md` | `17cb689598a06d78cc064fbc003f0ebdf70571df40e215d8288fe74565c54bf2` |
| `40_works/afterlife_restaurant/02_story/arc_route_rail.md` | `2b2f41d2e6c0d559e0e358b584e7e5685221a4b9083015e7aec2ace73ddb55e0` |
| `40_works/afterlife_restaurant/02_story/first_ten_arc_route_extension.md` | `fa707ae76c1538d2a5707b790cb3ffd2462ce26417412776cd2f11ac3cc9ef1f` |
| `40_works/afterlife_restaurant/02_story/rolling_corridor.md` | `b9a1cb229deef22d08999ce9e1ee3d6f067f1cb54adae5d0878ba282aff460e2` |
| `40_works/afterlife_restaurant/08_state/narrative_state.yaml` | `ed047c9c64b9b1ba051d6b9e5942638b3f04aef290534e624ed004d354b5d9fc` |

## 현재 승인 바닥

- 작품은 약 `ep250` 완결을 목표로 한다. 이는 먼 화수나 250화 분량의 B를
  지금 확정하라는 뜻이 아니다.
- 승인 원고와 Narrative State는 `ep004`까지다. B001은 닫혔고 B002는
  active, B003은 provisional, B004~B010은 owner-directed hypothesis다.
- 이번 작업은 Story Plan의 미래 전략만 다룬다. 승인 원고, Episode Bet,
  Narrative State, Rolling Corridor는 수정하지 않는다.
- 삼 년은 손님 수·완식 수·점수·게이지가 아니라 삼도식당에서 체감하는 실제
  기간이다. 도윤이 저승에 있는 동안 이승 수술실 시간은 멈춰 있다.
- 공주와 서하진은 별개 인물이다. 공주의 본명 `연화`, 가출 이유, 하진의 선택
  이유, 저승 우주론은 열린 값이다.
- 혀 없는 손님의 정확한 음식·관계 상대·혀를 잃은 이유도 열린 값이다.

## A-Rail

| Anchor | 역할 | 비가역 환전 | 다음 압력 |
|---|---|---|---|
| A01 삼도식당의 첫 장사 | 삼 년 계약과 빈 식당에서 첫 영업 기반을 만든다 | 첫 손님, 첫 자본, 조달, 공주의 현장 동료화 | 식당을 일부러 찾는 이유 |
| A02 선택받는 식당 | 반복 영업의 신뢰와 경계를 만든다 | 사람들이 삼도식당의 기준을 알고 선택함 | 그 기준이 밀어내는 것과 거절 비용 |
| A03 남는 사람들의 계약 | 도윤·공주·하진이 책임을 회피하지 않는다 | 생환할 사람과 남을 사람의 관계 | 서로의 선택을 대신하지 않는 법 |
| A04 저승의 식당이 되는 비용 | 도움·거절·실수가 남기는 책임을 받는다 | 한 끼가 해결하지 못하는 손님을 대하는 기준 | 선의 이후의 실제 비용 |
| A05 삼 년의 중간 | 일상·부재·새 역할로 시간 경과를 체감시킨다 | 귀환을 의식한 도윤의 현재 책임 | 귀환 준비가 관계를 훼손하는 압력 |
| A06 돌아갈 사람과 남을 식당 | 도윤 없이도 공동의 자리가 남을 가능성을 만든다 | 귀환 준비와 식당의 독립 | 떠남이 버림이 되지 않는 법 |
| A07 귀환 직전의 선택 | 생환 약속과 식당 책임을 동시에 시험한다 | 누구의 결정을 대신하지 않는 마지막 선택 | 계약 종료 |
| A08 생환 | 삼 년 계약을 닫는다 | 도윤은 멈춘 이승으로 돌아가고 관계는 각자 자리에서 이어짐 | 귀환 이후 감정적 여파 |

가장 가까운 A01~A02만 자세히 유지한다. A03 이후는 방향·비가역 환전·독자
부채 수준의 희소 앵커다. B011~B015 설계가 A-Rail을 몰래 추가·삭제하거나
엔딩을 바꾸면 안 된다.

## B001~B010 durable route

| B | 상태 | 중심 기능 | payoff | 남는 압력 |
|---|---|---|---|---|
| B001 | closed | 첫 손님을 배웅하고 첫 자본·공급 약속을 만든다 | 장사 가능한 최소 자산 | 삼 년 계약, 공주 정체 |
| B002 | active | 혀 없는 손님의 마지막 식사를 감각과 기억의 문제로 다시 푼다 | 공주의 의사소통 역할, 한 끼 감정 결산 | 매일 맛을 물은 사람과 음식 |
| B003 | provisional | 여러 테이블을 받는 첫 반복 영업 | 조리·홀 최소 운영 방식 | 손님 증가와 재료 소진 |
| B004 | hypothesis | 폐재료 공급을 지속 가능한 조달 관계로 시험 | 거래 기준, 장터 평판 | 공주를 알아본 바깥 압력 |
| B005 | hypothesis | 공주가 왕실 권한이 아닌 자기 선택으로 남는다 | 최소 팀의 외부 공인 | 왕실과 식당의 거리 |
| B006 | hypothesis | 일회성 완식과 다시 선택되는 신뢰를 구분 | 재방문·소개가 사람의 선택으로 남음 | 누구를 받는 식당인가 |
| B007 | hypothesis | 모든 부탁을 받지 않는 경계를 만든다 | 거절과 대안이 함께 있는 운영 기준 | 거절당한 사람과 포기한 이익 |
| B008 | hypothesis | 도움과 실수 뒤 책임을 하진과 확인 | 계약 결과를 피하지 않는 선택 | 하진과 저승 책임의 경계 |
| B009 | hypothesis | 공주가 왕실 권한이 아닌 현장 판단으로 부탁을 받는다 | 식당과 왕실의 거리 재설정 | 본명과 가출 이유 |
| B010 | hypothesis | 도윤과 공주가 서로의 선택을 대신하지 않는 공동 결정을 한다 | 역할 분담에서 공동 책임으로 이동 | 생환할 사람과 남을 식당 |

## B011~B015 설계 계약

정확히 다섯 B만 제안한다. 각 B는 하나의 중심 질문을 승인 원고 기준
1~5화 안에 비가역 결산하며 기본 리듬은 약 3화다. 각 B에는 다음 필드만 둔다.

- `b_id`
- `target_anchor`
- `narrative_function`
- `payoff_axis`
- `carried_reader_debt`
- `contrast_requirement`
- `cost_or_tradeoff`
- `episode_span: 1_to_5`
- `default_rhythm: about_3`
- `open_values`

B011~B015는 B010의 구체 사건을 선결하지 않으면서 A03 이후로 실질 전진해야
한다. B001~B010과 기능·보상·비용이 겹치지 않아야 한다. 손님 감정 결산과
돈·재료·평판·역할·관계 중 하나의 운영 잔여물이 함께 남아야 한다.

## 열린 값

- 정확한 회차 좌표
- 새 손님의 정체와 생전 사연
- 음식과 조리 해결책
- 장면 순서와 정확한 보상·금액
- 공주의 본명 공개 시점과 가출 이유
- 하진의 선택 이유와 저승 우주론

## 감리 판정

1. B001~B010이 A01→A02를 실제로 전진시키는가.
2. 각 B가 1~5화 안에 독립 결산하며 서로 다른 기능을 가지는가.
3. 감정 결산과 운영 잔여물이 함께 남는가.
4. 먼 계획이 열린 값을 과도하게 잠그지 않는가.
5. B011~B015가 A03 이후 압력과 `ep250` 장기 용량을 넓히는가.
6. 현재 B closeout 뒤 durable field를 재검증하고 volatile detail을 다시 쓸
   여지가 남아 있는가.

감리자는 치명·중요·경미 문제와 최소 필드 교정안을 분리한다. 현재 B001~B010
감리의 마지막 줄은 `ARC_REVIEW_PASS: true|false`, B011~B015 설계의 마지막
줄은 `ARC_DESIGN_COMPLETE: true|false`, 그 설계 감리의 마지막 줄은 다시
`ARC_REVIEW_PASS: true|false`로 쓴다.

