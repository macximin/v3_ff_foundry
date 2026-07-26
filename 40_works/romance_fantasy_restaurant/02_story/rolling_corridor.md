# 로판식당 Rolling Corridor

```yaml
schema_version: firefly_rolling_corridor_v2
arc_route_rail_ref: arc_route_rail.md
from_anchor: A01
toward_anchor: A02
starts_from_state_through: ep003
arc_episode_cap: 5
current_b_arc:
  b_id: B002
  status: active
  start_episode: ep004
  planned_end_episode: ep006
  hard_end_episode: ep008
  central_question: "클로에는 42개 확정 주문과 40개 현장분을 품질·순서 약속대로 내면서 넘치는 수요를 반복 영업 규칙으로 바꿀 수 있는가?"
  close_condition: "82개 이행, 대기열·품절 공지 규칙, 가족별 반복 역할, 다음 영업에 남는 생산 기준이 승인 원고에 남는다."
  anchor_contribution: A02
next_b_arc:
  b_id: B003
  status: provisional
  starts_after: B002_close
  episode_span: 1_to_5
  function: "황태자궁 주문을 특혜가 아닌 검수 가능한 반복 납품으로 바꾼다."
  entry_dependency: "B002에서 품질·수령·생산량 기준이 실제로 남아야 한다."
episode_cursor:
  current_episode: ep004
  committed: []
  provisional:
    - ep004
    - ep005
    - ep006
reader_debt_due:
  - "현장분 40개를 100명 이상에게 어떤 규칙으로 배분하는가"
  - "테오도르 개인 2개와 황태자궁 20개를 약속대로 어떻게 분리 수령하는가"
current_status_floor:
  approved_through: ep003
  debt_gold: 2300
  starting_cash_gold: 17
  retained_profit_silver: 18
  prepaid_food_silver: 21
  prepaid_delivery_silver: 1
  reserved_units: 42
  walk_in_units: 40
  planned_total_units: 82
receipt_axes:
  - exact_fulfillment
  - queue_rule
  - family_role
  - repeatable_production
appraisal_axes:
  - waiting_customer_behavior
  - creditor_acceptance
  - palace_pickup_acceptance
default_external_pov_budget: 0_to_1
reflow_on_b_close:
  required: true
  trigger: owner_approved_arc_close
  b_rail_durable_fields: revalidate
  b_rail_volatile_fields: invalidate_and_rebuild
  required_outputs:
    - narrative_state_refresh
    - b_closeout_review
    - anchor_impact_check
    - rewritten_arc_route_rail
    - rewritten_rolling_corridor
last_replanned_at: "2026-07-26"
```

## 현재 B 압력선

- 중심 질문: 82개 이행을 한 번의 가족 총동원이 아니라 반복 가능한 영업 기준으로 바꿀 수 있는가.
- 현재 압력: 주인이 정해진 42개와 현장분 40개 앞에 100명 이상이 섞여 있다.
- 이번 Arc가 1~5화 안에 환전할 것: 품질을 지킨 이행, 배치별 시간 공지, 품절 뒤 다음 주문 방식, 가족별 역할과 체력 한계.
- 사람 관계에 남길 후폭풍: 라인하르트는 딸의 사업을 보호만 하지 않고 운영 조건을 승인하며, 오빠들은 임시 도움에서 반복 책임으로 이동한다.
- 조기 종결이 가능한 최소 조건: 82개 전량 이행과 현장 혼란 방지, 다음 영업에 재사용할 장부·번호표 규칙.
- 5화 하드 종결에서 반드시 닫을 것: 증산이 클로에의 과로와 품질 하락을 요구하지 않는 구조.
- 다음 Anchor가 당겨지는 조건: 황태자궁 또는 귀족가가 같은 기준으로 반복 주문을 수락한다.

## 현재 B 회차 가설

- ep004: 100명 대기열 앞에서 확정 주문과 현장분을 분리하고 첫 배치를 약속대로 낸다.
- ep005: 남은 수요와 체력·기름·시간 병목을 수치로 확인하고 품절 이후 예약 규칙을 만든다.
- ep006: 82개 이행 결과를 장부와 반복 역할로 결산하고 황태자궁 검수 주문의 진입 조건을 연다.

## 회차 가치 순환

- 이번 Arc의 주 receipt 축: 이행 수량·수령 확인·대기 규칙·가족 역할.
- 이번 Arc의 평가자 / 평가 차원: 번호표 손님은 공정성, 오스발트는 계약, 테오도르는 약속, 가족은 지속 가능성을 본다.
- 직전 Arc와 다른 점: 첫 상품의 가능성 증명이 아니라 성공 뒤 몰린 수요를 통제하는 운영 증명이다.
- 구조 상승은 어느 Anchor에서 닫히는가: A02.
- 2개 이상 외부 POV를 허용할 결산/확장 화: 없음. 필요하면 정확히 1개만 BR1에서 비용을 판정한다.
