---
schema_version: firefly_wgp_arc_pipeline_source_v1
work_slug: afterlife_restaurant
arc_range: B001-B010
target_episode: ep250
authority: owner_approved_story_plan_input
owner_decision_id: owner-afterlife-wgp-five-arc-gated-route-20260728
---

# 저승식당 B001~B010 WGP 감리 및 B011~B020 설계 입력

이 패킷은 원고 발주가 아니다. 현재 owner-approved A/B Story Plan을 먼저
감리하고, 통과했을 때만 다음 B를 다섯 개씩 설계·감리하기 위한 입력이다.

## 정확본 해시

| 파일 | SHA-256 |
|---|---|
| `40_works/afterlife_restaurant/00_status.md` | `c9688b505fda37130357f77454f4fd4fc149d8b290d59cbc244c1b86be6828fd` |
| `40_works/afterlife_restaurant/02_story/anchor_rail.md` | `17cb689598a06d78cc064fbc003f0ebdf70571df40e215d8288fe74565c54bf2` |
| `40_works/afterlife_restaurant/02_story/arc_route_rail.md` | `2b2f41d2e6c0d559e0e358b584e7e5685221a4b9083015e7aec2ace73ddb55e0` |
| `40_works/afterlife_restaurant/02_story/first_ten_arc_route_extension.md` | `fa707ae76c1538d2a5707b790cb3ffd2462ce26417412776cd2f11ac3cc9ef1f` |
| `40_works/afterlife_restaurant/02_story/rolling_corridor.md` | `b9a1cb229deef22d08999ce9e1ee3d6f067f1cb54adae5d0878ba282aff460e2` |
| `40_works/afterlife_restaurant/08_state/narrative_state.yaml` | `ed047c9c64b9b1ba051d6b9e5942638b3f04aef290534e624ed004d354b5d9fc` |

## 현재 정본

- 목표는 `ep250` 안팎 완결이다. 먼 B의 정확 화수·손님·음식·장면은 확정하지
  않고, 각 B closeout 뒤 reflow한다.
- 승인 원고와 Narrative State는 `ep004`까지다. `ep005` 원고나 Episode Bet은
  이번 작업에서 만들지 않는다.
- B001은 닫혔고 B002는 active다. B003은 provisional, B004~B010은
  owner-directed durable hypothesis다.
- 삼 년은 손님 수·완식 수·점수·게이지가 아니라 삼도식당에서 체감하는 실제
  기간이다. 도윤이 저승에 있는 동안 이승 수술실 시간은 멈춘다.
- 공주와 서하진은 별개 인물이다. 공주의 본명 `연화`, 가출 이유, 하진의 선택
  이유, 저승 우주론은 열어 둔다.
- 혀 없는 손님의 정확한 음식·관계 상대·혀를 잃은 이유는 열어 둔다.

## A-Rail

| anchor | 역할 | 비가역 환전 | 다음 압력 |
|---|---|---|---|
| A01 삼도식당의 첫 장사 | 삼 년 계약과 빈 식당에서 첫 영업 기반을 만든다 | 첫 손님, 첫 자본, 조달, 공주의 현장 동료화 | 식당을 일부러 찾는 이유 |
| A02 선택받는 식당 | 반복 영업의 신뢰와 경계를 만든다 | 사람들이 삼도식당의 기준을 알고 선택함 | 그 기준이 밀어내는 것과 거절 비용 |
| A03 남는 사람들의 계약 | 도윤·공주·하진이 책임을 회피하지 않는다 | 생환할 사람과 남을 사람의 관계 | 서로의 선택을 대신하지 않는 법 |
| A04 저승의 식당이 되는 비용 | 도움·거절·실수가 남기는 책임을 받는다 | 한 끼가 해결하지 못하는 손님을 대하는 기준 | 선의 이후의 실제 비용 |
| A05 삼 년의 중간 | 숫자 UI 없이 일상·부재·새 역할로 시간을 체감시킨다 | 귀환을 의식한 도윤의 현재 책임 | 귀환 준비가 관계를 훼손하는 압력 |
| A06 돌아갈 사람과 남을 식당 | 도윤 없이도 공동의 자리가 남을 가능성을 만든다 | 귀환 준비와 식당의 독립 | 떠남이 버림이 되지 않는 법 |
| A07 귀환 직전의 선택 | 생환 약속과 식당 책임을 동시에 시험한다 | 누구의 결정을 대신하지 않는 마지막 선택 | 계약 종료 |
| A08 생환 | 삼 년 계약을 닫는다 | 도윤은 멈춘 이승으로 돌아가고 관계는 각자 자리에서 이어짐 | 귀환 이후 감정적 여파 |

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

## 감리 기준

1. B001~B010이 A01→A02를 실제로 전진시키는가.
2. 각 B가 1~5화, 기본 약 3화로 닫힐 수 있으면서 기능이 겹치지 않는가.
3. 손님 감정 결산과 돈·재료·평판·역할·관계 중 하나의 운영 잔여물이 함께
   남는가.
4. 먼 계획이 정확한 손님·음식·장면·보상·화수로 과도하게 고정되지 않았는가.
5. ep250 용량을 향한 A03 이후 압력이 충분한가.
6. B011~B020은 B010의 구체 사건을 선결하지 않고 내구 필드만 제안할 수 있는가.

## 금지

- 원고, Episode Bet, 승인 원고, Narrative State, Rolling Corridor 수정
- Storyyard projection·publish·역동기화
- 새 WGP 채팅 생성, 동일 요청 재전송, 답변 재촉
- 정확한 먼 화수·손님·음식·장면·금액·저승 우주론 확정
- B011 이후 원고 제작 권한 또는 batch production approval로 해석
