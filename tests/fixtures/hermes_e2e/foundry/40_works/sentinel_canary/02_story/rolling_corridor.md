# Sentinel Canary Rolling Corridor

```yaml
schema_version: firefly_rolling_corridor_v2
fixture_only: true
arc_route_rail_ref: arc_route_rail.md
from_anchor: A00
toward_anchor: A01
starts_from_state_through: ep000
arc_episode_cap: 5
current_b_arc:
  b_id: B001
  status: active
  start_episode: ep004
  planned_end_episode: ep004
  hard_end_episode: ep008
  central_question: can_the_local_ticket_create_one_ignored_fixture_artifact
  close_condition: verifier_returns_zero
  anchor_contribution: A01
next_b_arc:
  b_id: B002
  status: provisional
  starts_after: B001_close
  episode_span: 1_to_5
  function: fixture_capacity_only
  entry_dependency: none
episode_cursor:
  current_episode: ep004
  committed:
    - ep004
  provisional: []
reader_debt_due: []
reflow_on_b_close:
  required: false
  reason: fixture_never_enters_production
```

실제 이야기 계획이 아니다. `.runtime/ep004_candidate.md` 검증 뒤 종료한다.
