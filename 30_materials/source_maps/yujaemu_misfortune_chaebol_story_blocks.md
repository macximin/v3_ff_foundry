# 불행을 보는 재벌집 손자 — early lifecycle Story Blocks

```yaml
source_map_id: yujaemu_misfortune_chaebol.SM01
source_id: yujaemu_misfortune_chaebol
as_of_scope: ep001_050_direct_read_plus_later_sector_spots
source_truth: ../../../ff_sources/합본들/불행을 보는 재벌집 손자_유재무_합본.txt
source_coords: [ep01_17, ep19_35, ep43_50, later_sector_spots]
confidence: high_for_early_chain_medium_for_long_route
alternative: none_for_early_lifecycle
```

## block `yujaemu_misfortune_chaebol.B01`

```yaml
block_id: yujaemu_misfortune_chaebol.B01
slot: background
source_coords: [ep01_02]
evidence_ids:
  - ../../../ff_sources/합본들/불행을 보는 재벌집 손자_유재무_합본.txt#ep001-002
entry_contract:
  protagonist_state: 재벌가의 약한 가지에서 태어나 모든 것을 빼앗기고 비참하게 죽었다
  required_assets: [회귀 전 실패 기억]
  required_authority: []
  required_information: [아버지가 계열사를 빼앗기고 죽는 미래, 가문에서 버려지는 순서]
sequence:
  - pressure_or_want: 같은 몰락과 아버지의 죽음을 다시 겪지 않으려 한다
  - protagonist_move: 어린 몸으로 돌아오자 가족에게 사랑받기보다 자기 몫과 실행권부터 확보하기로 한다
  - proof_or_payoff: 가문의 철문과 가족 모임을 미래의 추방 장면과 겹쳐 본다
exit_contract:
  capital_delta: 없음
  authority_delta: 재벌 3세라는 명목상 신분만 복구
  relationship_delta: 아버지만 같은 편으로 잠금
  information_delta: 가문 몰락과 후계 경쟁의 미래 순서를 기억
  arena_delta: 거리의 패배자에서 재벌가 내부 경쟁자로 복귀
  debt_or_next_pressure: 아버지의 약한 지위와 친족의 공개 모욕
carrier_surfaces: [열리는 본가 철문, 고개 숙인 아버지, 가족 식탁의 빈자리]
variation_axes:
  reorderable_with: [yujaemu_misfortune_chaebol.B02]
  compressible_to_episodes: 1
  renameable_surfaces: [그룹명, 가족명, 본가 위치]
  scalable_values: [회귀 나이]
invariants: [주인공의 결핍은 가난 자체보다 아버지와 자기 몫을 모두 빼앗긴 기억이다]
confidence: high
```

## block `yujaemu_misfortune_chaebol.B02`

```yaml
block_id: yujaemu_misfortune_chaebol.B02
slot: asymmetry
source_coords: [ep01, ep04_06]
evidence_ids:
  - ../../../ff_sources/합본들/불행을 보는 재벌집 손자_유재무_합본.txt#ep001
  - ../../../ff_sources/합본들/불행을 보는 재벌집 손자_유재무_합본.txt#ep004-006
entry_contract:
  protagonist_state: 회귀 뒤 사람과 물건 주변의 검은 기운을 보기 시작했다
  required_assets: []
  required_authority: []
  required_information: [검은 기운은 다가올 불행과 관련 있다는 제한적 경험]
sequence:
  - pressure_or_want: 검은 기운이 무엇을 뜻하는지 원인과 결과를 스스로 맞춰야 한다
  - protagonist_move: 짙기·대상·주변 사실과 미래 기억을 함께 놓고 불행의 방향을 추론한다
  - proof_or_payoff: 개입이 맞으면 기운이 사라지지만 원인과 해결책은 자동으로 주어지지 않는다
exit_contract:
  capital_delta: 없음
  authority_delta: 남들이 볼 수 없는 위험 선별 능력
  relationship_delta: 구한 사람에게 강한 빚을 만들 수 있음
  information_delta: 실패 후보는 보이지만 성공 정답은 직접 찾아야 함
  arena_delta: 사람의 사고에서 토지·문서·회사 위험으로 확장 가능
  debt_or_next_pressure: 잘못 해석하면 주인공 책임으로 손실이 확정됨
carrier_surfaces: [사람의 어깨에 붙은 검은 안개, 서류 가장자리의 먹빛, 검게 잠긴 땅]
variation_axes:
  reorderable_with: [yujaemu_misfortune_chaebol.B01]
  compressible_to_episodes: 1
  renameable_surfaces: [기운을 묘사하는 감각]
  scalable_values: [불행까지 남은 시간, 피해 규모]
invariants: [원인과 해답은 보이지 않는다, 미래지식과 현장 판단이 필요하다]
confidence: high
```

## block `yujaemu_misfortune_chaebol.B03`

```yaml
block_id: yujaemu_misfortune_chaebol.B03
slot: first_use
source_coords: [ep06_10]
evidence_ids:
  - ../../../ff_sources/합본들/불행을 보는 재벌집 손자_유재무_합본.txt#ep006-010
entry_contract:
  protagonist_state: 아버지가 처음 맡은 대형 개발사업에서 실패하면 마지막 직함까지 잃는다
  required_assets: [현장 지도, 아버지라는 합법적 전달자]
  required_authority: [아버지가 회의에서 의견을 낼 상무 직함]
  required_information: [검은 기운이 깔린 토지는 개발에서 배제될 가능성이 높음]
sequence:
  - pressure_or_want: 친족이 고른 토지 매입을 막고 아버지의 첫 실적을 만들어야 한다
  - protagonist_move: 검은 후보를 제거하고 지형·정책 논리로 남은 구역을 좁혀 아버지에게 전달한다
  - proof_or_payoff: 정부 발표에서 기존 후보는 그린벨트가 되고 주인공이 고른 구역이 개발지로 확정된다
exit_contract:
  capital_delta: 그룹의 토지 매입 손실 회피와 개발 차익 확보
  authority_delta: 아버지가 사업 마무리 권한을 얻음
  relationship_delta: 아버지가 아들의 판단을 믿기 시작함
  information_delta: 검은 기운이 기업 의사결정에도 작동함을 증명
  arena_delta: 가족 내부에서 그룹 개발사업으로 진입
  debt_or_next_pressure: 친족의 직함과 체면을 빼앗아 후계 경쟁이 시작됨
carrier_surfaces: [100억 매입안, 보닛 위 지도, 그린벨트 발표, 회의실 환호, 평사원 인사명령]
variation_axes:
  reorderable_with: []
  compressible_to_episodes: 1_to_2
  renameable_surfaces: [개발지, 건설사, 경쟁사, 해외사업]
  scalable_values: [토지 매입액, 개발사업 규모]
invariants: [위험 회피만 하지 않고 대체 구역을 찾아 아버지의 실적으로 환전한다]
confidence: high
```

## block `yujaemu_misfortune_chaebol.B04`

```yaml
block_id: yujaemu_misfortune_chaebol.B04
slot: first_payoff
source_coords: [ep11_13]
evidence_ids:
  - ../../../ff_sources/합본들/불행을 보는 재벌집 손자_유재무_합본.txt#ep011-013
entry_contract:
  protagonist_state: 개발사업 적중으로 처음 회장의 시야에 들어왔다
  required_assets: [공개된 정치 사실, 검은 기운이 밴 인수 검토서]
  required_authority: [회장과 직접 말할 한 번의 자리]
  required_information: [정권이 인수 대상 그룹을 미워한다는 공개 정보]
sequence:
  - pressure_or_want: 회장이 돈 되는 인수안만 보고 정치적 보복 위험을 무시한다
  - protagonist_move: 능력을 밝히지 않고 정권의 자존심과 보복 가능성이라는 공개 논리로 인수를 막는다
  - proof_or_payoff: 대상 그룹이 실제 해체되고, 주인공 그룹은 거래를 피한 대가로 새 공사를 얻는다
exit_contract:
  capital_delta: 대형 손실 회피와 신규 공사 수주
  authority_delta: 회장과 직접 거래할 손자 지위
  relationship_delta: 아버지와 주인공이 매주 본가 식탁에 초대됨
  information_delta: 위험 감지가 정치·M&A 판단으로 확장됨
  arena_delta: 계열사 사업에서 그룹 회장 의사결정으로 확장
  debt_or_next_pressure: 회장이 주인공을 시험하고 보상 규모를 재기 시작함
carrier_surfaces: [인수 검토서, 멈춘 도장, 신문 1면, 주말 식탁의 새 자리]
variation_axes:
  reorderable_with: [yujaemu_misfortune_chaebol.B05]
  compressible_to_episodes: 1
  renameable_surfaces: [인수 대상, 정권 호칭, 수주 사업]
  scalable_values: [인수 금액, 수주 규모]
invariants: [능력의 해답이 아니라 공개 사실과 사업 논리로 회장을 설득한다]
confidence: high
```

## block `yujaemu_misfortune_chaebol.B05`

```yaml
block_id: yujaemu_misfortune_chaebol.B05
slot: first_arena
source_coords: [ep13_15]
evidence_ids:
  - ../../../ff_sources/합본들/불행을 보는 재벌집 손자_유재무_합본.txt#ep013-015
entry_contract:
  protagonist_state: 회장의 판단을 두 번 맞혀 첫 보상을 받을 자격을 얻었다
  required_assets: [회장이 준 100만 원 통장, 아버지의 추가 자금]
  required_authority: [가족 명의 계좌, 그룹 증권사 연결]
  required_information: [개발 수혜로 그룹 건설주가 오를 이유]
sequence:
  - pressure_or_want: 칭찬을 소비하지 않고 자기 지분의 첫 줄로 바꿔야 한다
  - protagonist_move: 회장 돈과 아버지 돈을 묶어 그룹 건설주를 매입한다
  - proof_or_payoff: 증권사 객장과 임원이 주인공의 첫 실행창구로 열린다
exit_contract:
  capital_delta: 그룹 건설주 1만 주 상당의 첫 개인 자산
  authority_delta: 그룹 증권사 임원과 직접 거래하는 고객 지위
  relationship_delta: 아버지가 자기 돈을 아들의 판단에 태움
  information_delta: 미래지식과 검은 기운을 시장에서 시험할 수 있음
  arena_delta: 그룹 내부 판단에서 증권시장으로 확장
  debt_or_next_pressure: 첫 종목과 첫 시장 사기를 공개적으로 판별해야 함
carrier_surfaces: [100만 원 통장, 4,900만 원 추가금, 1만 주 증권증서, 객장 전광판]
variation_axes:
  reorderable_with: [yujaemu_misfortune_chaebol.B04]
  compressible_to_episodes: 1
  renameable_surfaces: [증권사, 건설주]
  scalable_values: [통장 잔액, 추가금, 주식 수]
invariants: [보상이 용돈으로 끝나지 않고 그룹 지분과 시장 창구로 바뀐다]
confidence: high
```

## block `yujaemu_misfortune_chaebol.B06`

```yaml
block_id: yujaemu_misfortune_chaebol.B06
slot: payoff
source_coords: [ep15_17]
evidence_ids:
  - ../../../ff_sources/합본들/불행을 보는 재벌집 손자_유재무_합본.txt#ep015-017
entry_contract:
  protagonist_state: 첫 주식을 사기 위해 그룹 증권사 객장에 들어왔다
  required_assets: [첫 계좌, 증권사 임원과의 대화 기회]
  required_authority: []
  required_information: [검은 기운이 짙은 상장사 홍보 현장]
sequence:
  - pressure_or_want: 즉시 환급을 미끼로 고객이 사기성 종목에 몰린다
  - protagonist_move: 매수를 거부하고 증권사 고객에게도 권하지 말라고 임원에게 경고한다
  - proof_or_payoff: 회사가 부도나고 주인공 증권사만 고객 손실과 평판 추락을 피한다
exit_contract:
  capital_delta: 직접 수익보다 증권사 고객 기반과 평판 자산 확보
  authority_delta: 증권사 임원이 다음 판단을 묻는 비공식 자문 지위
  relationship_delta: 유능하고 이해타산 빠른 증권사 임원을 자기 사람으로 묶을 기회
  information_delta: 시장 사기와 군중 위험에도 능력이 작동함을 증명
  arena_delta: 개인 계좌에서 증권사 운영으로 확장
  debt_or_next_pressure: 증권사를 실제 돈 버는 창구로 성장시켜야 함
carrier_surfaces: [20퍼센트 환급 전단, 매수 거부, 부도 뉴스, 피해 없는 고객 장부]
variation_axes:
  reorderable_with: []
  compressible_to_episodes: 1_to_2
  renameable_surfaces: [상장사, 증권사, 환급률]
  scalable_values: [피해액, 고객 수]
invariants: [주인공은 자기 돈뿐 아니라 창구의 고객 피해까지 막아 사람과 권위를 얻는다]
confidence: high
```

## block `yujaemu_misfortune_chaebol.B07`

```yaml
block_id: yujaemu_misfortune_chaebol.B07
slot: human_texture
source_coords: [ep03_05]
evidence_ids:
  - ../../../ff_sources/합본들/불행을 보는 재벌집 손자_유재무_합본.txt#ep003-005
entry_contract:
  protagonist_state: 학교에서는 싸움꾼 재벌 3세로 알려졌고 공부 실력이 부족하다
  required_assets: [가문 병원에 연락할 수 있는 신분]
  required_authority: []
  required_information: [가난한 전교 1등 친구와 그 가족에게 닥칠 검은 기운]
sequence:
  - pressure_or_want: 서울대와 미래 사업을 위해 공부를 도울 사람이 필요하다
  - protagonist_move: 친구 어머니의 위기를 해결해 생명을 살리고 치료비·병실을 연결한다
  - proof_or_payoff: 친구는 공부를 돕고 훗날 무엇이든 함께할 첫 동료가 된다
exit_contract:
  capital_delta: 없음
  authority_delta: 학교와 또래 안에서 달라진 평판
  relationship_delta: 생명의 빚으로 묶인 첫 동료
  information_delta: 사람에게 걸린 기운도 개입으로 사라짐을 확인
  arena_delta: 혼자 움직이는 회귀자에서 작은 팀으로 확장
  debt_or_next_pressure: 동료를 단순 은혜 수혜자가 아니라 실제 운영자로 키워야 함
carrier_surfaces: [판잣집, 병원 1인실, 사라진 검은 기운, 함께 펴는 문제집]
variation_axes:
  reorderable_with: [yujaemu_misfortune_chaebol.B03, yujaemu_misfortune_chaebol.B06]
  compressible_to_episodes: 1_to_2
  renameable_surfaces: [학교, 병원, 동료 이름]
  scalable_values: [치료비, 동료 나이]
invariants: [선행이 아니라 주인공에게 필요한 사람을 먼저 구해 상호 효용으로 묶는다]
confidence: high
```

## block `yujaemu_misfortune_chaebol.B08`

```yaml
block_id: yujaemu_misfortune_chaebol.B08
slot: long_route
source_coords: [ep23_31]
evidence_ids:
  - ../../../ff_sources/합본들/불행을 보는 재벌집 손자_유재무_합본.txt#ep023-031
entry_contract:
  protagonist_state: 첫 시장 자본과 가문 내 발언권을 확보했다
  required_assets: [현금, 친족과 거래할 가문 접점]
  required_authority: [비상장 계열사 증권증서를 합법적으로 보유·교환할 수 있는 가족 지위]
  required_information: [전자 계열사의 미래 가치와 그룹 지배구조 변화]
sequence:
  - pressure_or_want: 친족들은 당장 돈 되는 건설주를 원하고 적자 전자회사를 버리려 한다
  - protagonist_move: 현금과 다른 계열사 주식을 내주고 비상장 전자 지분을 모은다
  - proof_or_payoff: 전자·반도체가 그룹 핵심으로 성장하면서 초기 증권증서가 지배권 자산으로 변한다
exit_contract:
  capital_delta: 비상장 전자 계열사 핵심 지분
  authority_delta: 미래 주력 계열사의 주주 지위
  relationship_delta: 친족과 첫 지분 거래를 맺고 훗날의 후회를 예약
  information_delta: 미래 산업 순서가 실제 지배구조 설계로 환전됨
  arena_delta: 건설·증권에서 전자·반도체로 확장
  debt_or_next_pressure: 적자 사업부와 기술 인력을 살려 기업가치를 현실화해야 함
carrier_surfaces: [봉투 속 증권증서, 액면가, 친족 간 교환표, 주주명부 한 줄]
variation_axes:
  reorderable_with: [yujaemu_misfortune_chaebol.B06, yujaemu_misfortune_chaebol.B07]
  compressible_to_episodes: 2_to_5
  renameable_surfaces: [전자 계열사, 교환 상대, 증권 수량]
  scalable_values: [액면가, 지분율, 교환 대금]
invariants: [현재 현금가치보다 미래 그룹 지배권이 될 비상장 지분을 먼저 모은다]
confidence: high
```

## block `yujaemu_misfortune_chaebol.B09`

```yaml
block_id: yujaemu_misfortune_chaebol.B09
slot: long_route
source_coords: [ep19_50, later_semiconductor_airline_hotel_card_imf_spots]
evidence_ids:
  - ../../../ff_sources/합본들/불행을 보는 재벌집 손자_유재무_합본.txt#ep019-050
  - ../../../ff_sources/합본들/불행을 보는 재벌집 손자_유재무_합본.txt#later-sector-spots
entry_contract:
  protagonist_state: 건설과 증권에서 첫 자본·사람·실행권을 만들었다
  required_assets: [첫 지분, 증권사 창구, 아버지의 사업권]
  required_authority: [회장에게 다음 사업안을 보여줄 수 있는 접근권]
  required_information: [산업별 미래 흥망 순서]
sequence:
  - pressure_or_want: 한 sector의 성공만으로는 그룹 지배권과 외환위기 생존을 확보할 수 없다
  - protagonist_move: 건설 수익을 증권과 기업금융으로, 금융을 전자·반도체 지분으로, 전자를 항공·호텔·유통·카드의 확장 자본으로 바꾼다
  - proof_or_payoff: sector마다 새 계열사·지분·운영자가 붙고 마지막 외환위기에 경쟁 그룹 자산을 인수할 체력이 생긴다
exit_contract:
  capital_delta: 외환위기에 경쟁 그룹 핵심 자산을 살 수 있는 자본
  authority_delta: 여러 계열사를 묶어 움직이는 사실상 그룹 지배권
  relationship_delta: sector별 전문 운영자와 해외 거물 라인
  information_delta: 미래 순서가 산업 포트폴리오로 구현됨
  arena_delta: 국내 개발사업에서 글로벌 산업·금융 위기로 확장
  debt_or_next_pressure: 창업주와 친족이 가진 마지막 지분을 정리해야 함
carrier_surfaces: [건설계약서, 증권계좌, 반도체 공장, 항공기, 카드 회원장부, 달러 대출표]
variation_axes:
  reorderable_with: []
  compressible_to_episodes: 150_to_250
  renameable_surfaces: [sector별 회사와 거물]
  scalable_values: [지분율, 인수금액, 외화부채]
invariants: [각 sector의 출구가 다음 sector의 자본·사람·접근권이 된다]
confidence: medium
```

## reusable function

- borrowed_function: 위험을 보는 눈이 회피에서 끝나지 않고 아버지의 실적, 회장의 인정, 첫 지분, 증권사 창구로 차례로 환전된다.
- works_when: 주인공이 검은 기운만 믿지 않고 미래 기억·공개 사실·현장 논리로 원인을 좁힌다.
- fails_when: 기운이 정답과 해결책까지 알려주거나, 주인공이 이해관계 없이 모두를 구한다.
- compatible_next_slots: [long_route, first_arena, payoff, human_texture]
- source_specific_surface: 열리는 본가 철문, 100억 토지 매입안, 글로벌그룹 인수서, 100만 원 통장, 1만 주 증권증서, 화진상사 환급 전단.
