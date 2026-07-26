# Genre Feedback Profiles

```yaml
status: active_scope_router
owner_decision: 2026-06-16
role: route work/stage feedback before doctrine promotion
not_role: producer fear harness or universal craft dump
```

Genre profiles are conditional feedback routers. Owner-adopted profiles may also
hold one genre family's static acceptance contract, as
`modern_fantasy.md` does for episode value and scene routing.

They keep genre-specific owner/gate feedback from being promoted too early into
`craft_doctrine.md`. A profile can shape production excerpts, review, harvest,
and directed reprompting for works that opt in through
`40_works/<work>/00_feedback_profile.md`. It does not own a work's facts, Story
Plan, or current Episode Bet.

## Rule

Feedback starts at the narrowest fitting scope.

```yaml
scope_ladder:
  - attempt_only
  - stage_local
  - work_local
  - genre_family
  - universal_craft
```

- `attempt_only`: the surface failed; no reusable lesson.
- `stage_local`: useful only for the current production stage.
- `work_local`: useful for this work's promise, cast, tone, or payoff contract.
- `genre_family`: useful across works in the same genre family.
- `universal_craft`: useful across genres and works, or explicitly promoted by owner.

Do not dump owner notes straight into `craft_doctrine.md`.

## Use

1. Work profile opts into one or more genre profiles and may choose a profile-defined option through `genre_profile_options`.
2. Relay compiles each profile's small `Shared Acceptance Core` and the selected conditional contract verbatim into production.
3. Review receives the same shared and conditional core inside the full profiles and the same episode instance.
4. Review/gate writes `feedback_harvest`.
5. Owner or reviewer picks the narrowest valid scope.
6. Only repeated or owner-approved signals promote upward.

Producer and reviewer share the exact acceptance core. Full profiles add review
diagnostics and harvest routing, not hidden fail conditions. Static profile rules
are not copied into Story Plan or Episode Bet; those surfaces hold only their
variables.
