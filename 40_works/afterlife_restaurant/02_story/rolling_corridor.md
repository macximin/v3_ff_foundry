# 저승식당 Rolling Corridor

상태: active

```yaml
schema_version: firefly_rolling_corridor_v3
starts_from: owner_approved_ep004
active_b_arc: B002
episode_cursor: ep005_episode_bet
committed:
  - ep004
provisional:
  - ep005
  - ep006
hard_stop: []
```

## 다음 발주가 이어받을 것

- 식당에는 황천장에서 사 온 기본 재료와 박명조 날개의 반복 공급 약속이 있다. 장보기 뒤 최종 현금은 확정하지 않는다.
- 공주는 시식·계산·줄 관리·운반에 이어 목패 선택지로 손님의 의사를 받았다.
- 혀 없는 손님은 감각을 되살린 시험 음식을 먹었지만 마지막 식사로는 거절했다.
- 손님이 찾는 것은 혀를 잃은 뒤 누군가와 함께 먹은 뜨겁고 부드러운 음식이다. 그 사람은 매번 맛을 물었고, 손님은 끝내 대답하지 못했다.
- 삼 년 계약은 실제 시간 경과이며 손님 수나 완식 수로 환산하지 않는다.

정확한 음식, 그 사람의 정체, 혀를 잃은 이유는 ep005 Episode Bet 전까지 열어 둔다.

## 가까운 경로

- B002 `ep004~006`: 혀 없는 손님
- B003 `ep007~009`: 식당다운 첫 영업
- B004 `ep010~012`: 버려진 재료의 대가
- B005 `ep013~015`: 공주는 식당에 남는다

아크 기능과 종료 상태는 `early_five_arc_plan.md`를 따른다. 이 목록은 원고 발주가 아니라 가까운 Story Plan이다.
