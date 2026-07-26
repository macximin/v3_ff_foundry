# Source Map — source / callable Story Blocks

```yaml
source_map_id:
source_id:
as_of_scope:
source_coords: []
evidence_ids: []
confidence: high | medium | low
alternative:
```

## block `<source_id>.B01`

```yaml
block_id: <source_id>.B01
slot: background | deficiency | asymmetry | first_use | first_payoff | first_arena | pacing | payoff | human_texture | long_route
source_coords: []
evidence_ids: []
entry_contract:
  protagonist_state:
  required_assets: []
  required_authority: []
  required_information: []
sequence:
  - pressure_or_want:
  - protagonist_move:
  - proof_or_payoff:
exit_contract:
  capital_delta:
  authority_delta:
  relationship_delta:
  information_delta:
  arena_delta:
  debt_or_next_pressure:
carrier_surfaces:
  stage_and_witnesses: []
  concrete_objects: []
  protagonist_behavior: []
  visible_reactions: []
  relationship_turn: []
  material_payoff: []
  end_image: []
variation_axes:
  reorderable_with: []
  compressible_to_episodes:
  renameable_surfaces: []
  scalable_values: []
invariants: []
confidence: high | medium | low
```

## reusable function

- borrowed_function:
- works_when:
- fails_when:
- compatible_next_slots:
- source_specific_surface:

실제 사건 `source_coords`에서 파생된 블록은 cited evidence에 보이는 carrier 값을 모두 기록한다. 실제로 없는 범주는 빈 배열로 둔다. 값마다 같은 `source_coords / evidence_ids`에서 확인할 수 있어야 하며 별도 점수나 승인 gate를 만들지 않는다.
