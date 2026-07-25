# 저승식당 Work Feedback Profile

```yaml
status: active
role: route_owner_and_review_feedback
not_role: story_or_manuscript_authority
work_slug: afterlife_restaurant
genre_profiles:
  - modern_fantasy
genre_profile_options:
  modern_fantasy:
    regression_onboarding: null
active_stage: episode_bet
owner_final_authority: true
```

전역 `modern_fantasy` 프로필에서는 다음 계약만 현재 작품에 직접 적용한다.

- 매 화 주인공의 판단·선택·실행이 손님의 행동, 귀환 시간, 현금, 재고, 계약, 관계 변화 가운데 하나 이상의 구체 receipt로 남는다.
- 전문가성은 경력 목록이나 장부의 정답이 아니라 `판의 위험 → 남들이 막히는 이유 → 도윤의 다른 선택 → 가시 결과 → 삭제 반사실`로 판독된다.
- 고평가는 칭찬보다 완식·퇴장·구매·가격·분배·계약·역할 변화로 보인다.
- 강도윤 1인칭을 기본축으로 두며 일반 회차 독립 타인 POV는 `0~1`, 현재 1~3화와 가까운 corridor 기본값은 `0`이다.
- `regression_onboarding`은 적용하지 않는다. 사고 뒤 생환 계약은 회귀·빙의·환생이 아니다.

## Work-local overlay

```yaml
scope: work_local
signals:
  - id: AFR-FB-001
    stage: story
    signal: emotional_omnibus_55_business_growth_45
    action: guest_emotional_closure_precedes_arc_business_settlement
  - id: AFR-FB-002
    stage: story
    signal: omnibus_is_mandatory
    action: one_guest_or_one_relation_group_closes_in_1_to_3_episodes
  - id: AFR-FB-003
    stage: story
    signal: no_fixed_antagonist
    action: scale_pressure_through_guest_material_operation_rule_and_relationship_cost
  - id: AFR-FB-004
    stage: manuscript
    signal: no_rpg_system_expansion
    action: black_ledger_records_results_only
  - id: AFR-FB-005
    stage: manuscript
    signal: adult_male_and_child_relationship_is_non_romantic
    action: father_daughter_guardian_apprentice_business_partner_only
  - id: AFR-FB-006
    stage: review
    signal: failure_cost_must_survive_the_scene
    action: no_same_scene_full_refund_with_better_hint_or_bonus
harvest_log:
  - date: 2026-07-25
    source: owner
    stage: review
    signal: "ADOPT ALL — work plan and exact v1-rc3.2 ep001-003"
    action: freeze_pitch_and_approve_manuscript_history
    scope: work_local
```

이 overlay는 owner Adopt로 확정된 작품별 생산·감리 계약이다. 반복 검증과 별도 owner 승격 없이 `genre_family` 또는 `universal_craft`로 올리지 않는다.
