# 저승식당 Story Plan A-Rail/B-Rail 이관

```yaml
decision_id: owner-story-arc-cap-reflow-20260725
extension_decision_id: owner-a-b-rail-route-20260725
decided_at: "2026-07-25"
scope: story_plan_control
anchor_is_arc: false
arc_episode_cap: 5
current_b_arc: B002
current_b_start: ep004
current_b_planned_end: ep006
current_b_hard_end: ep008
b_rail_route_to_ending: required
downstream_reflow_on_close: required
manuscript_history_changed: false
narrative_state_changed: false
```

## 결정

- Anchor Rail의 A01~A08은 장기 도착점이며 Story Arc가 아니다.
- 모든 Story Arc는 승인 원고 기준 1~5화 안에 중심 질문과 비용을 독립 결산한다.
- A-Rail은 A01~A08 장기 목적지를, B-Rail은 엔딩까지의 Story Arc 순서를 소유한다. Rolling Corridor는 현재/다음 B 작업창이다.
- 현재 B만 `active`, 다음 B 하나만 `provisional`, 그 뒤는 `hypothesis`로 둔다.
- B 마지막 회차가 owner 승인되면 manifest와 Narrative State를 갱신하고 B closeout을 작성한다.
- 기존 next B를 자동 승격하지 않는다. 남은 B의 내구 필드는 재검증하고 구체 사건·인물·음식·화수는 무효화해 현재 상태에서 다시 계산한다.

## 저승식당 적용

- A01 ep001~003은 승인 완료된 시작 Anchor다.
- `B001`은 ep001~003 승인 원고와 closeout으로 닫혔다.
- `B002`는 혀 없는 손님의 중심 질문을 다루며 ep004 시작, ep006 예상 종결, ep008 하드 종결이다.
- A02 ep004~010 예상 band는 하나의 7화 Arc가 아니다. B002와 closeout 뒤 재계산될 B003으로 구성한다.
- 당시에는 250화 상단에 B001~B051의 경로 용량을 두는 방식으로 기록했다. 이
  부분은 `owner-rolling-ten-arc-batch-correction-20260728`로 대체됐다.
  `ep250`은 장기 완결 목표이고, 현재 owner-approved 10-Arc batch만 유지한 뒤
  B010 closeout 전에 다음 batch를 reflow·사람 review로 연다. 먼 B는
  기능·보상축·독자부채·차별점만 가진 가설이다.
- `v1-rc3.2` 승인 원고 1~3화와 revision-set SHA-256은 변경하지 않았다.
- `연화`, `곽진복`, 개인별 노잣돈은 미래 Story Plan으로 유지하되 승인 원고에 나오기 전 Narrative State로 소급하지 않는다.

## 다음 gate

ep004 Episode Bet을 committed하기 전 `arc-contract-smoke`로 status, B-Rail, Rolling Corridor를 확인한다.
