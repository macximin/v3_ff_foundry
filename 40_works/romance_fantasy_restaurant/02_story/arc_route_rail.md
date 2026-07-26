# 로판식당 Arc Route Rail — B-Rail

상태: active

`B001~B051`은 ep250 상단까지 빠뜨리지 않기 위한 용량 골격이다. 먼 B는 정확한 화수·손님·음식·보상을 확정하지 않고 내구 필드만 가진다.

```yaml
schema_version: firefly_arc_route_rail_v1
route_to_ending: required
route_status: scaffolded_to_ending
ending_anchor: A08
ending_episode_upper_band: ep250
arc_episode_cap: 5
planned_slot_count: 51
upper_band_capacity_episodes: 253
capacity_basis: B001_closed_3_episodes_plus_50_slots_times_5
active_b_arc: B002
next_b_arc: B003
id_policy:
  immutable_b_ids: true
  order_owned_by: route_order
  retired_ids_are_not_reused: true
hypothesis_detail_policy: durable_only
durable_fields: [target_anchor, narrative_function, payoff_axis, carried_reader_debt, contrast_requirement]
volatile_fields: [exact_episode_coordinates, guest_identity, food, scene_solution, exact_reward]
reflow_policy: revalidate_durable_invalidate_volatile
route_invariants:
  - every_b_closes_within_5_approved_episodes
  - food_praise_converts_to_money_role_or_relationship
  - previous_business_gain_becomes_next_arc_default
  - family_members_keep_independent_actions
  - romance_grows_through_kept_promises_not_status_shortcuts
slots:
  - { b_id: B001, route_order: 100, status: closed, target_anchor: A01, narrative_function: "회귀·가족 식사·첫 장사로 작품의 이중 엔진을 증명한다.", payoff_axis: "가족 완식·18은화·42개 선주문", carried_reader_debt: "2,300금화와 30일", contrast_requirement: "보호받는 아이가 실제 판매자가 된다.", start_episode: ep001, end_episode: ep003, closeout_receipt: ../05_review/arc_B001_closeout.md }
  - { b_id: B002, route_order: 200, status: active, target_anchor: A02, narrative_function: "82개 이행과 대기열을 반복 영업 규칙으로 바꾼다.", payoff_axis: "정확한 이행·운영 기준", carried_reader_debt: "100명 수요와 현장분 40개", contrast_requirement: "완판이 아니라 성공 뒤 혼잡을 푼다." }
  - { b_id: B003, route_order: 300, status: provisional, target_anchor: A02, narrative_function: "황태자궁 주문을 특혜 없는 검수 납품으로 바꾼다.", payoff_axis: "반복 납품·신뢰", carried_reader_debt: "테오도르의 주문 목적", contrast_requirement: "시장 현장과 궁정 검수를 바꾼다." }
  - { b_id: B004, route_order: 400, status: hypothesis, target_anchor: A02, narrative_function: "새 메뉴로 감자주머니 의존을 낮춘다.", payoff_axis: "메뉴 폭", carried_reader_debt: "단일 상품 병목", contrast_requirement: "증산이 아닌 다른 구매 이유를 만든다." }
  - { b_id: B005, route_order: 500, status: hypothesis, target_anchor: A02, narrative_function: "재료 조달을 당일 구매에서 반복 공급으로 바꾼다.", payoff_axis: "재고 안정", carried_reader_debt: "원재료 변동", contrast_requirement: "판매보다 공급자의 선택을 전면에 둔다." }
  - { b_id: B006, route_order: 600, status: hypothesis, target_anchor: A02, narrative_function: "가족의 임시 도움을 보수·권한·책임이 있는 반복 역할로 바꾼다.", payoff_axis: "역할·몫", carried_reader_debt: "무급 가족 총동원과 클로에 단독 운영 위험", contrast_requirement: "클로에 혼자 빨라지는 해법이 아니라 각자의 독립 판단을 남긴다." }
  - { b_id: B007, route_order: 700, status: hypothesis, target_anchor: A02, narrative_function: "반복 장부와 운영비를 구분해 첫 실제 원금 감소를 만든다.", payoff_axis: "상환·신용", carried_reader_debt: "2,300금화 원금과 30일 압류 시계", contrast_requirement: "매출 자랑이 아니라 현금·운영비·채무 상태가 함께 바뀐다." }
  - { b_id: B008, route_order: 800, status: hypothesis, target_anchor: A03, narrative_function: "수도 수요를 에버하르트 생산자의 실제 주문·대금 경로로 연결한다.", payoff_axis: "영지 판로", carried_reader_debt: "몰락 영지와 수도 수요의 분리", contrast_requirement: "점포 안의 판매가 아니라 생산자 선택과 영지 현금흐름을 전면에 둔다." }
  - { b_id: B009, route_order: 900, status: hypothesis, target_anchor: A03, narrative_function: "생산자가 품질을 지키며 다시 선택할 수 있는 가격·거래 기준을 만든다.", payoff_axis: "공급자 신뢰", carried_reader_debt: "저가 매입이 생산자와 품질을 소모할 위험", contrast_requirement: "구매자 일방 평가가 아니라 생산자의 재선택으로 신뢰를 증명한다." }
  - { b_id: B010, route_order: 1000, status: hypothesis, target_anchor: A03, narrative_function: "수도-영지 이동의 손실을 반복 가능한 취급·인수 기준으로 낮춘다.", payoff_axis: "수율·시간", carried_reader_debt: "거리에서 발생하는 품질·수량·시간 손실", contrast_requirement: "새 맛이 아니라 이동과 손실을 병목으로 다룬다." }
  - { b_id: B011, route_order: 1100, status: hypothesis, target_anchor: A03, narrative_function: "중간상의 배타 조건을 대체 거래로 견딘다.", payoff_axis: "선택권", carried_reader_debt: "로엔 상단 도주 배후", contrast_requirement: "정면 응징보다 거래 구조를 바꾼다." }
  - { b_id: B012, route_order: 1200, status: hypothesis, target_anchor: A03, narrative_function: "영지 재료의 첫 수도 히트 상품을 만든다.", payoff_axis: "브랜드·마진", carried_reader_debt: "가공의 실제 가치", contrast_requirement: "초기 감자주머니와 다른 고객·조리법을 쓴다." }
  - { b_id: B013, route_order: 1300, status: hypothesis, target_anchor: A03, narrative_function: "반복 주문을 생산 계획으로 환전한다.", payoff_axis: "예측 가능성", carried_reader_debt: "당일 완판 의존", contrast_requirement: "줄 길이 대신 다음 달 장부를 보인다." }
  - { b_id: B014, route_order: 1400, status: hypothesis, target_anchor: A04, narrative_function: "두 번째 점포 후보를 수요와 책임으로 고른다.", payoff_axis: "확장 선택", carried_reader_debt: "클로에 부재 운영", contrast_requirement: "좋은 자리보다 운영자를 먼저 판정한다." }
  - { b_id: B015, route_order: 1500, status: hypothesis, target_anchor: A04, narrative_function: "새 점포 책임자가 독립 결정을 남긴다.", payoff_axis: "위임", carried_reader_debt: "가족 역할의 성장", contrast_requirement: "심부름이 아니라 손실을 건 선택을 한다." }
  - { b_id: B016, route_order: 1600, status: hypothesis, target_anchor: A04, narrative_function: "점포 간 품질 차이를 공개 기준으로 맞춘다.", payoff_axis: "표준·신뢰", carried_reader_debt: "확장 품질", contrast_requirement: "새 메뉴가 아니라 같은 약속의 재현이다." }
  - { b_id: B017, route_order: 1700, status: hypothesis, target_anchor: A04, narrative_function: "귀족 독점 제안을 거절해 일반 고객의 접근을 지킨다.", payoff_axis: "시장 원칙", carried_reader_debt: "권력 앞 공정성", contrast_requirement: "황태자와 다른 권력 압력을 쓴다." }
  - { b_id: B018, route_order: 1800, status: hypothesis, target_anchor: A04, narrative_function: "거절 비용을 새 거래처로 메운다.", payoff_axis: "회복·다변화", carried_reader_debt: "독점 거절 손실", contrast_requirement: "도덕적 승리가 공짜가 아니다." }
  - { b_id: B019, route_order: 1900, status: hypothesis, target_anchor: A04, narrative_function: "카시안의 현장 지휘를 독립 자산으로 만든다.", payoff_axis: "가족 권한", carried_reader_debt: "장남의 전생 용병화", contrast_requirement: "클로에가 답을 주지 않는 현장이다." }
  - { b_id: B020, route_order: 2000, status: hypothesis, target_anchor: A04, narrative_function: "루시안의 장부가 외부 감사와 거래를 통과한다.", payoff_axis: "재무 신용", carried_reader_debt: "빚 장부의 공포", contrast_requirement: "맛이 아니라 기록이 승리한다." }
  - { b_id: B021, route_order: 2100, status: hypothesis, target_anchor: A05, narrative_function: "대량 주문을 받을지 거절할지 생산 능력으로 판정한다.", payoff_axis: "선택·한계", carried_reader_debt: "규모 성장의 책임", contrast_requirement: "주문 크기를 무조건 보상으로 보지 않는다." }
  - { b_id: B022, route_order: 2200, status: hypothesis, target_anchor: A05, narrative_function: "보존식 또는 이동식 메뉴로 거리 제약을 푼다.", payoff_axis: "기술·유통", carried_reader_debt: "대량 배송 품질", contrast_requirement: "즉석 튀김과 다른 조리 원리를 쓴다." }
  - { b_id: B023, route_order: 2300, status: hypothesis, target_anchor: A05, narrative_function: "첫 지역 단위 급식을 시간 안에 완수한다.", payoff_axis: "처리량·이행", carried_reader_debt: "여러 점포 협업", contrast_requirement: "개인 손님보다 집단의 시간표가 압력이다." }
  - { b_id: B024, route_order: 2400, status: hypothesis, target_anchor: A05, narrative_function: "대량 이행의 실패 비용을 숨기지 않고 복구한다.", payoff_axis: "손실·신뢰 회복", carried_reader_debt: "성장 무오류 위험", contrast_requirement: "완판 대신 보상·재작업을 결산한다." }
  - { b_id: B025, route_order: 2500, status: hypothesis, target_anchor: A05, narrative_function: "베르트랑과 현장 조리팀이 표준을 개선한다.", payoff_axis: "팀 전문성", carried_reader_debt: "천재 1인 의존", contrast_requirement: "조연의 개선이 주인공 계획을 바꾼다." }
  - { b_id: B026, route_order: 2600, status: hypothesis, target_anchor: A05, narrative_function: "지역 공급자 연합과 장기 가격을 합의한다.", payoff_axis: "공급망·책임", carried_reader_debt: "수확 변동", contrast_requirement: "단가를 누르지 않고 위험을 나눈다." }
  - { b_id: B027, route_order: 2700, status: hypothesis, target_anchor: A05, narrative_function: "식당망이 에버하르트 영지의 기본 현금흐름이 된다.", payoff_axis: "영지 지위", carried_reader_debt: "몰락가 낙인", contrast_requirement: "점포 숫자가 아니라 영지민 행동이 변한다." }
  - { b_id: B028, route_order: 2800, status: hypothesis, target_anchor: A06, narrative_function: "전쟁 전조를 공급 수요와 이동으로 먼저 읽는다.", payoff_axis: "판단·준비", carried_reader_debt: "라인하르트 재출정", contrast_requirement: "미래 기억이 아니라 현재 거래 증거로 판단한다." }
  - { b_id: B029, route_order: 2900, status: hypothesis, target_anchor: A06, narrative_function: "민수와 군수 요구 사이에서 식량 배분 원칙을 세운다.", payoff_axis: "책임·선택", carried_reader_debt: "모두를 먹일 수 없는 한계", contrast_requirement: "권력자 주문보다 지역 생존을 비교한다." }
  - { b_id: B030, route_order: 3000, status: hypothesis, target_anchor: A06, narrative_function: "아버지의 출정을 막을 실질 대안을 제시한다.", payoff_axis: "가족 선택권", carried_reader_debt: "전생의 희생 반복", contrast_requirement: "감정 호소가 아니라 물자·신용을 건다." }
  - { b_id: B031, route_order: 3100, status: hypothesis, target_anchor: A06, narrative_function: "테오도르가 황실 이해와 클로에의 조건 사이에서 비용을 낸다.", payoff_axis: "관계·정치 신뢰", carried_reader_debt: "황태자의 독립 욕망", contrast_requirement: "신분 특혜가 아닌 손실 있는 선택이다." }
  - { b_id: B032, route_order: 3200, status: hypothesis, target_anchor: A06, narrative_function: "공급망 일부 손실을 견디고 대체 경로를 연다.", payoff_axis: "회복 탄력", carried_reader_debt: "집중된 운송망", contrast_requirement: "더 많은 생산이 아니라 경로 분산이다." }
  - { b_id: B033, route_order: 3300, status: hypothesis, target_anchor: A06, narrative_function: "가족이 클로에 부재 중 영지 결정을 완수한다.", payoff_axis: "독립 운영", carried_reader_debt: "주인공 과로", contrast_requirement: "클로에가 삭제된 장면에서도 축적이 작동한다." }
  - { b_id: B034, route_order: 3400, status: hypothesis, target_anchor: A06, narrative_function: "전쟁 위험을 낮춘 계약을 영지의 지위 상승으로 닫는다.", payoff_axis: "안전·협상권", carried_reader_debt: "재출정 시계", contrast_requirement: "적 격파보다 떠나지 않아도 되는 조건을 만든다." }
  - { b_id: B035, route_order: 3500, status: hypothesis, target_anchor: A07, narrative_function: "황실 독점 요구와 식당망 소유권을 충돌시킨다.", payoff_axis: "소유권", carried_reader_debt: "황궁 납품의 장기 비용", contrast_requirement: "초기 황궁 고용인 삶을 반복하지 않는다." }
  - { b_id: B036, route_order: 3600, status: hypothesis, target_anchor: A07, narrative_function: "클로에가 자기 노동과 이름의 권리를 문서화한다.", payoff_axis: "통제권", carried_reader_debt: "전생 노동 소모", contrast_requirement: "명예 호칭보다 실질 권리를 얻는다." }
  - { b_id: B037, route_order: 3700, status: hypothesis, target_anchor: A07, narrative_function: "테오도르와의 관계가 왕실 거래와 분리 가능한지 시험한다.", payoff_axis: "관계 선택", carried_reader_debt: "신분과 감정의 혼선", contrast_requirement: "큰 선물 대신 지킨 약속을 증명한다." }
  - { b_id: B038, route_order: 3800, status: hypothesis, target_anchor: A07, narrative_function: "혼인 또는 후계 압력이 가족·사업 권한을 흔든다.", payoff_axis: "경계·합의", carried_reader_debt: "로맨스의 제도 비용", contrast_requirement: "사랑이 사업 문제를 자동 해결하지 않는다." }
  - { b_id: B039, route_order: 3900, status: hypothesis, target_anchor: A07, narrative_function: "오스발트가 채권자가 아닌 독립 증인으로 판단한다.", payoff_axis: "공적 신용", carried_reader_debt: "초기 압류 관계", contrast_requirement: "오랜 상대의 행동 변화로 가치를 보인다." }
  - { b_id: B040, route_order: 4000, status: hypothesis, target_anchor: A07, narrative_function: "회귀 비밀 일부가 가족 관계의 선택 비용이 된다.", payoff_axis: "신뢰·고백", carried_reader_debt: "클로에의 성인 기억", contrast_requirement: "능력 설명보다 가족이 받은 상실을 먼저 다룬다." }
  - { b_id: B041, route_order: 4100, status: hypothesis, target_anchor: A07, narrative_function: "가족이 클로에를 여섯 살과 경영자 모두로 받아들인다.", payoff_axis: "관계 정착", carried_reader_debt: "보호와 자율의 충돌", contrast_requirement: "폭로보다 이후 행동 변화를 결산한다." }
  - { b_id: B042, route_order: 4200, status: hypothesis, target_anchor: A07, narrative_function: "식당망의 승계·지배 구조를 가족 각자의 몫으로 나눈다.", payoff_axis: "소유·책임", carried_reader_debt: "주인공 단독 소유 위험", contrast_requirement: "돈이 아니라 다음 선택권을 나눈다." }
  - { b_id: B043, route_order: 4300, status: hypothesis, target_anchor: A08, narrative_function: "남은 채무와 담보를 정확히 결산한다.", payoff_axis: "채무 해방", carried_reader_debt: "2,300금화", contrast_requirement: "상징 승리보다 장부의 0을 만든다." }
  - { b_id: B044, route_order: 4400, status: hypothesis, target_anchor: A08, narrative_function: "담보였던 광산·점포·영지 자산의 귀속을 확정한다.", payoff_axis: "자산 회복", carried_reader_debt: "압류 위험", contrast_requirement: "빚 상환 뒤 실제 통제권을 확인한다." }
  - { b_id: B045, route_order: 4500, status: hypothesis, target_anchor: A08, narrative_function: "로엔 상단 도주와 전생 몰락 인과를 거래 증거로 닫는다.", payoff_axis: "원인 상환", carried_reader_debt: "도주 배후", contrast_requirement: "복수보다 회수·책임·재발 방지를 남긴다." }
  - { b_id: B046, route_order: 4600, status: hypothesis, target_anchor: A08, narrative_function: "최종 규모 주문이 전체 식당망의 독립 작동을 증명한다.", payoff_axis: "조직 증명", carried_reader_debt: "천재 1인 의존", contrast_requirement: "클로에가 모든 냄비를 직접 잡지 않는다." }
  - { b_id: B047, route_order: 4700, status: hypothesis, target_anchor: A08, narrative_function: "가족 각자가 희생 없이 자기 다음 삶을 고른다.", payoff_axis: "가족 선택권", carried_reader_debt: "전생에 잃은 진로", contrast_requirement: "가족 결속이 개인 소멸이 되지 않는다." }
  - { b_id: B048, route_order: 4800, status: hypothesis, target_anchor: A08, narrative_function: "테오도르와 클로에가 권력 계약 밖 관계 조건을 합의한다.", payoff_axis: "로맨스 결산", carried_reader_debt: "성장형 신뢰", contrast_requirement: "황실 신분이 아닌 상호 약속으로 닫는다." }
  - { b_id: B049, route_order: 4900, status: hypothesis, target_anchor: A08, narrative_function: "클로에가 구원 의무 뒤 자기 욕망을 선택한다.", payoff_axis: "자기 삶", carried_reader_debt: "가족만을 위한 두 번째 생", contrast_requirement: "구원이 끝나도 요리와 경영을 계속할 이유를 고른다." }
  - { b_id: B050, route_order: 5000, status: hypothesis, target_anchor: A08, narrative_function: "초기 손님·가족·채권자가 성장의 영수증으로 돌아온다.", payoff_axis: "사회적 상환", carried_reader_debt: "첫 점포의 약속", contrast_requirement: "설명 회고가 아니라 현재 행동과 구매로 보인다." }
  - { b_id: B051, route_order: 5100, status: hypothesis, target_anchor: A08, narrative_function: "영업을 닫고 가족과 동반자가 한 식탁에 앉는다.", payoff_axis: "엔딩 식사", carried_reader_debt: "함께 먹지 못한 전생", contrast_requirement: "대연회보다 가족석의 따뜻한 한 끼로 착지한다." }
last_reflowed_at: "2026-07-26"
```

## 작성 규칙

- 현재 active B는 정확히 하나이며, provisional은 최대 하나다.
- 먼 B의 구체 음식·손님·화수·해결책은 committed Episode Bet이 아니다.
- B 종결마다 남은 내구 필드를 `keep | revise | retire`로 판정하고 변동 필드는 다시 쓴다.
