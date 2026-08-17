# Arc Route Rail — B-Rail

상태: candidate

B-Rail은 현재 예상 엔딩까지 이어지는 Story Arc의 순서표다. 각 B는 승인 원고 기준 1~3화 안에 중심 질문을 결산한다. 먼 B는 확정 줄거리가 아니라 장기 경로 가설이다.

```yaml
schema_version: firefly_arc_route_rail_v1
route_to_ending: required
route_status: scaffold_required
arc_episode_cap: 3
active_b_arc: B001
next_b_arc: B002
id_policy:
  immutable_b_ids: true
  order_owned_by: route_order
  retired_ids_are_not_reused: true
hypothesis_detail_policy: durable_only
durable_fields:
  - target_anchor
  - narrative_function
  - payoff_axis
  - carried_reader_debt
  - contrast_requirement
volatile_fields:
  - exact_episode_coordinates
  - guest_identity
  - food
  - scene_solution
  - exact_reward
reflow_policy: revalidate_durable_invalidate_volatile
slots:
  - b_id: B001
    route_order: 100
    status: active
    target_anchor: A01
    narrative_function:
    payoff_axis:
    carried_reader_debt:
    contrast_requirement:
  - b_id: B002
    route_order: 200
    status: provisional
    target_anchor: A01
    narrative_function:
    payoff_axis:
    carried_reader_debt:
    contrast_requirement:
  - b_id: B003
    route_order: 300
    status: hypothesis
    target_anchor: A02
    narrative_function:
    payoff_axis:
    carried_reader_debt:
    contrast_requirement:
last_reflowed_at: null
```

## 작성 규칙

- A-Rail의 모든 Anchor와 예상 엔딩까지 B 슬롯이 이어져야 한다.
- `b_id`는 한번 발급하면 재번호화하지 않는다. 삽입은 새 ID와 중간 `route_order`로 처리한다.
- `active`는 정확히 하나, `provisional`은 최대 하나다. 그 뒤는 `hypothesis`다.
- 먼 B에는 내구 필드만 쓴다. 정확한 화수·손님·음식·장면·보상은 현재 B에 가까워진 뒤 Rolling Corridor에서 정한다.
- 현재 B가 닫히면 모든 남은 B에 `keep | revise | retire` 판정을 내리고, 변동 필드는 무효화·재작성한다.
- 엔딩 상단이 250화라면 최대 3화 상한상 최소 84개 B 슬롯이 필요하다(`ceil(250 / 3) = 84`). 첫 B가 3화로 닫힌 경우에도 닫힌 1개와 남은 247화를 위한 83개를 합쳐 최소 84개다. 이는 화수 확정이 아니라 누락 없는 경로 용량 검사다.
- 복제 직후의 `route_status: scaffold_required`는 생산 불가 상태다. B001부터 최소 B084까지 고유 `b_id`와 모든 내구 필드를 채운 뒤에만 `route_status: route_to_ending_ready`로 변경한다. Relay는 신작 profile에서 이 상태와 실제 슬롯 수를 함께 검사한다.
