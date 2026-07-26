# Recurrence Ledger

별개 화·작품에서 같은 craft 또는 execution failure가 반복되는지 기록한다. 원고나 이야기 정본이 아니다.

```yaml
rule_id: R5 | D-pov | custom
first_detected:
instances:
  - work:
    episode:
    manuscript_revision:
    verdict_date:
    gap:
    verdict_ref:
cumulative_count: 0
status: active | deprecated | rule_upgraded | procedure_replaced | resolved
action_needed:
last_review:
```

- T1: 같은 화의 manuscript candidate revise 루프에서 2회 연속. 즉시 Episode Bet/prompt/절차를 고친다.
- T5: 별개 화·작품에서 누적 3회. 월 회고에서 규칙을 강화하거나 절차를 교체한다.
- `procedure_replaced`는 Episode Bet, BR0/BR1 protocol, detector 중 실제 실패 지점을 고친다.
- 같은 `rule_id`가 review에 명시된 경우만 카운트한다.
