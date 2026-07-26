# Arc Route Rail — 천마식당

slots:
  - b_id: B001
    route_order: 1
    status: closed
    target_anchor: A01
    narrative_function: "미각 회복과 30일 계약을 첫 손님·첫 대량 영업·팀 결속으로 증명한다."
    payoff_axis: "첫 결제, 33그릇 판매, 매출 527000원, 직원 잔류"
    carried_reader_debt: "30일 누적 손익 흑자와 영구 독립 운영권"
    contrast_requirement: "한 그릇 천재에서 대량 생산 운영자로 상승"
    start_episode: ep001
    end_episode: ep003
  - b_id: B002
    route_order: 2
    status: active
    target_anchor: A02
    narrative_function: "바이럴 수요를 새벽시장 조달과 품질 기준으로 받아내고 본사 공급망 견제를 가시화한다."
    payoff_axis: "다음 영업분 재료와 첫 독립 조달 기준"
    carried_reader_debt: "본사 납품 부족, 강인호의 검은 웍 인식, 부상"
    contrast_requirement: "손님 진단보다 조달·수량·시간 선택을 전면화"
    start_episode: ep004
    end_episode: ep008
  - b_id: B003
    route_order: 3
    status: provisional
    target_anchor: A03
    narrative_function: "직원에게 공정 판단과 권한을 넘겨 태윤 없이도 같은 품질을 낸다."
    payoff_axis: "생산 상한 확대와 직원별 책임"
    carried_reader_debt: "태윤의 부상과 하루 176명 목표"
    contrast_requirement: "개인 치트보다 교육 실패와 재작업 비용"
    start_episode: ""
    end_episode: ""
  - b_id: B004
    route_order: 4
    status: provisional
    target_anchor: A04
    narrative_function: "본사 브랜드 규정과 독립 메뉴의 수익·품질을 공개 비교한다."
    payoff_axis: "메뉴 자율성과 고객 신뢰"
    carried_reader_debt: "강태석의 공급·브랜드 견제"
    contrast_requirement: "가족 말싸움이 아니라 실적과 계약으로 판정"
    start_episode: ""
    end_episode: ""
  - b_id: B005
    route_order: 5
    status: provisional
    target_anchor: A05
    narrative_function: "검은 웍의 과거와 강인호의 요리 경력을 부자 갈등의 새 정보로 연다."
    payoff_axis: "가족 진실과 계승 선택"
    carried_reader_debt: "누가 태윤에게 불을 가르쳤는가"
    contrast_requirement: "전생 설명보다 현재 행동과 물증 우선"
    start_episode: ""
    end_episode: ""

## Route rule

각 B-Arc의 성과는 다음 아크의 비용이 된다. 바이럴은 조달 압력, 조달 독립은 본사 견제, 직원 성장은 표준과 보상 문제, 아버지의 관심은 계승 경쟁을 만든다.
