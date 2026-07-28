# 저승식당 Arc Route Rail

상태: active-owner-approved · B006~B010 owner-directed hypotheses

```yaml
schema_version: firefly_arc_route_rail_v1
route_to_ending: required
route_status: first_ten_route_scaffold
arc_episode_cap: 5
active_b_arc: B002
next_b_arc: B003
id_policy:
  immutable_b_ids: true
  order_owned_by: route_order
  retired_ids_are_not_reused: true
hypothesis_detail_policy: durable_only
reflow_policy: revalidate_durable_invalidate_volatile
slots:
  - b_id: B001
    route_order: 100
    status: closed
    target_anchor: A01
    narrative_function: 첫 손님을 배웅하고 식당의 첫 자본과 공급 약속을 만든다
    payoff_axis: 손님 완식과 장사 가능한 최소 자산
    carried_reader_debt: 삼 년 계약과 공주의 정체
    contrast_requirement: 첫 개인 손님 결산
  - b_id: B002
    route_order: 200
    status: active
    target_anchor: A01
    narrative_function: 혀 없는 손님의 마지막 식사를 감각과 기억의 문제로 다시 푼다
    payoff_axis: 공주의 의사소통 역할과 한 끼의 감정 결산
    carried_reader_debt: 혀를 잃은 뒤 매일 맛을 물어 준 사람과 음식
    contrast_requirement: 기술적 감각 성공과 손님 해결을 같게 두지 않는다
  - b_id: B003
    route_order: 300
    status: provisional
    target_anchor: A01
    narrative_function: 여러 테이블을 받는 첫 반복 영업을 만든다
    payoff_axis: 조리와 홀의 최소 운영 방식
    carried_reader_debt: 손님 증가와 재료 소진 압력
    contrast_requirement: 한 명의 마지막 식사에서 동시 영업으로 이동
  - b_id: B004
    route_order: 400
    status: hypothesis
    target_anchor: A01
    narrative_function: 폐재료 공급을 지속 가능한 조달 관계로 시험한다
    payoff_axis: 거래 기준과 장터 평판
    carried_reader_debt: 공주의 얼굴을 알아본 바깥 압력
    contrast_requirement: 손님 결산과 별개인 상인 관계
  - b_id: B005
    route_order: 500
    status: hypothesis
    target_anchor: A01
    narrative_function: 공주가 왕실 권한이 아닌 자기 선택으로 남는다
    payoff_axis: 최소 팀의 외부 공인
    carried_reader_debt: 왕실과 식당의 장기 거리
    contrast_requirement: 내부 역할 분담이 외부 압력에서 시험됨
  - b_id: B006
    route_order: 600
    status: hypothesis
    target_anchor: A02
    narrative_function: 일회성 완식과 다시 선택되는 식당의 신뢰를 구분한다
    payoff_axis: 재방문 또는 소개가 사람의 선택으로 남음
    carried_reader_debt: 식당이 누구를 어떻게 받아들일지의 기준
    contrast_requirement: 인기 숫자가 아닌 관계의 반복
  - b_id: B007
    route_order: 700
    status: hypothesis
    target_anchor: A02
    narrative_function: 모든 부탁을 받지 않는 식당의 경계를 만든다
    payoff_axis: 거절과 대안이 함께 있는 운영 기준
    carried_reader_debt: 거절당한 사람과 포기한 즉시 이익
    contrast_requirement: 요리 기술로 모든 문제를 풀지 않음
  - b_id: B008
    route_order: 800
    status: hypothesis
    target_anchor: A02
    narrative_function: 도움과 실수 뒤에 남는 책임을 하진과 함께 확인한다
    payoff_axis: 계약의 결과를 피하지 않는 선택
    carried_reader_debt: 하진의 선택 이유와 저승 책임의 경계
    contrast_requirement: 설명이 아니라 실제 비용으로 드러나는 계약
  - b_id: B009
    route_order: 900
    status: hypothesis
    target_anchor: A02
    narrative_function: 공주가 현장 판단으로 궁 밖의 부탁을 받는다
    payoff_axis: 왕실과 식당의 거리를 다시 정함
    carried_reader_debt: 공주의 본명과 가출 이유
    contrast_requirement: 권한이 아닌 동료 역할로 해결
  - b_id: B010
    route_order: 1000
    status: hypothesis
    target_anchor: A02
    narrative_function: 도윤과 공주가 서로의 선택을 대신하지 않는 공동 결정을 한다
    payoff_axis: 역할 분담에서 공동 책임으로 이동
    carried_reader_debt: 생환할 사람과 남을 식당의 관계
    contrast_requirement: 한 사람의 사장 판단이 아닌 두 사람의 공개 기준
```

| slot | 범위 | 상태 | 기능 | 종료 상태 |
|---|---:|---|---|---|
| B001 첫 손님과 첫 자본 | ep001~003 | closed | 김문성의 마지막 식사와 황천장 폐재료 상품화 | 장보기 재료, 반복 공급 약속, 혀 없는 손님 |
| B002 혀 없는 손님 | ep004~006 | active — ep004 approved | 감각을 되살린 시험 음식의 거절에서 출발해, 혀를 잃은 뒤 누군가와 먹은 마지막 식사를 찾는다 | 공주의 의사소통 역할, 여러 손님 유입 |
| B003 식당다운 첫 영업 | ep007~009 | provisional | 서로 다른 마지막 식사를 원하는 여러 테이블을 받으며 조리·홀·대기의 최소 운영을 만든다 | 반복 영업 방식, 재료 소진·편차 압력 |
| B004 버려진 재료의 대가 | ep010~012 | hypothesis | 3화의 반복 공급 약속을 첫 납품·검수로 시험해 지속 가능한 조달 관계로 바꾼다 | 공급 기준, 장터 평판, 공주 신분 노출 압력 |
| B005 공주는 식당에 남는다 | ep013~015 | hypothesis | 이미 현장 동료인 공주가 외부 압력 앞에서 식당을 다시 선택하고 독립 판단권을 증명한다 | 최소 팀 공인, 장기 손님·저승 문제 진입 |
| B006 식당을 다시 찾는 이유 | ep016~018 예상 | hypothesis | 한 번의 완식 뒤에도 남는 관계를 다루며, 삼도식당이 우연한 대기실이 아니라 다시 선택되는 자리인지 시험한다 | 단골·소개·재방문을 숫자 시스템이 아닌 신뢰와 경계로 전환 |
| B007 한 끼를 거절하는 날 | ep019~021 예상 | hypothesis | 도윤이 모든 부탁을 요리 기술로 해결하려는 습관을 멈추고, 손님에게 필요한 거절과 대안을 함께 만든다 | 식당의 기준·대기·우선순위가 관계를 버리지 않는 운영 규칙이 됨 |
| B008 하진의 청구서 | ep022~024 예상 | hypothesis | 식당의 선택이 손님의 퇴장과 남은 이들에게 실제 책임을 남긴다는 사례를 통해 하진의 역할을 압박한다 | 계약의 세부 우주론을 고정하지 않고도 도움·실수·책임의 경계가 생김 |
| B009 궁 밖에서 온 주문 | ep025~027 예상 | hypothesis | 공주의 왕실 배경이 식당 바깥의 부탁으로 되돌아올 때, 권한이 아닌 현장 판단으로 주문을 받을 수 있는지 시험한다 | 공주의 이름·가출 이유는 열어 둔 채 식당과 왕실의 거리를 재설정 |
| B010 삼도식당의 공동 결정 | ep028~030 예상 | hypothesis | 도윤과 공주가 각자의 손님·거래·계약 부담을 한 식당의 결정으로 묶되, 서로의 선택을 대신하지 않는다 | A02로 가는 최소 팀이 역할 분담을 넘어 공동 책임을 가진 자리로 이동 |

세부 구조는 `early_five_arc_plan.md`와 [`first_ten_arc_route_extension.md`](first_ten_arc_route_extension.md)를 따른다. B006~B010은 정확한 손님·음식·장면·보상·화수를 잠그지 않는 내구 가설이다. 박만석·한명옥·예약 25건·우선 손님 세 명은 이 활성 경로의 사실이 아니다. ep003 후보는 판매 수량과 장보기 뒤 최종 현금을 확정하지 않는다.
