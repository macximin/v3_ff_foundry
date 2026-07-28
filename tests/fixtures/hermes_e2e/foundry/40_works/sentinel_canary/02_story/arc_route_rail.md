# Sentinel Canary Arc Route Rail

상태: fixture_only

```yaml
schema_version: firefly_arc_route_rail_v1
fixture_only: true
route_to_ending: required
route_status: synthetic_capacity_only
arc_episode_cap: 5
active_b_arc: B001
next_b_arc: B002
hypothesis_detail_policy: durable_only
reflow_policy: revalidate_durable_invalidate_volatile
slots:
  - b_id: B001
    route_order: 100
    status: active
    target_anchor: A01
    narrative_function: verify_local_ticket_to_artifact_wiring
    payoff_axis: verifier_pass
    carried_reader_debt: none
    contrast_requirement: no_production_side_effect
  - b_id: B002
    route_order: 200
    status: provisional
    target_anchor: A01
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B003
    route_order: 300
    status: hypothesis
    target_anchor: A01
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B004
    route_order: 400
    status: hypothesis
    target_anchor: A01
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B005
    route_order: 500
    status: hypothesis
    target_anchor: A01
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B006
    route_order: 600
    status: hypothesis
    target_anchor: A01
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B007
    route_order: 700
    status: hypothesis
    target_anchor: A01
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B008
    route_order: 800
    status: hypothesis
    target_anchor: A01
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B009
    route_order: 900
    status: hypothesis
    target_anchor: A01
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B010
    route_order: 1000
    status: hypothesis
    target_anchor: A01
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B011
    route_order: 1100
    status: hypothesis
    target_anchor: A02
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B012
    route_order: 1200
    status: hypothesis
    target_anchor: A02
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B013
    route_order: 1300
    status: hypothesis
    target_anchor: A02
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B014
    route_order: 1400
    status: hypothesis
    target_anchor: A02
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B015
    route_order: 1500
    status: hypothesis
    target_anchor: A02
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B016
    route_order: 1600
    status: hypothesis
    target_anchor: A02
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B017
    route_order: 1700
    status: hypothesis
    target_anchor: A02
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B018
    route_order: 1800
    status: hypothesis
    target_anchor: A02
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B019
    route_order: 1900
    status: hypothesis
    target_anchor: A02
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B020
    route_order: 2000
    status: hypothesis
    target_anchor: A02
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B021
    route_order: 2100
    status: hypothesis
    target_anchor: A03
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B022
    route_order: 2200
    status: hypothesis
    target_anchor: A03
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B023
    route_order: 2300
    status: hypothesis
    target_anchor: A03
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B024
    route_order: 2400
    status: hypothesis
    target_anchor: A03
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B025
    route_order: 2500
    status: hypothesis
    target_anchor: A03
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B026
    route_order: 2600
    status: hypothesis
    target_anchor: A03
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B027
    route_order: 2700
    status: hypothesis
    target_anchor: A03
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B028
    route_order: 2800
    status: hypothesis
    target_anchor: A03
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B029
    route_order: 2900
    status: hypothesis
    target_anchor: A03
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B030
    route_order: 3000
    status: hypothesis
    target_anchor: A03
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B031
    route_order: 3100
    status: hypothesis
    target_anchor: A04
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B032
    route_order: 3200
    status: hypothesis
    target_anchor: A04
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B033
    route_order: 3300
    status: hypothesis
    target_anchor: A04
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B034
    route_order: 3400
    status: hypothesis
    target_anchor: A04
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B035
    route_order: 3500
    status: hypothesis
    target_anchor: A04
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B036
    route_order: 3600
    status: hypothesis
    target_anchor: A04
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B037
    route_order: 3700
    status: hypothesis
    target_anchor: A04
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B038
    route_order: 3800
    status: hypothesis
    target_anchor: A04
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B039
    route_order: 3900
    status: hypothesis
    target_anchor: A04
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B040
    route_order: 4000
    status: hypothesis
    target_anchor: A04
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B041
    route_order: 4100
    status: hypothesis
    target_anchor: A05
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B042
    route_order: 4200
    status: hypothesis
    target_anchor: A05
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B043
    route_order: 4300
    status: hypothesis
    target_anchor: A05
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B044
    route_order: 4400
    status: hypothesis
    target_anchor: A05
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B045
    route_order: 4500
    status: hypothesis
    target_anchor: A05
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B046
    route_order: 4600
    status: hypothesis
    target_anchor: A05
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B047
    route_order: 4700
    status: hypothesis
    target_anchor: A05
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B048
    route_order: 4800
    status: hypothesis
    target_anchor: A05
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B049
    route_order: 4900
    status: hypothesis
    target_anchor: A06
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
  - b_id: B050
    route_order: 5000
    status: hypothesis
    target_anchor: A06
    narrative_function: fixture_capacity_only
    payoff_axis: none
    carried_reader_debt: none
    contrast_requirement: synthetic_only
```

이 50개 슬롯은 Sentinel의 ep250 capacity gate만 검증한다. 실제 작품의
B-Rail로 복사하거나 구체 사건으로 해석하지 않는다.
