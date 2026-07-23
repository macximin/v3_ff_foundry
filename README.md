# ff_foundry

> 운영 규칙 정본은 [AGENTS.md](AGENTS.md)다. 이 README는 사람용 입구다.

`ff_foundry` is the model-led creative foundry for Firefly.

It stores model-run receipts, promoted writing materials, work-level planning artifacts, manuscripts, and cross-model comparisons. Raw-source authority stays in `ff_sources`. Operational status stays in `ff_studio_v2`.

## Shape

```text
00_charter/
10_inbox/
20_model_runs/
30_materials/
40_works/
50_cross_model_ab/
90_archive/
```

## Principle

Web Gemini Pro and GPT/Codex are co-equal prose producers. The producer is chosen per output; candidates are not averaged. A non-producing human, Gemini, Claude Code, or Codex reviews the result, and the owner alone decides what becomes authority. Web Gemini starts from a receipt-bound, role-routed source-fed session; GPT/Codex records the repo-native canon and source paths it actually used. See the Model Lanes in [AGENTS.md](AGENTS.md).

## Canonical writing loop

```text
Living Spine -> Anchor Rail -> Rolling Corridor -> Episode Bet -> Manuscript -> Narrative State
```

See [Anchored Story Loop](00_charter/anchored_story_loop.md). Kanban remains the board/flow method, not story authority.
