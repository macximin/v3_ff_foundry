# Firefly Hermes 업무지시서

이 파일을 실제 티켓별 `.md`로 복사해 작성한다. 이 문서는 작가에게 “뭘 해”만 던지는 메모가 아니다. **지금 어디까지가 사실이고, 이번에 무엇을 독자에게 지급하며, 어디에서 멈춰야 하는지**를 같이 잡아 주는 발주문이다.

Notion 티켓은 이 파일의 repo-relative path와 SHA-256을 반드시 가진다.

```yaml
work_slug: <slug>
assigned_writer: <작가_치즈|작가_포도|작가_유자|작가_꿀빵>
assignment_decision_id: <owner-decision-id>
b_arc: B000
arc_batch: 1
episode: ep000
operation: <arc_design|episode_bet|manuscript|b_closeout>
instruction_version: 1
```

## 이번 일 한 줄

`<이번 화/아크에서 주인공이 무엇을 선택하고, 독자가 무엇을 받으며, 무엇이 다음 압력으로 남는가. 3문장 이내.>`

## 현재 정본: 여기까지는 차갑게 지킨다

- Approved manuscript through: `<ep000>`
- Narrative State: `08_state/narrative_state.yaml`
- A-Rail / B-Rail / Rolling Corridor: `02_story/...`
- 확정 사실: `<바꾸면 안 되는 사실·관계·비용>`
- 열린 칸: `<장면으로 발명해도 되는 칸>`
- 이번 B의 중심 질문 / close condition: `<...>`
- 가까운 A-Anchor에 주는 기여: `<...>`

## 이번에 만들어야 할 것

- 산출물: `<one concrete artifact and repo-relative path>`
- 독자 보상: `<이번 화 안에 눈으로 확인할 돈·물건·권한·관계·상대 비용>`
- 주인공 선택과 대가: `<...>`
- 인간 후폭풍: `<보상 뒤에 남는 감정/관계 변화>`
- 다음 클릭 압력: `<...>`

## 장면 감각

- 독자가 먼저 기억할 물건·행동·반응을 2~3개 적는다: `<...>`
- 설명으로 처리하지 말 것: `<...>`
- 꼭 보여 줄 장면: `<...>`
- 피해야 할 편한 해결: `<설정 설명, 갑작스러운 구원, 이미 끝난 갈등 재탕 등>`

## Web GPT Pro gate

- Produce the manuscript candidate only when this is a `manuscript` order.
- 내부감리에서 아래를 확인한다.
  - 이번 화를 빼면 다음 화의 쾌감·관계 변화·소유 과정이 정말 달라지는가?
  - 주인공의 선택이 보상으로 환전됐는가?
  - 직전 승인 원고의 사실을 덮어쓰지 않았는가?
  - 다음 화로 갈 만큼 닫았고, 동시에 다음 압력을 남겼는가?
- `continuation_authorized: true|false`가 있는 Markdown 영수증을 남긴다. false 또는 누락이면 다음 화는 열지 않는다.
- 이 PASS는 BR0/BR1과 owner 승인을 대체하지 않는다.

## 멈춤과 보고

- `<tests/structural checks>`
- A-Rail/B-Rail 부재, 담당작 불일치, B 5화 초과 위험, 비활성 batch면 멈춘다.
- ep001~ep003은 인간 전용이다.
- 멈췄다면 추측으로 이어 쓰지 말고 `확정 사실 / 막힌 이유 / owner가 고를 한 가지`를 적는다.

## 끝나고 남길 다섯 줄

1. 이번 화에서 독자가 받은 것
2. B에 생긴 변화
3. A에 미친 영향
4. 다음 화를 여는 압력
5. owner가 지금 정해야 할 것 (없으면 `없음`)
