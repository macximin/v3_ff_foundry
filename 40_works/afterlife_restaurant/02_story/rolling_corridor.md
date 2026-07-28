# 저승식당 Rolling Corridor

상태: active · contract-compatible reflow window

```yaml
schema_version: firefly_rolling_corridor_v2
arc_route_rail_ref: arc_route_rail.md
from_anchor: A01
toward_anchor: A01
starts_from_state_through: ep004
arc_episode_cap: 5
current_b_arc:
  b_id: B002
  status: active
  start_episode: ep004
  planned_end_episode: ep006
  hard_end_episode: ep008
  central_question: 혀가 없는 손님에게 맛있는 마지막 식사는 무엇인가
  close_condition: 손님이 기억과 감각을 함께 받는 한 끼를 스스로 선택하고 다음 영업의 부담을 남긴다
  anchor_contribution: A01
next_b_arc:
  b_id: B003
  status: provisional
  starts_after: B002_close
  episode_span: 1_to_5
  function: 여러 테이블을 받는 식당의 최소 운영을 만든다
  entry_dependency: B002 closeout의 손님 결산과 남은 재고·평판
episode_cursor:
  current_episode: ep005
  committed:
    - ep004
  provisional:
    - ep005
    - ep006
reader_debt_due:
  - tongueless_guest_meal
current_status_floor: ep004_owner_approved
receipt_axes:
  - 감정 결산
  - 운영 잔여물
appraisal_axes:
  - 감각과 기억의 연결
  - 공주의 선택 보조
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
last_replanned_at: "2026-07-28"
```

## 다음 발주가 이어받을 것

- 식당에는 황천장에서 사 온 기본 재료와 박명조 날개의 반복 공급 약속이 있다. 장보기 뒤 최종 현금은 확정하지 않는다.
- 공주는 시식·계산·줄 관리·운반에 이어 목패 선택지로 손님의 의사를 받았다.
- 혀 없는 손님은 감각을 되살린 시험 음식을 먹었지만 마지막 식사로는 거절했다.
- 손님이 찾는 것은 혀를 잃은 뒤 누군가와 함께 먹은 뜨겁고 부드러운 음식이다. 그 사람은 매번 맛을 물었고, 손님은 끝내 대답하지 못했다.
- 삼 년 계약은 실제 시간 경과이며 손님 수나 완식 수로 환산하지 않는다.

정확한 음식, 그 사람의 정체, 혀를 잃은 이유는 ep005 Episode Bet 전까지 열어 둔다.

## 가까운 경로

- B002 `ep004~006`: 혀 없는 손님
- B003 `ep007~009`: 식당다운 첫 영업
- B004 `ep010~012`: 버려진 재료의 대가
- B005 `ep013~015`: 공주는 식당에 남는다

아크 기능과 종료 상태는 `early_five_arc_plan.md`를 따른다. 이 목록은 원고 발주가 아니라 가까운 Story Plan이다.

## 현재 B 회차 가설

아래는 Episode Bet이 committed되기 전까지 수정 가능한 가설이다.

### ep005 — 혀 밖의 한 끼

- 도윤은 실패 장면을 다시 보고 맛을 온도 하나로 환원한 자기 과신을 인정한다.
- 향, 치아·턱의 진동, 식감, 삼킨 뒤 열처럼 여러 감각을 조리 구조로 묶는다.
- 공주는 손님을 왕명으로 붙잡지 않고, 식당 안에서 지켜질 대기·선택 규칙을 설명해 재착석을 얻는다.
- 한빙과 손실은 복구하지 않는다. 노잣돈은 김문성과 다른 액수 또는 0닢으로 남아 개인별 변동 대가임을 보여 준다.

### ep006 — 하루와 식대는 다르다

- 도윤은 주문·현금·재고를 따로 장부화한다. 검은 장부가 새 UI를 띄우는 것이 아니라 도윤이 종이 운영장부를 만든다.
- 곽진복의 첫 정기 납품에서 품질·수량·지급 시점을 검수해 계약이 장식이 아님을 증명한다.
- 공주는 궁을 나온 이유의 일부만 공개하고 본명과 신분은 숨긴다.
- 하진은 생환 계약 위반 비용 또는 손님을 망령으로 만든 경우의 책임을 한 문장 규칙과 실제 흔적으로 제시한다.
- 다음 압력은 손님 수 증가가 아니라, 같은 시간에 서로 다른 주문을 가진 두 망자가 문을 보는 운영 병목이다.
