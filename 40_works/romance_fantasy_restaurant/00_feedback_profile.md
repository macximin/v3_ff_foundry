# Work Feedback Profile

```yaml
status: active
role: route owner_and_review_feedback
not_role: story_or_manuscript_authority
work_slug: romance_fantasy_restaurant
genre_profiles:
  - romance_fantasy
genre_profile_options:
  romance_fantasy:
    regression_onboarding: redemption
active_stage: episode_bet
owner_final_authority: true
```

가장 좁은 유효 scope에 먼저 둔다.

```yaml
scope_ladder:
  - attempt_only
  - stage_local
  - work_local
  - genre_family
  - universal_craft
```

```yaml
signal_shape:
  date: YYYY-MM-DD
  source: owner | external_review | model_self_review | audit
  stage: pitch | story | episode_bet | manuscript | review
  signal: ""
  defect_class: []
  starting_scope: attempt_only
  action: ""
  promote_now: false
```

- pitch: 판매 약속·훅·반복 엔진.
- story: Spine·Anchor·Corridor의 미래 전략.
- episode_bet: 화의 선택·환전·후폭풍·다음 압력.
- manuscript: 산문·장면·목소리·물성·POV.
- review: BR0/BR1 divergence와 재발 신호.

`genre_profiles`가 선택한 정적 장르 계약은 `30_materials/craft/genre_profiles/`에 한 번만 둔다. `genre_profile_options`는 그 프로필이 허용한 선택값만 가리키며 계약 전문을 복붙하지 않는다.

Manuscript 피드백으로 승인 원고를 소급 수정하거나 Living Spine을 몰래 바꾸지 않는다. Canon Note에는 craft feedback을 넣지 않는다.

```yaml
harvest_log:
  - date: 2026-07-26
    source: external_review
    stage: manuscript
    signal: "ep003 v1의 선불 확정 재고와 번호표 의미가 충돌했다."
    defect_class: [continuity, inventory_contract]
    starting_scope: attempt_only
    action: "ep003만 최소 수정해 v2로 재검했고 BR0/BR1 PASS를 확인했다."
    promote_now: false
```
