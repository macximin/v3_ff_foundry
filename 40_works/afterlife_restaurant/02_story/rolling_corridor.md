# 저승식당 Rolling Corridor

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
  central_question: "혀가 없는 손님에게 도윤은 무엇을 맛으로 건네고, 첫 실제 실패 비용을 감수할 수 있는가."
  close_condition: "혀 없는 손님의 완식·퇴장 또는 명시적 거절, 비환급 손실, 귀환 일수 결과, 김문성과 다른 노잣돈 결과가 승인 원고에 남는다."
  anchor_contribution: A02
next_b_arc:
  b_id: B003
  status: provisional
  starts_after: B002_close
  episode_span: 1_to_5
  function: "동시 주문과 반복 납품을 통해 네 탁자·한 명의 종업원이라는 운영 병목을 현재형 사건으로 연다."
  entry_dependency: "B002 closeout의 실제 현금·재고·공주 신뢰·귀환 일수"
episode_cursor:
  current_episode: ep004
  committed: []
  provisional:
    - ep004
    - ep005
    - ep006
reader_debt_due:
  - tongue_less_guest_identity_and_need
  - first_actual_failure_cost
  - variable_funeral_coin_rule
  - princess_name_and_reason_to_stay
arc_cadence: guest_omnibus_1_to_3_episodes
current_status_floor:
  return_time: 1_of_1095_days
  cash: 18_coins
  inventory: 8_basic_ingredient_types
  supply_contract: 30_bakmyeongjo_wings_plus_12_broken_hoehonmae_for_10_coins
receipt_axes:
  - guest_departure
  - return_day
  - irreversible_loss
  - relationship_trust
appraisal_axes:
  - guest_reseating_or_departure
  - princess_responsible_action
default_external_pov_budget: 0
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

ep004 Episode Bet 작성 전이므로 현재 B의 `committed` 회차는 없다. 아래 세 회차는 owner가 Adopt한 Story Plan의 작업 가설이며, 각 Episode Bet 감리 뒤 현재 B 안에서 한 화씩 잠근다. `planned_end_episode`는 ep006이지만 필요하면 일찍 닫거나 ep008까지 조정할 수 있다. ep008을 넘겨 같은 중심 질문을 미룰 수는 없다.

## 현재 B 압력선

- 현재 압력: 두 번째 손님은 혀가 없고 말 대신 목패를 쓴다. 김문성의 기억 냄새와 국물 구조를 되풀이해서는 주문을 해결할 수 없다.
- 이번 Arc가 1~5화 안에 환전할 것: ‘맛은 혀에만 있는가’라는 새 감각 문제, 첫 실제 조리 손실, 손님 신뢰 회복, 두 번째 귀환 하루, 노잣돈 변동 결제 규칙.
- 사람 관계에 남길 후폭풍: 공주는 시식·계산 보조를 넘어 실패한 손님을 다시 앉히기 위해 자기 체면이나 신분 안전 중 하나를 실제로 건다. 해결책은 도윤에게 남긴다.
- 다음 Anchor가 당겨지는 조건: 혀 없는 손님을 완결하고도 네 탁자·한 명의 종업원·불안한 재고로는 다음 대기열을 받을 수 없다는 운영 병목이 현재 장면에 남을 때.
- 조기 종결이 가능한 최소 조건: 손님의 마지막 식사와 퇴장, 비환급 손실, 귀환·노잣돈 결과가 모두 현재형 행동으로 남는다.
- 5화 하드 종결에서 반드시 닫을 것: 혀 없는 손님의 중심 질문을 완식·거절·이별 중 하나로 끝내고, 같은 질문을 이름만 바꿔 다음 B로 넘기지 않는다.
- 늘리거나 줄일 수 있는 구간: 혀 없는 손님은 기본 2화, 현재 작업 가설은 3화다. 감정 사연이 일찍 닫히면 운영 후폭풍을 억지로 늘리지 않는다.

## 현재 B 회차 가설

아래는 Episode Bet이 committed되기 전까지 수정 가능한 가설이다.

### ep004 — 혀가 없는 사람이 원하는 맛

- 손님의 목패와 몸·상처·삼키는 습관에서 첫 단서를 읽는다.
- 도윤은 업화고추의 ‘혀가 아니라 삼킨 뒤 몸에 남는 열’을 이용한 첫 가설을 세운다.
- 감각을 너무 직접 밀어붙여 손님의 상처 기억을 건드리고, 온도 균형을 잡으려던 한빙과 1개를 잃는다.
- 손님은 그릇을 밀고 자리에서 일어난다. 귀환 시간은 `1일` 그대로이며 해당 화에 대체 보상창이나 더 좋은 힌트를 주지 않는다.
- 절단은 손님이 식당 밖 안개에서 다시 목패를 뒤집는 행동. 뒷면에는 ‘맛이 아니라 씹을 때 들리던 소리를 잃었다’는 방향의 새 단서가 아니라, 도윤이 이미 본 행동을 다르게 읽게 하는 구체 흔적만 둔다.

### ep005 — 혀 밖의 한 끼

- 도윤은 실패 장면을 다시 보고 맛을 온도 하나로 환원한 자기 과신을 인정한다.
- 향, 치아·턱의 진동, 식감, 삼킨 뒤 열처럼 여러 감각을 조리 구조로 묶는다.
- 공주는 손님을 왕명으로 붙잡지 않고, 식당 안에서 지켜질 대기·선택 규칙을 설명해 재착석을 얻는다.
- 손님은 자기 결핍에 맞는 방식으로 먹고 떠난다. 두 번째 귀환 하루가 적립된다.
- 한빙과 손실은 복구하지 않는다. 노잣돈은 김문성과 다른 액수 또는 0닢으로 남아 개인별 변동 대가임을 보여 준다.

### ep006 — 하루와 식대는 다르다

- 도윤은 귀환 누계, 현금, 재고를 따로 장부화한다. 검은 장부가 새 UI를 띄우는 것이 아니라 도윤이 종이 운영장부를 만든다.
- 곽진복의 첫 정기 납품에서 품질·수량·지급 시점을 검수해 계약이 장식이 아님을 증명한다.
- 공주는 `연화`라는 이름과 궁을 나온 이유의 첫 절반을 자기 선택으로 공개한다. 공개 신분은 계속 숨긴다.
- 하진은 생환 계약 위반 비용 또는 손님을 망령으로 만든 경우의 책임을 한 문장 규칙과 실제 흔적으로 제시한다.
- 다음 압력은 손님 수 증가가 아니라, 같은 시간에 서로 다른 주문을 가진 두 망자가 문을 보는 운영 병목이다.

## 회차 가치 순환

- 이번 corridor의 주 receipt 축: irreversible_loss → guest_trust_recovery → second_return_day.
- 이번 corridor의 평가자 / 평가 차원: 혀 없는 손님의 재착석·완식·퇴장 / 공주의 비권력적 책임 행동.
- 직전 corridor와 다른 점: 김문성은 기억의 방향을 교정했고 황천장은 시장 가격을 증명했다. 이번에는 감각의 경계와 실패 뒤 신뢰를 증명한다.
- 구조 상승은 어느 anchor에서 닫히는가: A02에서 실패 비용, 변동 노잣돈, 공주의 자기 욕망이 함께 닫힐 때.
- 2개 이상 외부 POV를 허용할 결산/확장 화: 없음. 1인칭 강도윤 현장 시점을 유지한다.

## B close reflow

- 혀 없는 손님의 구체 결핍과 최종 음식은 Episode Bet 발주 전에 Web GPT Pro가 선택지를 만들고 owner 또는 비-Codex 감리 레인이 고른다.
- `연화`, `곽진복` 이름과 개인별 변동 노잣돈 규칙은 owner가 Adopt한 미래 Story Plan이다. 승인 원고에 실제 공개되기 전에는 Narrative State의 과거 사실로 소급하지 않는다.
- B002 마지막 회차가 승인되면 Narrative State를 갱신하고 `05_review/arc_B002_closeout.md`를 작성한다.
- B-Rail의 기존 B003은 자동 승격하지 않는다. 실제 현금·재고·신뢰·귀환 일수에서 `keep | revise | retire`를 다시 판정한다.
- B004~B051의 내구 필드는 장기 경로 가설로 재검증하고, 구체 사건·인물·해결책·화수는 무효화해 다시 쓴다. A02/A03 Anchor 방향만 별도 변경 사유가 없으면 보존한다.
