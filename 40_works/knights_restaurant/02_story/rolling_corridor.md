# 기사식당 Rolling Corridor

B-Rail의 현재 `B002`와 다음 `B003`을 비추는 작업창이다. A02는 장기 Anchor이며 하나의 B가 아니다.

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
  central_question: "카일은 선금과 개인 기술을 30일 안에 타인이 재현하는 생산 조직과 첫 인수로 바꿀 수 있는가."
  close_condition: "작업자·공급처·표준 공정·교육이 승인 원고에 남고 첫 1,500그릇이 인수되거나 명시적 비용과 함께 실패한다."
  anchor_contribution: A02
next_b_arc:
  b_id: B003
  status: provisional
  starts_after: B002_close
  episode_span: 1_to_5
  function: "지방 권력 또는 공급 병목 속에서 하르벤 소유권과 도로·창고의 현실 효용을 시험한다."
  entry_dependency: "B002 closeout의 실제 현금·작업자·재고·인수·황실 손님 상태"
episode_cursor:
  current_episode: ep004
  committed:
    - ep004
  provisional:
    - ep005
    - ep006
reader_debt_due:
  - first_1500_servings
  - eight_workers
  - ten_cooks_training
  - stable_supply_sources
  - imperial_guest_identity_and_test
current_status_floor:
  land: harven_owner
  restaurant: knights_restaurant
  personal_cash: 3_gold_22_silver
  restricted_advance: 200_gold
  supply_contract: 36000_servings_plus_training
receipt_axes:
  - employment
  - repeatable_process
  - acceptance
  - cash_settlement
appraisal_axes:
  - worker_repetition_without_kyle
  - military_acceptance
  - imperial_guest_changed_behavior
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
last_replanned_at: 2026-07-25
```

ep004 Episode Bet은 감리를 통과해 committed로 잠겼다. ep005~006은 owner가 Adopt한 Story Plan과 ep003 부채에서 연 가설이며, 각 Episode Bet 감리 뒤 현재 B 안에서 한 화씩 잠근다.

## 현재 B 압력선

- 현재 압력: 선금 200금화는 자유 자산이 아니고 30일 안에 첫 1,500그릇을 인수시키지 못하면 빚이 된다.
- 이번 Arc가 환전할 것: 작업자 8명, 안정 공급처, 표준 꾸러미, 취사병 10명 교육, 첫 인수와 공급 선금 15금화 상계.
- 사람 관계에 남길 후폭풍: 카일은 명령자가 아니라 임금·품질·책임을 설명하는 고용주가 되고, 타인은 카일 없이도 공정을 수행한다.
- 조기 종결 최소 조건: 첫 1,500그릇 인수와 생산 조직의 반복 가능성이 승인 원고에 남는다.
- 5화 하드 종결: 생산 조직 질문을 닫고 같은 준비만 B003으로 넘기지 않는다.
- 다음 Anchor가 당겨지는 조건: 첫 납품 뒤 하르벤 도로·창고·시장에 새 주민과 이해관계 충돌이 생긴다.

## 현재 B 회차 가설

### ep004 — 이백 금화짜리 빚

- `03_episode_bet/ep004_episode_bet.md` committed.
- 카일은 개인 돈과 선금을 물리적으로 분리하고 `60·55·45·25·15` 다섯 예산 칸을 잠근다.
- 지원자 14명에게 유급 실기시험을 열어 작업자 8명과 첫 30일 계약을 맺는다.
- 제2황녀 직속 급양감찰관에게도 정가·대기·계약 물량 분리를 적용한다.
- 절단은 같은 중량의 첫 시험 꾸러미에서 발생한 품질 편차와 반려 표식이다.

### ep005 — 카일 없이 같은 맛

- 취사병과 작업자가 카일의 지시를 따라 표준 꾸러미와 조리 공정을 재현한다.
- 첫 시도는 카일의 개인 감각에 기대어 실패하고 재료 또는 신뢰 손실을 남긴다.
- 카일은 오러 사용을 늘리는 대신 중량·봉인·농도·현지 달걀 판별 기준을 행동으로 가르친다.
- 황실 손님은 결과를 보고 식당 규칙에 대한 행동을 바꾼다.

### ep006 — 첫 인수

- 북부 군수관이 무작위 표본을 골라 봉인·중량·재료·화염초 농도를 검사한다.
- 통과·반려·교환 비용이 실제 장부에 남고 첫 1,500그릇이 인수된다.
- 공급 선금 160금화의 상계가 시작되며 아직 현금 잔금은 발생하지 않는다.
- 다음 압력은 도로·창고를 이용하려는 지방 이해관계 또는 공급 병목이다.

## B close reflow

- ep004의 황실 손님 역할과 실패 좌표는 committed Episode Bet을 따른다. 이름·말투와 구체 조리 동작은 원고 생산 공간이다.
- B002 마지막 회차가 승인되면 Narrative State를 갱신하고 `05_review/arc_B002_closeout.md`를 작성한다.
- B003은 자동 승격하지 않는다. 실제 현금·작업자·재고·인수 상태에서 `keep | revise | retire`를 다시 판정한다.
