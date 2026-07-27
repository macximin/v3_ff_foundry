# ff_foundry

> 운영 규칙 정본은 [AGENTS.md](AGENTS.md)다. 이 README는 사람용 입구다.

`v3_ff_foundry` is the sole active model-led creative foundry for Firefly.

It stores model-run receipts, promoted writing materials, work-level planning artifacts, manuscripts, and cross-model comparisons. Raw-source authority stays in `v3_ff_sources`. Portfolio strategy stays in `genai_hq`; work authority stays here.

## Shape

```text
00_charter/
10_inbox/
20_model_runs/
30_materials/
40_works/
45_screenworks/
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

## Screenplay loop

```text
Source Binding -> Screen Brief -> Format Bible -> Season Design
-> Episode Promise -> Scene Cards -> Timed Script -> BR0/BR1
-> owner approval -> Approved Script -> Planning State
```

영상 대본은 소설 레인과 분리된 `45_screenworks/`에 둔다. 장면의 source chronology와 screen order를 따로 기록하며, 원작과 영상 사이에는 자동 추종·자동 writeback을 하지 않는다. See [Screenplay Loop](00_charter/screenplay_loop.md).
