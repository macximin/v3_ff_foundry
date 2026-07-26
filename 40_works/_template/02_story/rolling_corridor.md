# Rolling Corridor

B-Rail의 현재 active B와 다음 provisional B를 비추는 작업창이다. B의 식별자와 장기 순서는 `arc_route_rail.md`가 소유한다.

```yaml
schema_version: firefly_rolling_corridor_v2
arc_route_rail_ref: arc_route_rail.md
from_anchor: A00
toward_anchor: A01
starts_from_state_through: ep000
arc_episode_cap: 5
current_b_arc:
  b_id: B001
  status: active
  start_episode: ep001
  planned_end_episode: ep003
  hard_end_episode: ep005
  central_question:
  close_condition:
  anchor_contribution: A01
next_b_arc:
  b_id: B002
  status: provisional
  starts_after: B001_close
  episode_span: 1_to_5
  function:
  entry_dependency:
episode_cursor:
  current_episode: ep001
  committed:
    - ep001
  provisional:
    - ep002
    - ep003
reader_debt_due: []
current_status_floor: null
receipt_axes: []
appraisal_axes: []
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
last_replanned_at: null
```

## 현재 B 압력선

- 중심 질문:
- 현재 압력:
- 이번 Arc가 1~5화 안에 환전할 것:
- 사람 관계에 남길 후폭풍:
- 조기 종결이 가능한 최소 조건:
- 5화 하드 종결에서 반드시 닫을 것:
- 다음 Anchor가 당겨지는 조건:

## 현재 B 회차 가설

Episode Bet이 committed되기 전까지 가설이다. 현재 B 경계를 넘어 다음 B의 화별 전개를 미리 잠그지 않는다.

- ep001:
- ep002:
- ep003:

## 회차 가치 순환

- 이번 Arc의 주 receipt 축:
- 이번 Arc의 평가자 / 평가 차원:
- 직전 Arc와 다른 점:
- 구조 상승은 어느 Anchor에서 닫히는가:
- 2개 이상 외부 POV를 허용할 결산/확장 화:

## B close reflow

마지막 회차가 owner 승인되면 `05_review/arc_closeout_template.md`로 실제 결산을 기록하고 Narrative State를 갱신한다. B-Rail의 기존 next B는 자동 승격하지 않고 새 상태에서 재검증한다. 남은 B의 내구 필드는 `keep | revise | retire`로 판정하고, 구체 사건·인물·해결책·화수는 무효화한 뒤 다시 쓴다.
