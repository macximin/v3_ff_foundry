# 기사식당 Arc Route Rail — B-Rail

상태: active

이 문서는 A01에서 A06 엔딩까지 이어지는 Story Arc 경로다. `B001~B051`은 250화 상단을 빠뜨리지 않기 위한 **용량 골격**이며 정확한 250화·51개 Arc를 확정하는 연표가 아니다. 모든 B는 최대 5화이고, 짧게 닫히면 새 B를 추가하며 엔딩이 당겨지면 남은 B를 `retired`로 보존한다.

```yaml
schema_version: firefly_arc_route_rail_v1
route_to_ending: required
route_status: scaffolded_to_ending
ending_anchor: A06
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
durable_fields:
  - target_anchor
  - narrative_function
  - payoff_axis
  - carried_reader_debt
  - contrast_requirement
volatile_fields:
  - exact_episode_coordinates
  - guest_identity
  - food
  - scene_solution
  - exact_reward
reflow_policy: revalidate_durable_invalidate_volatile
route_invariants:
  - every_b_closes_within_5_approved_episodes
  - food_relief_never_erases_all_cost
  - large_reward_returns_as_operating_responsibility
  - powerful_guests_follow_restaurant_rules_through_action
  - three_year_collapse_pressure_remains_visible
slots:
  - b_id: B001
    route_order: 100
    status: closed
    target_anchor: A01
    narrative_function: "황실의 소유물에서 자기 땅·식당·계약의 주인으로 전환한다."
    payoff_axis: "소유권·판단권·계약"
    carried_reader_debt: "첫 납품과 황실 손님"
    contrast_requirement: "호의가 아니라 권리·정가·책임으로 남긴다."
    start_episode: ep001
    end_episode: ep003
    closeout_receipt: ../05_review/arc_B001_closeout.md
  - b_id: B002
    route_order: 200
    status: active
    target_anchor: A02
    narrative_function: "혼자 잘하는 카일을 반복 생산 조직의 책임자로 시험한다."
    payoff_axis: "고용·표준화·첫 인수"
    carried_reader_debt: "30일 준비와 황실 손님"
    contrast_requirement: "기적의 한 그릇이 아니라 타인이 재현하는 품질을 증명한다."
  - b_id: B003
    route_order: 300
    status: provisional
    target_anchor: A02
    narrative_function: "지방 권력 또는 공급 병목 속에서 하르벤 소유권을 실제 운영으로 방어한다."
    payoff_axis: "법적 권리·주민·공급"
    carried_reader_debt: "도로와 창고의 현실 효용"
    contrast_requirement: "거물의 명령이 아니라 카일과 주민의 실행으로 닫는다."
  - { b_id: B004, route_order: 400, status: hypothesis, target_anchor: A02, narrative_function: "첫 납품 뒤 품질 편차를 기록 가능한 검수·교환 규칙으로 바꾼다.", payoff_axis: "품질·신용", carried_reader_debt: "3개월 계약 시험", contrast_requirement: "성공 인증보다 불량 책임과 교정 행동을 보인다." }
  - { b_id: B005, route_order: 500, status: hypothesis, target_anchor: A02, narrative_function: "작업자 임금과 역할을 반복 가능한 생산조로 고정한다.", payoff_axis: "고용·위임", carried_reader_debt: "카일 혼자 병목", contrast_requirement: "주인공이 전부 직접 하는 해결을 피한다." }
  - { b_id: B006, route_order: 600, status: hypothesis, target_anchor: A02, narrative_function: "현지 물·달걀 규격 차이를 주둔지별 교육과 인수 기준으로 흡수한다.", payoff_axis: "교육·재현성", carried_reader_debt: "현지 조달 책임", contrast_requirement: "새 재료가 아니라 같은 규격을 다른 현장에서 재현한다." }
  - { b_id: B007, route_order: 700, status: hypothesis, target_anchor: A02, narrative_function: "황실 손님의 특혜 요구를 정가·대기·안전 규칙으로 재판한다.", payoff_axis: "신분 역전·황실 압력", carried_reader_debt: "이세라의 시험", contrast_requirement: "아델린과 다른 욕망과 행동 비용을 쓴다." }
  - { b_id: B008, route_order: 800, status: hypothesis, target_anchor: A02, narrative_function: "첫 월말 정산이 선금과 실제 매출을 분리해 사업의 현금흐름을 증명한다.", payoff_axis: "정산·현금흐름", carried_reader_debt: "잔금 200금화", contrast_requirement: "큰 계약액이 아니라 인수된 물량만 돈이 된다." }
  - { b_id: B009, route_order: 900, status: hypothesis, target_anchor: A02, narrative_function: "하르벤의 첫 반복 고용과 시장이 생활권의 최소 기본값을 만든다.", payoff_axis: "주민·장터·정착", carried_reader_debt: "폐허 마을 재생", contrast_requirement: "거물 단골보다 평범한 주민의 행동 변화를 남긴다." }
  - { b_id: B010, route_order: 1000, status: hypothesis, target_anchor: A03, narrative_function: "새 결핍의 손님이 음식 엔진을 질병 치료 밖으로 넓힌다.", payoff_axis: "감각·선택", carried_reader_debt: "완치 금지", contrast_requirement: "아델린의 온도 회복을 반복하지 않는다." }
  - { b_id: B011, route_order: 1100, status: hypothesis, target_anchor: A03, narrative_function: "노동을 원하는 권력자가 식당 일로 자기 몫을 얻는다.", payoff_axis: "노동·존중", carried_reader_debt: "거물 관심의 단계적 이동", contrast_requirement: "돈이나 군납이 아닌 행동으로 관계를 바꾼다." }
  - { b_id: B012, route_order: 1200, status: hypothesis, target_anchor: A03, narrative_function: "기관의 성물화·독점 시도를 영업 규칙과 책임 계약으로 되돌린다.", payoff_axis: "독립성·제도", carried_reader_debt: "음식의 과잉 해석", contrast_requirement: "초월적 권위가 메뉴를 소유하지 못하게 한다." }
  - { b_id: B013, route_order: 1300, status: hypothesis, target_anchor: A03, narrative_function: "마법 분석이 실패해도 카일의 조리 원리는 관찰·실험으로 설명 가능하게 남긴다.", payoff_axis: "전문성·검증", carried_reader_debt: "오러 밖 실력", contrast_requirement: "신비화가 아니라 재현 가능한 선택을 보인다." }
  - { b_id: B014, route_order: 1400, status: hypothesis, target_anchor: A03, narrative_function: "식재료 보존 기술을 재고일과 폐기 손실 감소로 환전한다.", payoff_axis: "재고·기술", carried_reader_debt: "공급 안정성", contrast_requirement: "새 능력보다 운영비 절감을 보상한다." }
  - { b_id: B015, route_order: 1500, status: hypothesis, target_anchor: A03, narrative_function: "대상단의 계약 제안을 카일의 정가·비독점 원칙과 맞춘다.", payoff_axis: "유통·협상", carried_reader_debt: "북부 우선구매와 타시장 판매", contrast_requirement: "북부 계약 복사 대신 다른 거래 비용을 세운다." }
  - { b_id: B016, route_order: 1600, status: hypothesis, target_anchor: A03, narrative_function: "장터의 급성장이 가격 폭등과 주민 밀려남을 부를 때 성장 규칙을 정한다.", payoff_axis: "시장·공정성", carried_reader_debt: "하르벤 주민 몫", contrast_requirement: "매출 상승이 자동 선이 되지 않는다." }
  - { b_id: B017, route_order: 1700, status: hypothesis, target_anchor: A03, narrative_function: "곡물 창고와 겨울 비축을 수량·회전·손실 기준으로 세운다.", payoff_axis: "식량·비축", carried_reader_debt: "멸망 대비", contrast_requirement: "레스토랑 인기를 생존 물자로 바꾼다." }
  - { b_id: B018, route_order: 1800, status: hypothesis, target_anchor: A03, narrative_function: "식당·장터·창고의 최소 운영체계를 반복 수익과 주민 신뢰로 닫는다.", payoff_axis: "생활권·신용", carried_reader_debt: "황실의 직접 개입", contrast_requirement: "일회성 큰돈이 아니라 기본값 상승으로 결산한다." }
  - { b_id: B019, route_order: 1900, status: hypothesis, target_anchor: A04, narrative_function: "이세라의 직접 방문이 카일의 선택권과 프롤로그 소유 선언을 재판한다.", payoff_axis: "관계·황실 압력", carried_reader_debt: "카일은 누구의 검인가", contrast_requirement: "무력 승부가 아니라 손님 규칙과 기억의 비용으로 맞선다." }
  - { b_id: B020, route_order: 2000, status: hypothesis, target_anchor: A04, narrative_function: "황실 예약·징발·독점 요구를 일반 손님과 같은 권리 구조로 바꾼다.", payoff_axis: "규칙·권한", carried_reader_debt: "황실 특혜", contrast_requirement: "북부와 맺은 자발적 거래와 황실 명령을 대비한다." }
  - { b_id: B021, route_order: 2100, status: hypothesis, target_anchor: A04, narrative_function: "이세라와 카일의 전쟁 기억이 소유와 보상의 의미를 다시 정한다.", payoff_axis: "기억·관계", carried_reader_debt: "돈까스와 과거의 한 끼", contrast_requirement: "즉시 연애나 용서로 닫지 않는다." }
  - { b_id: B022, route_order: 2200, status: hypothesis, target_anchor: A04, narrative_function: "계승 세력의 식당 장악 시도가 하르벤의 법적·경제적 방어를 시험한다.", payoff_axis: "법·동맹·비용", carried_reader_debt: "제국 내전 전조", contrast_requirement: "거물 한 명의 보호로 해결하지 않는다." }
  - { b_id: B023, route_order: 2300, status: hypothesis, target_anchor: A04, narrative_function: "서로 적대하는 단골들이 한 식탁의 최소 합의를 행동으로 만든다.", payoff_axis: "관계·협력", carried_reader_debt: "미래의 세력 충돌", contrast_requirement: "모두 카일을 좋아해서 협력하는 해결을 피한다." }
  - { b_id: B024, route_order: 2400, status: hypothesis, target_anchor: A04, narrative_function: "식당 정보가 군사 정보로 오인될 때 카일이 사업과 정치의 경계를 정한다.", payoff_axis: "정보·중립", carried_reader_debt: "군납의 정치적 의미", contrast_requirement: "모른 척보다 책임 범위를 명시한다." }
  - { b_id: B025, route_order: 2500, status: hypothesis, target_anchor: A04, narrative_function: "하르벤 주민이 거물 손님 때문에 치르는 생활 비용을 보상 구조로 닫는다.", payoff_axis: "주민·관계", carried_reader_debt: "성장의 외부 비용", contrast_requirement: "주인공의 성공 뒤 밀려난 사람을 보인다." }
  - { b_id: B026, route_order: 2600, status: hypothesis, target_anchor: A04, narrative_function: "황실과 북부의 상충 주문을 생산량·납기·가격으로 선택한다.", payoff_axis: "선택·기회비용", carried_reader_debt: "한정 생산력", contrast_requirement: "모든 주문을 동시에 만족시키지 않는다." }
  - { b_id: B027, route_order: 2700, status: hypothesis, target_anchor: A04, narrative_function: "카일의 중립이 실제 손해를 낳을 때 지킬 것과 버릴 것을 정한다.", payoff_axis: "손실·정체성", carried_reader_debt: "독립의 가격", contrast_requirement: "원칙을 지키고도 전액 환급받지 않는다." }
  - { b_id: B028, route_order: 2800, status: hypothesis, target_anchor: A04, narrative_function: "황실 방문 구간을 카일의 선택권과 하르벤 자치의 새 기본값으로 닫는다.", payoff_axis: "자치·관계 재정의", carried_reader_debt: "다가오는 계승 분쟁", contrast_requirement: "황궁 복귀가 아닌 새로운 거리와 계약을 만든다." }
  - { b_id: B029, route_order: 2900, status: hypothesis, target_anchor: A05, narrative_function: "기근 전조를 가격·재고·이동 변화로 먼저 판독한다.", payoff_axis: "정보·준비", carried_reader_debt: "3년 멸망 시한", contrast_requirement: "재난 뒤 수습보다 재난 전 선택을 보상한다." }
  - { b_id: B030, route_order: 3000, status: hypothesis, target_anchor: A05, narrative_function: "곡물 매점과 사재기를 주민 식량권과 거래 비용으로 제어한다.", payoff_axis: "식량·시장", carried_reader_debt: "비축의 도덕적 비용", contrast_requirement: "부자가 된 카일이 전부 사는 해결을 피한다." }
  - { b_id: B031, route_order: 3100, status: hypothesis, target_anchor: A05, narrative_function: "첫 피난민 유입이 식당·주거·일자리의 수용 한계를 드러낸다.", payoff_axis: "피난·고용", carried_reader_debt: "누구를 받을 것인가", contrast_requirement: "선의만으로 무한 수용하지 않는다." }
  - { b_id: B032, route_order: 3200, status: hypothesis, target_anchor: A05, narrative_function: "피난민의 기술과 노동을 하르벤 생산력으로 전환한다.", payoff_axis: "사람·위임", carried_reader_debt: "의존과 정착", contrast_requirement: "구제 대상이 독립 행동을 남기게 한다." }
  - { b_id: B033, route_order: 3300, status: hypothesis, target_anchor: A05, narrative_function: "도로 봉쇄가 공급망을 끊을 때 우회 경로와 비용을 선택한다.", payoff_axis: "물류·시간", carried_reader_debt: "외부 의존", contrast_requirement: "마법 이동으로 거리를 지우지 않는다." }
  - { b_id: B034, route_order: 3400, status: hypothesis, target_anchor: A05, narrative_function: "창고 손실이나 오염이 비축의 취약성을 실제 비용으로 남긴다.", payoff_axis: "손실·복구", carried_reader_debt: "재고 안전", contrast_requirement: "같은 장면에서 더 큰 보상으로 상쇄하지 않는다." }
  - { b_id: B035, route_order: 3500, status: hypothesis, target_anchor: A05, narrative_function: "하르벤 방위가 기사 카일과 식당주 카일의 역할 충돌을 연다.", payoff_axis: "방위·정체성", carried_reader_debt: "칼을 다시 들 것인가", contrast_requirement: "무력만으로 식량·정치 문제를 끝내지 않는다." }
  - { b_id: B036, route_order: 3600, status: hypothesis, target_anchor: A05, narrative_function: "주민 방위조와 생산조의 역할을 분리해 카일 없이도 움직이게 한다.", payoff_axis: "조직·자율", carried_reader_debt: "카일 과부하", contrast_requirement: "주인공의 개인 전투력보다 조직 선택을 남긴다." }
  - { b_id: B037, route_order: 3700, status: hypothesis, target_anchor: A05, narrative_function: "거물 동맹이 하르벤을 돕는 대신 요구하는 대가를 공개 계약으로 정한다.", payoff_axis: "동맹·대가", carried_reader_debt: "중립의 한계", contrast_requirement: "우정과 집착을 공짜 자원으로 쓰지 않는다." }
  - { b_id: B038, route_order: 3800, status: hypothesis, target_anchor: A05, narrative_function: "서로 다른 피난 집단의 음식·규칙 충돌을 한 생활권의 합의로 바꾼다.", payoff_axis: "공동체·합의", carried_reader_debt: "하르벤의 정체", contrast_requirement: "한 메뉴로 모두 화해시키지 않는다." }
  - { b_id: B039, route_order: 3900, status: hypothesis, target_anchor: A05, narrative_function: "내전 첫 충격이 시장·도로·식당을 동시에 시험한다.", payoff_axis: "복합 운영·생존", carried_reader_debt: "제국 붕괴 현실화", contrast_requirement: "한 부문의 성공이 다른 부문의 비용을 가리지 않는다." }
  - { b_id: B040, route_order: 4000, status: hypothesis, target_anchor: A05, narrative_function: "하르벤의 식량·피난·방위 최소 체계를 실제 생존 결과로 닫는다.", payoff_axis: "생활권·책임", carried_reader_debt: "제국 최종 붕괴", contrast_requirement: "숫자 성장보다 사람들이 남아 사는 표면을 만든다." }
  - { b_id: B041, route_order: 4100, status: hypothesis, target_anchor: A06, narrative_function: "황제 사망 또는 계승 붕괴가 원작 시한을 현재형 사건으로 바꾼다.", payoff_axis: "시한 상환·선택", carried_reader_debt: "누구와 무엇을 지킬 것인가", contrast_requirement: "미래 지식이 자동 정답을 주지 않는다." }
  - { b_id: B042, route_order: 4200, status: hypothesis, target_anchor: A06, narrative_function: "하르벤의 자원 부족이 모든 세력을 받을 수 없다는 결정을 요구한다.", payoff_axis: "배분·책임", carried_reader_debt: "거물과 주민의 우선순위", contrast_requirement: "모두 구하는 무비용 선택을 피한다." }
  - { b_id: B043, route_order: 4300, status: hypothesis, target_anchor: A06, narrative_function: "이세라와 아델린의 최종 이해 충돌을 카일의 자치 원칙으로 재판한다.", payoff_axis: "관계·권력", carried_reader_debt: "소유와 동맹의 결산", contrast_requirement: "카일이 상품이나 연애 보상으로 귀속되지 않는다." }
  - { b_id: B044, route_order: 4400, status: hypothesis, target_anchor: A06, narrative_function: "대규모 피난 행렬을 음식·검수·숙영·노동으로 나눠 처리한다.", payoff_axis: "규모·운영", carried_reader_debt: "생활권 처리량", contrast_requirement: "개인 영웅담보다 시스템과 사람의 독립 행동을 보인다." }
  - { b_id: B045, route_order: 4500, status: hypothesis, target_anchor: A06, narrative_function: "공급망 최종 단절을 하르벤 내부 생산의 자립 시험으로 바꾼다.", payoff_axis: "자립·식량", carried_reader_debt: "외부 거래 없이 버티는가", contrast_requirement: "숨겨 둔 무한 재고를 꺼내지 않는다." }
  - { b_id: B046, route_order: 4600, status: hypothesis, target_anchor: A06, narrative_function: "기사식당이 개인 가게와 공동 급식소 사이에서 지킬 핵심을 정한다.", payoff_axis: "사업 정체성·공공성", carried_reader_debt: "성장 뒤 원래 욕망", contrast_requirement: "식당을 국가 기관으로 흡수하지 않는다." }
  - { b_id: B047, route_order: 4700, status: hypothesis, target_anchor: A06, narrative_function: "카일이 없어도 생산·배식·검수가 도는 하루를 만든다.", payoff_axis: "위임·지속성", carried_reader_debt: "최종 거물상", contrast_requirement: "주인공 부재가 즉시 붕괴로 이어지지 않는다." }
  - { b_id: B048, route_order: 4800, status: hypothesis, target_anchor: A06, narrative_function: "원작의 파멸 인물들이 각자 비용을 내고 하르벤 규칙에 참여한다.", payoff_axis: "재배치·동맹", carried_reader_debt: "파멸 플래그", contrast_requirement: "카일의 음식 한입이 성격을 자동 개조하지 않는다." }
  - { b_id: B049, route_order: 4900, status: hypothesis, target_anchor: A06, narrative_function: "제국의 법적 소멸이 하르벤 토지권과 계약 권위를 다시 묻는다.", payoff_axis: "자치·정당성", carried_reader_debt: "황실 인장 이후의 권리", contrast_requirement: "옛 문서만으로 새 질서를 해결하지 않는다." }
  - { b_id: B050, route_order: 5000, status: hypothesis, target_anchor: A06, narrative_function: "하르벤 사람들이 카일을 주인이자 선택 가능한 지도자로 승인하거나 거부한다.", payoff_axis: "관계·정당성", carried_reader_debt: "누구의 삶인가", contrast_requirement: "작위나 혈통이 아니라 타인의 행동으로 지위를 남긴다." }
  - { b_id: B051, route_order: 5100, status: hypothesis, target_anchor: A06, narrative_function: "제국 깃발이 사라진 뒤에도 기사식당과 생활권이 자립하는 엔딩을 닫는다.", payoff_axis: "생존·소유·일상", carried_reader_debt: "3년 시한 전체", contrast_requirement: "황궁 복귀나 새 제국의 검이 아니라 자기 삶의 주인으로 끝낸다." }
last_reflowed_at: 2026-07-25
```

## 운용 규칙

- B001만 승인 원고 history로 닫혔다. B002의 정확한 ep004 내용은 Episode Bet 승인 전까지 가설이다.
- B003 이후에는 음식·손님·장면·정확한 보상을 미리 잠그지 않는다.
- 각 B close 때 남은 슬롯의 내구 필드를 `keep | revise | retire`로 판정하고 변동 필드는 무효화한다.
- 엔딩이 당겨지면 남은 B ID를 삭제하거나 재번호화하지 않고 `retired`로 남긴다.
