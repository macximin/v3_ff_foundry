# 저승식당 Arc Route Rail — B-Rail

상태: active

이 문서는 A01에서 A08 엔딩까지 이어지는 Story Arc 경로다. `B001~B051`은 250화 상단을 빠뜨리지 않기 위한 **용량 골격**이며 250화·51개 Arc를 확정하는 연표가 아니다. 모든 B는 최대 5화이고, 짧게 닫히면 새 B를 추가하며 엔딩이 당겨지면 남은 B를 `retired`로 남긴다.

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
  - guest_or_relationship_omnibus_closes_in_1_to_3_episodes_by_default
  - every_b_closes_within_5_approved_episodes
  - no_fixed_antagonist_required
  - no_rpg_system_expansion
  - emotional_payoff_precedes_animation_fit
slots:
  - b_id: B001
    route_order: 100
    status: closed
    target_anchor: A01
    narrative_function: "첫 손님 배웅과 첫 밑천으로 감정·경영 이중 엔진을 증명한다."
    payoff_axis: "완식·귀환 1일·현금·재고·공급계약"
    carried_reader_debt: "개인별 노잣돈, 첫 실제 실패 비용"
    contrast_requirement: "빈 식당에서 다음 손님을 받을 수 있는 식당으로 바뀐다."
    start_episode: ep001
    end_episode: ep003
    closeout_receipt: ../05_review/arc_B001_closeout.md
  - b_id: B002
    route_order: 200
    status: active
    target_anchor: A02
    narrative_function: "혀 없는 손님을 통해 맛의 경계를 넓히고 첫 비환급 손실을 감수한다."
    payoff_axis: "손님 신뢰 회복·두 번째 귀환 하루·손실 확정"
    carried_reader_debt: "개인별 노잣돈, 공주의 이름과 선택"
    contrast_requirement: "첫 성공의 반복이 아니라 실패 뒤 재착석을 얻는다."
  - b_id: B003
    route_order: 300
    status: provisional
    target_anchor: A02
    narrative_function: "귀환 일수와 식대를 분리하고 동시 주문이 여는 운영 병목을 현재형 사건으로 만든다."
    payoff_axis: "장부 분리·계약 검수·공주의 책임 행동"
    carried_reader_debt: "공주의 가출 이유, 하진의 계약 비용"
    contrast_requirement: "감각 난제에서 운영 선택으로 보상 종류를 바꾼다."
  - b_id: B004
    route_order: 400
    status: hypothesis
    target_anchor: A03
    narrative_function: "동시 수요를 대기 규칙과 좌석 흐름으로 바꾼다."
    payoff_axis: "처리량"
    carried_reader_debt: "네 탁자와 한 명의 종업원 병목"
    contrast_requirement: "개별 완식이 아니라 여러 손님 사이의 선택을 보인다."
  - b_id: B005
    route_order: 500
    status: hypothesis
    target_anchor: A03
    narrative_function: "재료 변질과 결품을 기록 가능한 재고 규칙으로 바꾼다."
    payoff_axis: "재고일·손실 방지"
    carried_reader_debt: "불안한 공급 안정성"
    contrast_requirement: "좌석 문제가 아니라 물건의 시간 문제를 푼다."
  - b_id: B006
    route_order: 600
    status: hypothesis
    target_anchor: A03
    narrative_function: "반복 보조 인력이 도윤과 공주의 역할을 실제로 덜어내게 한다."
    payoff_axis: "역할·위임"
    carried_reader_debt: "둘뿐인 현장"
    contrast_requirement: "새 인물이 구경꾼이 아니라 독립 행동을 남긴다."
  - b_id: B007
    route_order: 700
    status: hypothesis
    target_anchor: A03
    narrative_function: "운영 기록과 반복 거래를 시장 신용으로 환전해 최소 운영체계를 닫는다."
    payoff_axis: "신용·반복성"
    carried_reader_debt: "식당 부진 원인, 공급 위험"
    contrast_requirement: "일회성 큰돈보다 반복 가능한 기본값을 만든다."
  - b_id: B008
    route_order: 800
    status: hypothesis
    target_anchor: A04
    narrative_function: "관계 집단이 한꺼번에 들어올 때 서로 다른 주문을 분리한다."
    payoff_axis: "관계 판독"
    carried_reader_debt: "개인 옴니버스의 집단 확장"
    contrast_requirement: "한 사람의 미련과 다른 집단 압력을 연다."
  - b_id: B009
    route_order: 900
    status: hypothesis
    target_anchor: A04
    narrative_function: "상충하는 마지막 식사 요구를 한 식탁의 규칙으로 조정한다."
    payoff_axis: "선택·합의"
    carried_reader_debt: "완식이 타인의 이별을 강제하는 비용"
    contrast_requirement: "모두를 만족시키는 자동 정답을 피한다."
  - b_id: B010
    route_order: 1000
    status: hypothesis
    target_anchor: A04
    narrative_function: "한 사람의 완식이 남은 사람에게 만든 후폭풍을 결산한다."
    payoff_axis: "인간 후폭풍"
    carried_reader_debt: "집단 안의 불균등한 이별"
    contrast_requirement: "조리 성공 뒤 관계 비용을 독립 보상으로 둔다."
  - b_id: B011
    route_order: 1100
    status: hypothesis
    target_anchor: A04
    narrative_function: "공주와 보조 인력이 한 식탁의 선택을 나눠 책임지게 한다."
    payoff_axis: "팀 판단"
    carried_reader_debt: "도윤 중심 해결의 한계"
    contrast_requirement: "위임이 단순 심부름이 아니라 결과를 바꾼다."
  - b_id: B012
    route_order: 1200
    status: hypothesis
    target_anchor: A04
    narrative_function: "대량 조리와 개인의 마지막 한 입을 동시에 살리는 방식을 얻는다."
    payoff_axis: "규모·개별성"
    carried_reader_debt: "집단 손님의 처리량"
    contrast_requirement: "속도 상승이 감정 생략이 되지 않게 한다."
  - b_id: B013
    route_order: 1300
    status: hypothesis
    target_anchor: A04
    narrative_function: "집단 배웅의 최소 규칙을 외부 거점 요청을 받을 자격으로 환전한다."
    payoff_axis: "명분·확장권"
    carried_reader_debt: "황천장 밖 손님 요구"
    contrast_requirement: "식당 내부 성공을 바깥의 요청으로 바꾼다."
  - b_id: B014
    route_order: 1400
    status: hypothesis
    target_anchor: A05
    narrative_function: "황천장 밖 첫 요청의 가치와 위험을 판별한다."
    payoff_axis: "선택권"
    carried_reader_debt: "외부 거점 필요"
    contrast_requirement: "확장을 자동 수락하지 않고 조건을 고른다."
  - b_id: B015
    route_order: 1500
    status: hypothesis
    target_anchor: A05
    narrative_function: "거리와 이동 제약을 공급·배웅 동선으로 바꾼다."
    payoff_axis: "동선·시간"
    carried_reader_debt: "기존 식당 밖 운영"
    contrast_requirement: "주방 내부가 아닌 경로 자체가 문제다."
  - b_id: B016
    route_order: 1600
    status: hypothesis
    target_anchor: A05
    narrative_function: "기존 재료가 통하지 않는 지역 규칙에 조리 원칙을 적응시킨다."
    payoff_axis: "전문성 확장"
    carried_reader_debt: "지역별 저승 규칙"
    contrast_requirement: "같은 메뉴 반복이 아니라 원칙의 변형을 증명한다."
  - b_id: B017
    route_order: 1700
    status: hypothesis
    target_anchor: A05
    narrative_function: "외부 공급을 거래 조건과 검수 책임으로 고정한다."
    payoff_axis: "공급망"
    carried_reader_debt: "원거리 품질 위험"
    contrast_requirement: "호의가 아니라 반복 가능한 계약으로 남긴다."
  - b_id: B018
    route_order: 1800
    status: hypothesis
    target_anchor: A05
    narrative_function: "현장 책임자가 도윤 없이도 한 결정을 책임지게 한다."
    payoff_axis: "권한 위임"
    carried_reader_debt: "도윤 부재 시 운영"
    contrast_requirement: "대리인이 정답 전달자가 아니라 비용을 건다."
  - b_id: B019
    route_order: 1900
    status: hypothesis
    target_anchor: A05
    narrative_function: "공주와 도윤의 권한 충돌을 운영 합의로 결산한다."
    payoff_axis: "관계·권한"
    carried_reader_debt: "왕실 권한과 현장 기준"
    contrast_requirement: "고정 적대자가 아니라 동료 간 이해관계 충돌을 쓴다."
  - b_id: B020
    route_order: 2000
    status: hypothesis
    target_anchor: A05
    narrative_function: "첫 외부 거점이 독립적으로 손님을 배웅하는 증거를 만든다."
    payoff_axis: "복제 가능성"
    carried_reader_debt: "현장 위임의 신뢰"
    contrast_requirement: "확장 숫자보다 독립 행동을 보여 준다."
  - b_id: B021
    route_order: 2100
    status: hypothesis
    target_anchor: A05
    narrative_function: "외부 거점의 비용과 책임을 다음 집단 도착을 받을 네트워크로 닫는다."
    payoff_axis: "네트워크·책임"
    carried_reader_debt: "재난 규모의 동시 도착"
    contrast_requirement: "새 거점이 공짜 자산이 아니라 새 책임이 된다."
  - b_id: B022
    route_order: 2200
    status: hypothesis
    target_anchor: A06
    narrative_function: "집단 도착의 전조를 읽고 감당 가능한 범위를 선택한다."
    payoff_axis: "판단·준비"
    carried_reader_debt: "대규모 손님 압력"
    contrast_requirement: "도착 뒤 수습보다 도착 전 판단을 보상한다."
  - b_id: B023
    route_order: 2300
    status: hypothesis
    target_anchor: A06
    narrative_function: "제한 시간 안에 손님 우선순위를 정하는 기준을 만든다."
    payoff_axis: "시간·윤리"
    carried_reader_debt: "모두를 완벽히 받을 수 없는 한계"
    contrast_requirement: "능력 확장이 선택 비용을 없애지 않는다."
  - b_id: B024
    route_order: 2400
    status: hypothesis
    target_anchor: A06
    narrative_function: "대량 전처리와 조리 흐름을 팀 단위로 재설계한다."
    payoff_axis: "처리량"
    carried_reader_debt: "단체 조리 병목"
    contrast_requirement: "개인 장인기보다 운영 설계가 전면에 선다."
  - b_id: B025
    route_order: 2500
    status: hypothesis
    target_anchor: A06
    narrative_function: "대량 처리 속에서도 개인별 마지막 한 입을 보존한다."
    payoff_axis: "개별 배웅"
    carried_reader_debt: "규모가 감정을 삼킬 위험"
    contrast_requirement: "처리량 상승과 감정 상환을 같은 결산에 묶는다."
  - b_id: B026
    route_order: 2600
    status: hypothesis
    target_anchor: A06
    narrative_function: "팀의 역할 분리가 실제 실패를 줄이는 장면을 만든다."
    payoff_axis: "조직 능력"
    carried_reader_debt: "도윤의 과부하"
    contrast_requirement: "도윤 혼자 더 빨라지는 해결을 피한다."
  - b_id: B027
    route_order: 2700
    status: hypothesis
    target_anchor: A06
    narrative_function: "규모가 커진 실패 비용을 숨기지 않고 복구 선택으로 결산한다."
    payoff_axis: "손실·회복"
    carried_reader_debt: "확장 리스크"
    contrast_requirement: "성장 구간에도 비환급 비용을 남긴다."
  - b_id: B028
    route_order: 2800
    status: hypothesis
    target_anchor: A06
    narrative_function: "여러 거점이 같은 기준으로 협력하되 현장 판단을 유지하게 한다."
    payoff_axis: "조정·자율"
    carried_reader_debt: "거점 간 충돌"
    contrast_requirement: "중앙 명령 하나로 모든 문제가 풀리지 않는다."
  - b_id: B029
    route_order: 2900
    status: hypothesis
    target_anchor: A06
    narrative_function: "배웅의 결과가 생존자나 바깥 관계에 남는 반응을 회수한다."
    payoff_axis: "외부 가치 신호"
    carried_reader_debt: "식당 밖 인간 후폭풍"
    contrast_requirement: "내부 장부가 아닌 타인의 행동으로 가치를 증명한다."
  - b_id: B030
    route_order: 3000
    status: hypothesis
    target_anchor: A06
    narrative_function: "도윤의 내가 다 한다는 과신을 역할 분담으로 꺾는다."
    payoff_axis: "성장·관계"
    carried_reader_debt: "도윤 없이 서는 식당"
    contrast_requirement: "패배가 능력 박탈이 아니라 운영 방식 변화로 이어진다."
  - b_id: B031
    route_order: 3100
    status: hypothesis
    target_anchor: A06
    narrative_function: "집단 배웅 체계를 귀환 임박 구간의 독립 운영 기반으로 닫는다."
    payoff_axis: "독립성·귀환 진전"
    carried_reader_debt: "도윤이 떠날 수 있는가"
    contrast_requirement: "큰 성공을 떠날 준비라는 새 압력으로 바꾼다."
  - b_id: B032
    route_order: 3200
    status: hypothesis
    target_anchor: A07
    narrative_function: "누적 귀환 일수가 실제 선택을 요구하는 거리로 들어오게 한다."
    payoff_axis: "귀환 현실성"
    carried_reader_debt: "1,095일의 의미"
    contrast_requirement: "숫자 상승을 관계 선택의 비용으로 바꾼다."
  - b_id: B033
    route_order: 3300
    status: hypothesis
    target_anchor: A07
    narrative_function: "소율의 제한된 징후로 현실 귀환의 보상을 구체화한다."
    payoff_axis: "부녀 관계"
    carried_reader_debt: "프렌치토스트와 재회"
    contrast_requirement: "추상 생환이 아니라 기다리는 사람의 현재를 보여 준다."
  - b_id: B034
    route_order: 3400
    status: hypothesis
    target_anchor: A07
    narrative_function: "생환 계약의 숨은 비용을 현재 선택 가능한 조건으로 드러낸다."
    payoff_axis: "규칙·대가"
    carried_reader_debt: "하진의 계약 진실"
    contrast_requirement: "설명문이 아니라 손해를 고르는 상황으로 공개한다."
  - b_id: B035
    route_order: 3500
    status: hypothesis
    target_anchor: A07
    narrative_function: "하진이 예외를 연 이유와 치른 비용을 인간 행동으로 상환한다."
    payoff_axis: "관계·진실"
    carried_reader_debt: "하진의 선택 이유"
    contrast_requirement: "관리자를 시스템 음성으로 축소하지 않는다."
  - b_id: B036
    route_order: 3600
    status: hypothesis
    target_anchor: A07
    narrative_function: "공주의 계승 압력이 식당의 독립성과 충돌하게 한다."
    payoff_axis: "신분·독립"
    carried_reader_debt: "궁을 떠난 이유"
    contrast_requirement: "고정 악역보다 양립하기 어려운 책임을 압력으로 쓴다."
  - b_id: B037
    route_order: 3700
    status: hypothesis
    target_anchor: A07
    narrative_function: "식당이 왕실이나 도윤 개인 없이도 설 수 있는 소유 원칙을 정한다."
    payoff_axis: "소유·통제권"
    carried_reader_debt: "식당의 장기 주체"
    contrast_requirement: "감정적 약속을 실제 권한 구조로 환전한다."
  - b_id: B038
    route_order: 3800
    status: hypothesis
    target_anchor: A07
    narrative_function: "후계 역할을 맡을 사람들의 선택과 거절을 검증한다."
    payoff_axis: "후계·선택권"
    carried_reader_debt: "도윤 부재 이후"
    contrast_requirement: "후계자를 지명만 하지 않고 독립 의사를 확인한다."
  - b_id: B039
    route_order: 3900
    status: hypothesis
    target_anchor: A07
    narrative_function: "거점·창고·조리법의 소유와 사용권을 떠날 수 있는 구조로 정리한다."
    payoff_axis: "자산·사용권"
    carried_reader_debt: "확장 자산의 귀속"
    contrast_requirement: "큰 보상을 장식이 아니라 다음 선택의 자유로 만든다."
  - b_id: B040
    route_order: 4000
    status: hypothesis
    target_anchor: A07
    narrative_function: "도윤의 조리 원칙을 타인이 재현할 수 있는 교육과 기록으로 바꾼다."
    payoff_axis: "전승·운영"
    carried_reader_debt: "도윤 개인기 의존"
    contrast_requirement: "레시피 공개가 감각적 장면과 인간 판단을 지우지 않는다."
  - b_id: B041
    route_order: 4100
    status: hypothesis
    target_anchor: A07
    narrative_function: "도윤이 자리를 비운 상태에서 식당의 실제 스트레스 테스트를 치른다."
    payoff_axis: "독립 운영 증명"
    carried_reader_debt: "후계 구조의 실효성"
    contrast_requirement: "보고가 아니라 도윤 없이 내려진 선택으로 통과한다."
  - b_id: B042
    route_order: 4200
    status: hypothesis
    target_anchor: A07
    narrative_function: "돌아갈 사람과 남을 사람의 관계 선택을 손님 배웅과 겹쳐 결산한다."
    payoff_axis: "이별·자기결정"
    carried_reader_debt: "공주·하진과의 관계"
    contrast_requirement: "손님 사연이 주인공 관계의 거울로 작동한다."
  - b_id: B043
    route_order: 4300
    status: hypothesis
    target_anchor: A07
    narrative_function: "계약 예외나 귀환 지연의 실제 비용을 치르고 선택을 확정한다."
    payoff_axis: "비가역 비용"
    carried_reader_debt: "생환 규칙의 마지막 빈칸"
    contrast_requirement: "막판 편의적 예외로 누적 규칙을 무효화하지 않는다."
  - b_id: B044
    route_order: 4400
    status: hypothesis
    target_anchor: A07
    narrative_function: "식당이 도윤 없이도 손님을 배웅하는 최종 운영 증거를 만든다."
    payoff_axis: "인계 가능성"
    carried_reader_debt: "떠날 자격"
    contrast_requirement: "주인공 부재가 결핍만이 아니라 축적의 증거가 된다."
  - b_id: B045
    route_order: 4500
    status: hypothesis
    target_anchor: A07
    narrative_function: "후계·계약·관계 비용을 닫고 마지막 배웅으로 진입한다."
    payoff_axis: "귀환 선택·인계"
    carried_reader_debt: "마지막 손님과 초기 이미지"
    contrast_requirement: "장기 준비를 마지막 개인적 질문으로 압축한다."
  - b_id: B046
    route_order: 4600
    status: hypothesis
    target_anchor: A08
    narrative_function: "마지막 귀환 일수와 식당의 남은 의무를 같은 시계 위에 올린다."
    payoff_axis: "시간·책임"
    carried_reader_debt: "떠나는 날의 정확한 조건"
    contrast_requirement: "완결 카운트다운이 일상 운영을 지우지 않는다."
  - b_id: B047
    route_order: 4700
    status: hypothesis
    target_anchor: A08
    narrative_function: "마지막 손님 또는 집단이 도윤 자신의 후회를 비추게 한다."
    payoff_axis: "자기 결산"
    carried_reader_debt: "도윤이 붙든 마지막 미련"
    contrast_requirement: "새 설정보다 초반부터 쌓인 선택을 거울로 쓴다."
  - b_id: B048
    route_order: 4800
    status: hypothesis
    target_anchor: A08
    narrative_function: "빈 그릇·양파 수프·십 년산 소스 같은 초기 이미지를 새 의미로 회수한다."
    payoff_axis: "장기 상환"
    carried_reader_debt: "초반 감각 이미지"
    contrast_requirement: "회상 목록이 아니라 현재 선택의 물건으로 돌아온다."
  - b_id: B049
    route_order: 4900
    status: hypothesis
    target_anchor: A08
    narrative_function: "1,095일을 완성하되 식당을 버려야만 얻는 승리가 아니게 한다."
    payoff_axis: "생환·지속"
    carried_reader_debt: "귀환과 식당의 양립"
    contrast_requirement: "하나를 지우는 선택 대신 축적한 구조의 값을 지급한다."
  - b_id: B050
    route_order: 5000
    status: hypothesis
    target_anchor: A08
    narrative_function: "식당 인계와 공주·하진의 이별을 각자의 행동으로 닫는다."
    payoff_axis: "관계 결산·인계"
    carried_reader_debt: "남는 사람들의 다음 삶"
    contrast_requirement: "주인공 퇴장 뒤에도 타인의 미래가 움직인다."
  - b_id: B051
    route_order: 5100
    status: hypothesis
    target_anchor: A08
    narrative_function: "18:31 재가동과 소율과의 재회로 생환과 배웅의 두 엔진을 완결한다."
    payoff_axis: "생환·부녀 재회·식당 지속"
    carried_reader_debt: "프렌치토스트와 첫 계약의 최종 의미"
    contrast_requirement: "에필로그 설명보다 현재형 행동과 감각 이미지로 닫는다."
last_reflowed_at: 2026-07-25
```

## Reflow 규칙

- `B001`의 승인 원고와 closeout은 바꾸지 않는다.
- 현재 `B002`가 닫히면 `B003`을 자동 승격하지 않는다. 실제 현금·재고·신뢰·귀환 일수에서 `keep | revise | retire`를 판정한다.
- `B004~B051`의 다섯 내구 필드는 장기 미래를 잃지 않기 위한 가설이다. closeout마다 각 슬롯의 존재와 순서를 다시 보고, 필요하면 새 B를 삽입하거나 기존 B를 `retired` 처리한다.
- 먼 B에 손님 이름·음식·장면·정확한 화수를 덧붙이지 않는다. 그 구체값은 가까운 두 B와 Episode Bet에서만 만든다.
- A-Rail의 A01~A08이 바뀌면 영향받는 모든 B의 `target_anchor`와 지급 부채를 다시 매핑한다.
