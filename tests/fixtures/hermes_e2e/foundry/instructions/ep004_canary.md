---
fixture_only: true
production_eligible: false
work_slug: sentinel_canary
assigned_writer: author_cheese
assignment_decision_id: fixture-only-owner-assignment-do-not-promote
b_arc: B001
arc_batch: 1
episode: ep004
operation: manuscript
execution_runtime: Hermes
producer_lane: hermes_owner_selected_alternate
producer_decision_id: fixture-only-hermes-producer-decision-do-not-promote
instruction_version: 1
---

# NON-PRODUCTION Hermes E2E canary instruction

이 지시서는 실제 소설 집필이 아니라 `HQ Ticket -> Sentinel preflight ->
author_cheese context -> local artifact -> verifier` 배선만 확인한다.

## 차갑게 지킬 경계

- `FIXTURE_ONLY.md`와 이 지시서만 작업 문맥으로 사용한다.
- 실제 Foundry `40_works/`, 실제 작가 레지스트리, 실제 원고·Story Plan을
  읽거나 수정하지 않는다.
- Web GPT Pro, Telegram, Notion 쓰기, Storyyard, Git commit/push/merge,
  browser·GUI를 사용하지 않는다.
- 비밀값과 환경변수를 읽거나 출력하지 않는다.
- 출력은 `.runtime/ep004_candidate.md` 정확히 한 파일만 만든다.
- 다른 파일이 필요하면 생성하지 말고 blocked로 끝낸다.

## 만들어야 할 synthetic artifact

아래 내용을 UTF-8 Markdown으로 정확히 한 번 기록한다.

```markdown
---
fixture_contract: firefly_hermes_e2e_canary_v1
work_slug: sentinel_canary
episode: ep004
authority: noncanonical_test_artifact
production_eligible: false
storyyard_publishable: false
---

# Hermes E2E canary candidate

CANARY_TOKEN: FIREFLY_HERMES_E2E_SENTINEL_CANARY_V1

Writer profile: author_cheese

Result: local ticket-to-artifact wiring verified
```

## 완료 조건

1. `.runtime/ep004_candidate.md` 이외의 파일을 만들거나 바꾸지 않았다.
2. verifier가 exit code 0을 반환한다.
3. 결과를 캐노니컬·owner-approved·publishable이라고 부르지 않는다.

실행 cwd는 fixture root로 두고 아래 명령을 쓴다.

```sh
python3 ../verify_candidate.py --fixture-root . --candidate .runtime/ep004_candidate.md
```
