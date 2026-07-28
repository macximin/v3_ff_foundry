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
    payoff_axis: "guest_emotional_closeout: 첫 손님 완식과 배웅; operational_residue: 장사 가능한 최소 자산과 첫 공급 약속"
    carried_reader_debt: 첫 공급 약속을 실제 반복 조달로 바꿀 수 있는가
    contrast_requirement: 첫 개인 손님 결산
    cost_or_tradeoff: 공급 약속을 지키고 검수해야 하는 운영 책임
    episode_span: 1_to_5
    default_rhythm: about_3
    actual_closed_span: ep001_to_ep003
    open_values: [삼 년 계약의 이후 체감, 공주 정체의 공개 시점]
  - b_id: B002
    route_order: 200
    status: active
    target_anchor: A01
    narrative_function: 혀 없는 손님의 마지막 식사를 감각과 기억의 문제로 다시 푼다
    payoff_axis: "guest_emotional_closeout: 손님이 원한 한 끼와 하지 못한 대답의 결산; operational_residue: 공주의 주문·의사소통 역할"
    carried_reader_debt: 손님의 의사를 확인하는 방식을 반복 영업에서도 지킬 수 있는가
    contrast_requirement: 기술적 감각 성공과 손님 해결을 같게 두지 않는다
    cost_or_tradeoff: 첫 해법의 재료·시간 소모와 손님 해결·대금 수령의 지연
    episode_span: 1_to_5
    default_rhythm: about_3
    open_values: [혀를 잃은 뒤 매일 맛을 물은 사람, 정확한 음식, 혀를 잃은 이유]
  - b_id: B003
    route_order: 300
    status: provisional
    target_anchor: A01
    narrative_function: 여러 테이블을 받는 첫 반복 영업을 만든다
    payoff_axis: "guest_emotional_closeout: 대표 손님의 개인적 결산을 운영 속도 속에서도 보존; operational_residue: 조리·홀·대기의 최소 운영 방식"
    carried_reader_debt: 반복 영업에서도 개인의 마지막 식사를 지킬 수 있는가
    contrast_requirement: 한 명의 마지막 식사에서 동시 영업으로 이동
    cost_or_tradeoff: 대기·품질·재고 중 하나의 실제 운영 손실
    episode_span: 1_to_5
    default_rhythm: about_3
    open_values: [손님 수와 정체, 음식, 손실 종류와 규모]
  - b_id: B004
    route_order: 400
    status: hypothesis
    target_anchor: A01
    narrative_function: 첫 공급 기회를 반복 입고의 이행·검수 기준이 있는 조달 관계로 시험한다
    payoff_axis: "guest_emotional_closeout: 조달 기준이 실제 손님 한 끼를 지키거나 망친 결과; operational_residue: 거래·검수 기준과 장터 평판"
    carried_reader_debt: 공주의 얼굴을 알아본 바깥 압력
    contrast_requirement: B001의 첫 공급 약속이 아니라 반복 이행의 품질·거절·부담을 검증
    cost_or_tradeoff: 기준 미달 재료나 유리한 거래를 거절해 생기는 공급·평판 부담
    episode_span: 1_to_5
    default_rhythm: about_3
    open_values: [공급자, 재료, 검수 실패 방식, 정확한 거래 조건]
  - b_id: B005
    route_order: 500
    status: hypothesis
    target_anchor: A01_to_A02_bridge
    narrative_function: 공주가 왕실 권한이 아닌 자기 선택으로 남는다
    payoff_axis: "guest_emotional_closeout: 실제 손님의 선택을 팀으로 결산; operational_residue: 공주의 소속 선택과 최소 팀의 외부 공인"
    carried_reader_debt: 왕실과 식당의 장기 거리
    contrast_requirement: B009의 현장 판단권이 아니라 공주가 어디에 속할지 공개적으로 선택
    cost_or_tradeoff: 왕실의 편의를 포기하고 그 외부 압력을 팀이 함께 받는다
    episode_span: 1_to_5
    default_rhythm: about_3
    open_values: [손님, 외부 압력의 주체, 공주 본명과 가출 이유]
  - b_id: B006
    route_order: 600
    status: hypothesis
    target_anchor: A02
    narrative_function: 일회성 완식과 다시 선택되는 식당의 신뢰를 구분한다
    payoff_axis: "guest_emotional_closeout: 한 사람의 선택·소개·관계 변화; operational_residue: 다시 선택되는 신뢰와 높아진 기대"
    carried_reader_debt: 식당이 누구를 어떻게 받아들일지의 기준
    contrast_requirement: 동일 망자의 귀환을 전제하지 않고 인기 숫자가 아닌 사람의 선택으로 반복 신뢰를 증명
    cost_or_tradeoff: 높아진 기대와 수용 압력, 또는 쉽게 받을 부탁의 포기
    episode_span: 1_to_5
    default_rhythm: about_3
    open_values: [선택·소개 방식, 손님, 음식, 보상]
  - b_id: B007
    route_order: 700
    status: hypothesis
    target_anchor: A02
    narrative_function: 모든 부탁을 받지 않는 식당의 경계를 만든다
    payoff_axis: "guest_emotional_closeout: 거절당한 사람의 선택이나 대안 수용; operational_residue: 거절·대기·우선순위의 운영 기준"
    carried_reader_debt: 그 기준을 다음 부탁에도 일관되게 적용할 수 있는가
    contrast_requirement: 요리 기술로 모든 문제를 풀지 않음
    cost_or_tradeoff: 거절로 포기한 즉시 이익이나 관계의 불편
    episode_span: 1_to_5
    default_rhythm: about_3
    open_values: [부탁, 손님, 대안, 포기한 이익]
  - b_id: B008
    route_order: 800
    status: hypothesis
    target_anchor: A02
    narrative_function: 도움이나 실수 뒤 이미 발생한 결과에 대해 식당과 하진이 각자의 책임 범위를 확인한다
    payoff_axis: "guest_emotional_closeout: 도움만으로 해결되지 않은 사람의 상태를 결산; operational_residue: 사후 외부 책임의 기준"
    carried_reader_debt: 하진의 선택 이유와 저승 책임의 경계
    contrast_requirement: B010의 사전 내부 공동 결정이 아니라 이미 벌어진 결과의 외부 책임을 실제 비용으로 확인
    cost_or_tradeoff: 평판·재료·관계 중 하나가 실제로 줄거나 보류됨
    episode_span: 1_to_5
    default_rhythm: about_3
    open_values: [손님과 결과, 하진의 선택 이유, 계약 전문, 저승 우주론]
  - b_id: B009
    route_order: 900
    status: hypothesis
    target_anchor: A02
    narrative_function: 공주가 현장 판단으로 궁 밖의 부탁을 받는다
    payoff_axis: "guest_emotional_closeout: 부탁을 건 사람의 선택과 결과를 결산; operational_residue: 요청을 받을 권한과 결과를 감당하는 공주의 판단권"
    carried_reader_debt: 식당과 왕실의 거리를 어떤 기준으로 유지할 것인가
    contrast_requirement: B005의 소속 선택이 아니라 이미 팀인 공주가 권한 아닌 동료 역할로 현장 요청을 판단
    cost_or_tradeoff: 왕실과 식당의 거리가 선명해지고 공주의 비공개 영역이 흔들림
    episode_span: 1_to_5
    default_rhythm: about_3
    open_values: [공주 본명 공개 시점, 가출 이유, 궁 인물, 부탁 내용]
  - b_id: B010
    route_order: 1000
    status: hypothesis
    target_anchor: A02_to_A03_bridge
    narrative_function: 도윤과 공주가 서로의 선택을 대신하지 않는 공동 결정을 한다
    payoff_axis: "guest_emotional_closeout: 실제 부탁을 받은 사람의 선택을 보존; operational_residue: 역할 분담에서 사전 내부 공동 결정으로 이동"
    carried_reader_debt: 생환할 사람과 남을 식당의 관계
    contrast_requirement: B008의 사후 외부 책임이 아니라 앞으로 할 선택에서 서로의 의사를 대신하지 않는 공개 기준
    cost_or_tradeoff: 한쪽이 원한 즉시 해법이나 안전한 관계 하나를 포기함
    episode_span: 1_to_5
    default_rhythm: about_3
    open_values: [손님과 사건, 음식, 외부 인물, 금액, 생환·잔류 결론]
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
