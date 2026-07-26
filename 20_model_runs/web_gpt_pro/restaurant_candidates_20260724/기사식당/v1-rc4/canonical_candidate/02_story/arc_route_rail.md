# Arc Route Rail — 기사식당

상태: candidate

```yaml
schema_version: firefly_arc_route_rail_v1
route_to_ending: required
arc_episode_cap: 5
active_b_arc: B001
next_b_arc: B002
slots:
  - b_id: B001
    route_order: 100
    status: active
    target_anchor: A01
    narrative_function: "제국의 소유물에서 자기 식당과 첫 거래의 주인으로 전환"
    payoff_axis: "소유권·판단권·계약"
    carried_reader_debt: "첫 납품 책임"
    contrast_requirement: "황실의 일방 포상과 북부의 상호 계약 대비"
  - b_id: B002
    route_order: 200
    status: provisional
    target_anchor: A02
    narrative_function: "혼자 잘하는 카일을 반복 생산 조직의 책임자로 시험"
    payoff_axis: "고용·표준화·첫 인수"
    carried_reader_debt: "30일 준비·작업자 8명·취사병 10명"
    contrast_requirement: "기적의 한 그릇이 아니라 재현 가능한 품질"
  - b_id: B003
    route_order: 300
    status: hypothesis
    target_anchor: A02
    narrative_function: "지방 권력 또는 공급 병목 속 하르벤 소유권 방어"
    payoff_axis: "시장·주민·법적 권리"
    carried_reader_debt: "도로와 창고가 실제 생활권이 되는가"
    contrast_requirement: "거물의 도움보다 카일과 주민의 실행"
  - b_id: B004
    route_order: 400
    status: hypothesis
    target_anchor: A03
    narrative_function: "새 결핍의 거물 손님으로 음식 엔진 변주"
    payoff_axis: "감각·노동·규칙"
    carried_reader_debt: "완치 금지와 다른 결핍"
    contrast_requirement: "아델린 아크의 진단·군납 반복 금지"
  - b_id: B005
    route_order: 500
    status: hypothesis
    target_anchor: A04
    narrative_function: "이세라의 직접 귀환과 카일 선택권 재판"
    payoff_axis: "관계·황실 압력·손님 규칙"
    carried_reader_debt: "프롤로그 소유 선언"
    contrast_requirement: "힘으로 제압하지 않고 포상·기억·거래를 재정의"
```

먼 B의 구체 음식·손님·보상·정확한 화수는 잠그지 않는다. owner Adopt 후 A06까지의 용량 슬롯을 확장한다.

