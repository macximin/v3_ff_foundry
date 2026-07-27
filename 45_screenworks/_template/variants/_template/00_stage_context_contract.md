# Stage Context Contract — Screenplay Loop

## 기본

- 현재 stage의 allowlist만 모델에 준다.
- 원작 전체 대신 source manifest와 현재 좌표를 기본으로 준다.
- 대본 본문은 Fountain만 소유하고 JSON sidecar는 본문을 복제하지 않는다.
- `latest` 링크는 권위가 아니다.

| 작업 | 필수 입력 | 기본 제외 |
|---|---|---|
| Screen Brief | Source Binding, family core, delivery 요구 | 원작 전체, 미채택 후보 |
| Format Bible | Screen Brief, delivery profile | episode 세부 대사 |
| Season Design | Screen Brief, Format Bible, 필요한 source 좌표 | 전체 raw run |
| Episode Promise | 현재 season route, 직전 승인 대본, Planning State | 먼 episode 상세 |
| Scene Cards | Episode Promise, 직전 승인 대본, 필요한 source scene | review transcript |
| Timed Script | Scene Cards, Episode Promise, 직전 승인 대본 | 전체 원작, 먼 episode |
| BR0 | Timed Script, 직전 승인 episode | Screen Brief, Format Bible, plan |
| BR1 | 봉인 BR0, Screen Brief, Format Bible, Season Design, Episode Promise, Scene Cards | producer self-review를 최종 판정으로 쓰기 |

full source 재개방은 source 충돌, season close, owner 요청 때만 한다. 후보는 최대 2개며 독립 run으로 보존한다.
