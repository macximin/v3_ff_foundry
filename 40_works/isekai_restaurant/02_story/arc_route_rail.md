# 이계식당 Arc Route Rail — B-Rail

상태: internal-canon-baseline

~~~yaml
schema_version: firefly_arc_route_rail_v2
route_status: opening_baseline
active_b_arc: B001
arc_episode_cap: 5
immutable_rules:
  - one_physical_restaurant_only
  - human_and_otherworldly_guests_share_the_same_front_door_kitchen_and_twelve_seats
  - real_inventory_costs_and_cleanup_remain_after_night_service
  - no_hunter_hunting_subjugation_combat_or_agency_management_engine
  - no_storyyard_projection_before_manuscript_promotion
~~~

| slot | 상태 | 기능 | 닫힐 때 남길 것 |
|---|---|---|---|
| B001 첫 밤의 장부 | active | 명주·봉두·야간 계약을 통해 같은 식당의 밤이 실제 운영이 되는지 증명 | 낮 예약 3인분 부족, 27개 예약패, 불콩의 첫 공급 조건 |
| B002 열두 자리의 질서 | planned | 과예약과 서로 다른 이계 손님을 정우의 메뉴·대기·분업으로 다룬다 | 예약과 단골 신뢰의 규칙 |
| B003 이계 식재료 거래 | hypothesis | 봉두 등의 공급자와 거래하되 인간 식당의 안전·원가 기준을 지킨다 | 검수·가격·조리법의 축적 |
| B004 식당의 관계망 | open | 밤 손님과 낮 손님의 선택이 같은 가게의 평판을 바꾸는 지점 | 정우와 명주의 공동 운영 관계 |

각 슬롯의 구체 손님·음식·회차는 독립 Episode Bet과 감리에서만 잠근다.
