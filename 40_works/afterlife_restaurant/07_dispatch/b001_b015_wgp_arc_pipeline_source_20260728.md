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
| `40_works/afterlife_restaurant/02_story/arc_route_rail.md` | `022bf47780c98125d61c8bd3f3540fc8bb4e7ca48df6a4dd4fc6416bbd74a289` |
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

## 1차 감리 뒤 supervisor 최소 교정

- 이전 WGP raw SHA-256:
  `e7f4e7de6b4cec6df18f78a2072fafd4f4814d0c220cc5aa70d703dc1f9b6aee`
- 이전 판정은 `ARC_REVIEW_PASS: false`였다.
- supervisor는 그 원응답을 정본과 독립 대조한 뒤 B001~B010에 누락된
  `cost_or_tradeoff`, `episode_span`, `default_rhythm`, `open_values`를
  보강했다.
- B002의 현재 핵심 미스터리는 `open_values`로 옮겼고, B004/B001,
  B005/B009, B008/B010의 대비 조건을 분리했다.
- B003 이후에도 손님 감정 결산과 운영 잔여물이 함께 보이도록
  `payoff_axis`를 보강했다.
- 정확한 먼 손님·음식·사건·화수·금액·우주론은 새로 확정하지 않았다.

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

모든 B는 `episode_span: 1_to_5`, `default_rhythm: about_3`를 가진다.
B001의 실제 닫힌 이력은 `ep001~003`이다.

### B001 · closed · A01

- `narrative_function`: 첫 손님 배웅, 첫 자본, 첫 공급 약속
- `payoff_axis`: 손님 완식·배웅 / 최소 자산·공급 약속
- `carried_reader_debt`: 공급 약속을 반복 조달로 바꿀 수 있는가
- `contrast_requirement`: 첫 개인 손님 결산
- `cost_or_tradeoff`: 공급 약속의 이행·검수 책임
- `open_values`: 삼 년 계약의 이후 체감, 공주 정체 공개 시점

### B002 · active · A01

- `narrative_function`: 혀 없는 손님의 마지막 식사를 감각과 기억으로 다시 푼다
- `payoff_axis`: 손님의 한 끼·하지 못한 대답 / 공주의 주문·의사소통 역할
- `carried_reader_debt`: 의사 확인 방식을 반복 영업에서도 지킬 수 있는가
- `contrast_requirement`: 감각 전달 성공과 손님 해결을 같게 두지 않는다
- `cost_or_tradeoff`: 첫 해법의 재료·시간과 해결·대금 수령 지연
- `open_values`: 매일 맛을 물은 사람, 음식, 혀를 잃은 이유

### B003 · provisional · A01

- `narrative_function`: 여러 테이블을 받는 첫 반복 영업
- `payoff_axis`: 대표 손님의 개인 결산 / 조리·홀·대기 운영 방식
- `carried_reader_debt`: 반복 영업에서도 개인의 마지막 식사를 지킬 수 있는가
- `contrast_requirement`: 한 명의 마지막 식사에서 동시 영업으로 이동
- `cost_or_tradeoff`: 대기·품질·재고 중 하나의 실제 손실
- `open_values`: 손님 수·정체, 음식, 손실 종류·규모

### B004 · hypothesis · A01

- `narrative_function`: 첫 공급 기회를 반복 입고의 이행·검수 조달로 시험
- `payoff_axis`: 조달 기준이 손님 한 끼에 남긴 결과 / 거래·검수 기준과 평판
- `carried_reader_debt`: 공주의 얼굴을 알아본 바깥 압력
- `contrast_requirement`: B001 첫 약속이 아닌 반복 이행의 품질·거절·부담 검증
- `cost_or_tradeoff`: 기준 미달 재료나 유리한 거래를 거절한 공급·평판 부담
- `open_values`: 공급자, 재료, 검수 실패, 거래 조건

### B005 · hypothesis · A01_to_A02_bridge

- `narrative_function`: 공주가 왕실 권한 아닌 자기 선택으로 남는다
- `payoff_axis`: 실제 손님의 선택을 팀으로 결산 / 소속 선택과 최소 팀 외부 공인
- `carried_reader_debt`: 왕실과 식당의 장기 거리
- `contrast_requirement`: B009 판단권이 아니라 어디에 속할지 공개적으로 선택
- `cost_or_tradeoff`: 왕실 편의를 포기하고 외부 압력을 팀이 함께 받음
- `open_values`: 손님, 외부 압력, 공주 본명·가출 이유

### B006 · hypothesis · A02

- `narrative_function`: 일회성 완식과 다시 선택되는 신뢰를 구분
- `payoff_axis`: 사람의 선택·소개·관계 변화 / 신뢰와 높아진 기대
- `carried_reader_debt`: 누구를 어떻게 받을 식당인가
- `contrast_requirement`: 동일 망자 귀환이 아닌 사람의 선택으로 반복 신뢰 증명
- `cost_or_tradeoff`: 높아진 기대·수용 압력 또는 쉽게 받을 부탁의 포기
- `open_values`: 선택·소개 방식, 손님, 음식, 보상

### B007 · hypothesis · A02

- `narrative_function`: 모든 부탁을 받지 않는 경계
- `payoff_axis`: 거절당한 사람의 선택·대안 수용 / 거절·대기·우선순위 기준
- `carried_reader_debt`: 다음 부탁에도 같은 기준을 적용할 수 있는가
- `contrast_requirement`: 요리 기술로 모든 문제를 풀지 않는다
- `cost_or_tradeoff`: 포기한 즉시 이익 또는 관계 불편
- `open_values`: 부탁, 손님, 대안, 포기한 이익

### B008 · hypothesis · A02

- `narrative_function`: 이미 발생한 결과에 대한 식당·하진의 책임 범위 확인
- `payoff_axis`: 도움만으로 해결되지 않은 사람의 결산 / 사후 외부 책임 기준
- `carried_reader_debt`: 하진 선택 이유와 저승 책임 경계
- `contrast_requirement`: B010 사전 결정이 아닌 벌어진 결과의 외부 책임
- `cost_or_tradeoff`: 평판·재료·관계 중 하나가 줄거나 보류됨
- `open_values`: 손님·결과, 하진 선택 이유, 계약 전문, 저승 우주론

### B009 · hypothesis · A02

- `narrative_function`: 공주가 현장 판단으로 궁 밖의 부탁을 받는다
- `payoff_axis`: 부탁한 사람의 선택·결과 / 공주의 요청 수령·결과 감당 판단권
- `carried_reader_debt`: 식당과 왕실의 거리를 어떤 기준으로 유지할 것인가
- `contrast_requirement`: B005 소속 선택이 아닌 이미 팀인 공주의 현장 판단
- `cost_or_tradeoff`: 왕실과 식당의 거리 명료화, 비공개 영역의 흔들림
- `open_values`: 본명 공개 시점, 가출 이유, 궁 인물, 부탁 내용

### B010 · hypothesis · A02_to_A03_bridge

- `narrative_function`: 서로의 선택을 대신하지 않는 공동 결정
- `payoff_axis`: 부탁받은 사람의 선택 보존 / 사전 내부 공동 결정
- `carried_reader_debt`: 생환할 사람과 남을 식당의 관계
- `contrast_requirement`: B008 사후 책임이 아닌 앞으로 할 선택의 공개 기준
- `cost_or_tradeoff`: 즉시 해법이나 안전한 관계 하나의 포기
- `open_values`: 손님·사건, 음식, 외부 인물, 금액, 생환·잔류 결론

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
