# Modern Talent Story Blocks — 사람·기술 선점

상태: 원문 초반 직독과 기존 추론 기획서·ESM을 교차한 starter Source Map. 사람의 진짜 값 판별과 버려진 기술의 즉시 환전에 쓴다.

## 재벌가 장남은 가치를 본다 — 가면을 가르고 진짜 사람을 줍는 생애주기

```yaml
source_map_id: yujaemu_chaebol_value.SM01
source_id: yujaemu_chaebol_value
as_of_scope: ep001_015_direct_read
source_truth: ../../../ff_sources/합본들/재벌가 장남은 가치를 본다_유재무_합본.txt
source_coords: [ep01_15]
evidence_ids:
  - ../pitch/extracted/chaebol_jangnam_value.md
confidence: high
```

`사람 보는 눈이 없어 당한 영업맨 -> 재벌 장남의 몸과 가치 판별 능력 -> 가짜 물건·가면 쓴 가족을 먼저 간파 -> 회장의 시험 통과 -> 부실 계열사에서 진짜 임원과 자산을 선점 -> 실적이 후계 발언권으로 환전`.

```yaml
block_id: yujaemu_chaebol_value.B01
slot: base_lifecycle
source_coords: [ep01_15]
evidence_ids:
  - ../pitch/extracted/chaebol_jangnam_value.md
entry_contract:
  protagonist_state: 사람을 잘못 믿어 자기 몫을 잃은 실무자가 재벌가의 약한 후계자 자리에서 다시 시작한다
  required_assets: [새 신분 또는 회귀 뒤의 최소 가족 지위]
  required_authority: []
  required_information: [자신이 다시 속으면 제거된다는 가문 압력]
sequence:
  - pressure_or_want: 가면 쓴 가족과 무능한 임원 사이에서 먼저 살아남고 자기 자리를 증명해야 한다
  - protagonist_move: 남들이 높게 치는 가짜를 버리고 저평가된 진짜 사람·물건·자산을 먼저 고른다
  - proof_or_payoff: 첫 판별을 회장 앞의 공개 결과와 계열사 실적으로 바꾼다
exit_contract:
  capital_delta: 다음 사람과 자산을 묶을 수 있는 첫 현금 또는 예산
  authority_delta: 부실 조직 하나를 직접 운영할 권한
  relationship_delta: 회장의 관심과 저평가 인재의 첫 신뢰
  information_delta: 판별 능력의 범위와 해석 책임이 검증됨
  arena_delta: 가족의 시험에서 실제 계열사 운영으로 확장
  debt_or_next_pressure: 계모·숙부·사촌이 후계 경쟁자로 재평가하고 견제
carrier_surfaces: [가짜 그림, 해고 명단, 임원 명패, 계약서, 구내식당 밥상]
variation_axes:
  compressible_to_episodes: 3_to_10
  scalable_values: [첫 판별 대상, 운영 조직 규모, 첫 예산]
invariants:
  - 주인공만 진짜 값을 먼저 보되 성공 방법은 직접 설계한다
  - 첫 판별은 돈뿐 아니라 사람의 호칭과 주인공의 운영권을 바꾼다
confidence: high
```

재사용 함수: 사람을 숫자 목록으로 수집하지 않는다. 바닥의 생활 문제를 먼저 해결하고, 그 사람이 만든 실제 결과를 주인공의 자본·조직·다음 무대로 환전한다.

## 연봉 1조 신입사원 — 버려진 사람·기술을 즉시 계약으로 바꾸기

```yaml
source_map_id: seooh_yeonbong.SM01
source_id: seooh_yeonbong
as_of_scope: ep001_050_direct_mining
source_truth: ../../../ff_sources/합본들/연봉 1조 신입사원_서오_합본.txt
source_coords: [ep01_05, ep06_14, ep15_21, ep22_50]
evidence_ids:
  - ../pitch/extracted/yeonbong.md
  - ../_synthesis/seooh/yeonbong_ep01-05.md
  - ../_synthesis/seooh/yeonbong_ep06-14.md
  - ../_synthesis/seooh/yeonbong_ep15-21.md
  - ../_synthesis/seooh/yeonbong_ep22-50.md
confidence: high
```

`전원이 떠난 빈 조직 -> 버려진 자료와 저평가 실무자에서 작동하는 조합 발견 -> 짧은 몰입과 시제품/특허 -> 대기업 계약과 개인 보상 -> 그 돈으로 다음 저점 자산·인재 진입 -> 국내 회의실에서 세계 거물 무대로 확장`.

```yaml
block_id: seooh_yeonbong.B01
slot: payoff_and_long_route
source_coords: [ep01_50]
evidence_ids:
  - ../pitch/extracted/yeonbong.md
  - ../_synthesis/seooh/yeonbong_ep01-05.md
  - ../_synthesis/seooh/yeonbong_ep15-21.md
  - ../_synthesis/seooh/yeonbong_ep22-50.md
entry_contract:
  protagonist_state: 남들이 버린 사람·기술·조직에서 아직 현금화되지 않은 작동 가능성을 발견한다
  required_assets: [짧은 검증 기간, 최소 작업 공간]
  required_authority: [시험 생산 또는 계약 협상 창구]
  required_information: [무엇이 저평가되었는지 보여 주는 감각 또는 미래지식]
sequence:
  - pressure_or_want: 폐기 결정이 실행되기 전에 진짜 가치가 있음을 결과로 보여야 한다
  - protagonist_move: 사람과 흩어진 재료를 한 팀으로 묶어 시제품·특허·실적 하나를 완성한다
  - proof_or_payoff: 계약금·성과급·라이선스·외부 거물의 방문으로 즉시 환전한다
exit_contract:
  capital_delta: 다음 인재 또는 기술을 선점할 현금
  authority_delta: 팀 유지권과 후속 계약권
  relationship_delta: 해고 대상이던 실무자가 장기 운영자로 전환
  information_delta: 주인공의 판별이 조직 밖 시장에서도 통한다는 증명
  arena_delta: 버려진 팀에서 대기업·해외 거물 거래로 확장
  debt_or_next_pressure: 가치를 뒤늦게 본 원소유자와 경쟁자가 회수·강탈을 시도
carrier_surfaces: [해고 봉투, 빈 사무실 열쇠, 시제품, 특허증, 송금 확인서, 새 명패]
variation_axes:
  compressible_to_episodes: 2_to_12
  scalable_values: [팀 인원, 계약금, 거래 상대의 급]
invariants:
  - 발견한 가치는 같은 아크 안에서 손에 잡히는 계약이나 실적으로 환전된다
  - 사람의 생활과 호칭 변화가 숫자 보상과 함께 보인다
confidence: high
```

재사용 함수: ‘천재를 알아봤다’에서 끝내지 않고, 해고 봉투가 새 명패로 바뀌는 장면과 첫 계약금을 같은 아크 안에 지급한다.
