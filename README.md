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

Web GPT Pro is the default prose producer. Codex Desktop `gpt-5.6-terra` is the default BR0/BR1 reviewer and the repo/receipt operator. If Web GPT Pro is unavailable or misses the owner's quality bar, the owner may select a fallback producer; GPT/Codex-produced prose must be reviewed by a non-Codex lane. Candidates are never averaged, and the owner alone decides what becomes authority. See the Model Lanes in [AGENTS.md](AGENTS.md).

## Canonical writing loop

```text
Living Spine -> A-Rail -> B-Rail -> Rolling Corridor -> Episode Bet -> Manuscript -> Narrative State
```

See [Anchored Story Loop](00_charter/anchored_story_loop.md). Kanban remains the board/flow method, not story authority.
