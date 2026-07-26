# Modern Finance Story Blocks — starter Source Map

상태: evidence-backed starter map. 자세한 화별 좌표는 연결된 evidence에서 확인한다.

## 독식하는 재벌 3세 — 가문 압력과 시장 환전의 교차

```yaml
source_map_id: seooh_doksik.SM01
source_id: seooh_doksik
as_of_scope: ep001_091_spots
source_coords: [ep01_05, ep08_21, ep22_50, ep78_86]
evidence_ids:
  - ../_synthesis/seooh/doksik_ep01-05.md
  - ../block/evidence/seooh/doksik_ep08-14.md
  - ../block/evidence/seooh/doksik_ep15-21.md
  - ../_synthesis/seooh/doksik_ep78-86_imf_payoff.md
confidence: high
```

`가문 안의 저평가/배제 -> 회귀 우위로 먼저 사람·자산 진입점 확보 -> 시장 사건을 선점 -> 숫자·문서·타인의 식은땀으로 증명 -> 자본이 가문 권력으로 환전 -> 더 큰 거시 위기와 후계 압력`.

```yaml
block_id: seooh_doksik.B01
slot: long_route
source_coords: [ep01_05, ep08_21, ep22_50, ep78_86]
evidence_ids:
  - ../_synthesis/seooh/doksik_ep01-05.md
  - ../block/evidence/seooh/doksik_ep08-14.md
  - ../block/evidence/seooh/doksik_ep15-21.md
  - ../_synthesis/seooh/doksik_ep78-86_imf_payoff.md
entry_contract:
  protagonist_state: 가문 안에서 저평가됐지만 미래 순서와 첫 진입점을 안다
  required_assets: [첫 베팅을 실행할 최소 자본 또는 위임]
  required_authority: []
  required_information: [곧 열릴 시장 사건]
sequence:
  - pressure_or_want: 가문 압력 속에서 자기 몫과 실행권을 확보해야 한다
  - protagonist_move: 사람과 자산의 진입점을 먼저 잡고 시장 사건에 선진입한다
  - proof_or_payoff: 숫자·문서·상대 반응으로 승리를 증명한다
exit_contract:
  capital_delta: 다음 규모 베팅이 가능한 자본
  authority_delta: 가문 또는 조직에서 무시할 수 없는 발언권
  relationship_delta: 가족·부하·거물의 태도 변화
  information_delta: 미래지식이 실행력으로 검증됨
  arena_delta: 개인 거래에서 그룹 또는 거시 위기로 확장
  debt_or_next_pressure: 더 큰 후계 경쟁과 시장 사건
carrier_surfaces: [계좌 숫자, 계약 문서, 가문 자리, 상대의 식은땀]
variation_axes:
  compressible_to_episodes: 3_to_12
  scalable_values: [첫 시드, 시장 규모, 가문 내 권한]
invariants: [시장 승리가 가문 권력과 인간 반응으로 환전된다]
confidence: high
```

재사용 함수: 시장 승리가 계좌에서 끝나지 않고 가족/그룹의 권위 변화로 내려앉아야 한다.

## 금수저 투자백서 — 거시 타이밍을 실행 자본으로 바꾸는 사다리

```yaml
source_map_id: kdh_geumsujeo_tuja.SM01
source_id: kdh_geumsujeo_tuja
as_of_scope: ep001_015_plus_spots
source_coords: [ep01_15, ep38_42, ep78_85]
evidence_ids:
  - ../pitch/extracted/geumsujeo_tuja.md
  - ../_synthesis/kdh/geumsujeo_tuja.md
  - ../esm/evidence/kdh/geumsujeo_tuja.md
  - ../block/evidence/kdh/geumsujeo_tuja.md
confidence: high
```

`새 몸/제약 -> 미래지식은 있으나 실행창구 부족 -> 즉시 쓸 시드와 사람 확보 -> 거시 사건 선진입 -> 체결·수익으로 신뢰 획득 -> 더 큰 자금/데스크가 열림 -> 다음 규모의 베팅`.

```yaml
block_id: kdh_geumsujeo_tuja.B01
slot: long_route
source_coords: [ep01_15, ep38_42, ep78_85]
evidence_ids:
  - ../pitch/extracted/geumsujeo_tuja.md
  - ../_synthesis/kdh/geumsujeo_tuja.md
  - ../esm/evidence/kdh/geumsujeo_tuja.md
  - ../block/evidence/kdh/geumsujeo_tuja.md
entry_contract:
  protagonist_state: 미래 순서는 알지만 직접 집행할 창구가 부족하다
  required_assets: [작게라도 즉시 움직일 시드]
  required_authority: []
  required_information: [가까운 거시 사건의 시점]
sequence:
  - pressure_or_want: 지식이 썩기 전에 합법적 실행창구를 열어야 한다
  - protagonist_move: 시드와 사람을 묶어 거시 사건에 먼저 들어간다
  - proof_or_payoff: 실제 체결과 수익으로 신뢰를 산다
exit_contract:
  capital_delta: 더 큰 포지션을 열 수 있는 자본
  authority_delta: 자금·데스크·법인에 접근할 실행권
  relationship_delta: 다음 자금을 맡길 사람의 신뢰
  information_delta: 미래지식의 정확도와 한계가 외부에 부분 증명됨
  arena_delta: 개인 베팅에서 기관형 집행으로 확장
  debt_or_next_pressure: 커진 창구로 더 큰 사건을 선점해야 함
carrier_surfaces: [체결표, 수익 숫자, 위임장, 열린 데스크]
variation_axes:
  compressible_to_episodes: 2_to_8
  scalable_values: [시드, 위임 한도, 사건 규모]
invariants: [지식보다 실행창구가 먼저 커진다]
confidence: high
```

재사용 함수: 미래지식 자체보다 그것을 집행할 합법 껍데기·창구·신뢰가 매 앵커마다 커진다.

## 주식의 신 — 군중과 반대로 서서 생활 복구를 증명

```yaml
source_map_id: yujaemu_jusik_sin.SM01
source_id: yujaemu_jusik_sin
as_of_scope: ep001_014_plus_24_50_surface
source_coords: [ep01_14, ep24_50]
evidence_ids:
  - ../pitch/extracted/jusik_sin.md
  - ../pitch/pitch_bank.md
confidence: medium
```

`가족이 작전주에 털린 바닥 -> 미래 가격 정보 발견 -> 군중/전문가와 반대 포지션 -> 실제 매매 숫자로 증명 -> 부모 집 복구라는 인간 보상 -> 자기 시드·매매방·방송 권위 -> 판 전체와 충돌`.

```yaml
block_id: yujaemu_jusik_sin.B01
slot: payoff
source_coords: [ep01_14, ep24_50]
evidence_ids:
  - ../pitch/extracted/jusik_sin.md
  - ../pitch/pitch_bank.md
entry_contract:
  protagonist_state: 가족의 생활 손실과 시장에 대한 분노를 안고 있다
  required_assets: [반대 포지션을 잡을 최소 시드]
  required_authority: []
  required_information: [군중과 다른 가격 정보]
sequence:
  - pressure_or_want: 가족의 구체적 손실을 되돌려야 한다
  - protagonist_move: 전문가와 군중의 반대편에 실제 돈을 건다
  - proof_or_payoff: 수익을 생활 부채 상환과 가족 복구로 바꾼다
exit_contract:
  capital_delta: 독립 시드 확보
  authority_delta: 매매 실력에 대한 사회적 발언권
  relationship_delta: 가족의 불신이 안도와 의존으로 전환
  information_delta: 가격 우위가 실제 돈으로 검증됨
  arena_delta: 가정 복구에서 시장판 충돌로 확장
  debt_or_next_pressure: 커진 노출과 다음 공개 검증
carrier_surfaces: [상환 영수증, 집 열쇠, 부모 표정, 매매 숫자]
variation_axes:
  compressible_to_episodes: 1_to_4
  scalable_values: [생활 부채, 수익, 공개 범위]
invariants: [첫 돈이 독자가 아는 생활 문제를 실제로 해결한다]
confidence: medium
```

재사용 함수: 첫 돈의 의미를 추상 자산 증가가 아니라 독자가 이미 아는 생활 부채의 상환으로 고정한다.

## 검은 머리 미국 대재벌 — 미래 순서를 거점과 역사 권력으로 누적

```yaml
source_map_id: blackbear_geomeunmeori_us.SM01
source_id: blackbear_geomeunmeori_us
as_of_scope: ep001_014
source_coords: [ep01_14]
evidence_ids:
  - ../pitch/extracted/geomeunmeori_us.md
  - ../pitch/pitch_bank.md
confidence: medium
```

`시대/국가 변위 -> 생존과 종잣돈 거점 확보 -> 미래 흥망 순서에 선진입 -> 자산을 사업·인맥·정치 영향으로 환전 -> 개인 성공이 집단/조국 부채와 결합 -> 더 큰 역사 사건으로 arena 확장`.

```yaml
block_id: blackbear_geomeunmeori_us.B01
slot: long_route
source_coords: [ep01_14]
evidence_ids:
  - ../pitch/extracted/geomeunmeori_us.md
  - ../pitch/pitch_bank.md
entry_contract:
  protagonist_state: 낯선 시대 또는 국가에서 미래 흥망 순서를 안다
  required_assets: [생존 거점, 작은 종잣돈]
  required_authority: []
  required_information: [산업과 역사 사건의 순서]
sequence:
  - pressure_or_want: 개인 생존을 넘어 지속 가능한 거점을 만들어야 한다
  - protagonist_move: 다음 승자의 자산·사업·인맥에 순서대로 선진입한다
  - proof_or_payoff: 자산을 사람과 제도에 남는 영향력으로 환전한다
exit_contract:
  capital_delta: 다음 산업으로 건너갈 자본
  authority_delta: 사업·정치 의사결정에 닿는 영향력
  relationship_delta: 핵심 인물의 충성과 집단의 기대
  information_delta: 역사 순서가 확장 전략으로 검증됨
  arena_delta: 개인 생존에서 국가·역사 무대로 확장
  debt_or_next_pressure: 개인 성공과 집단 부채의 충돌
carrier_surfaces: [거점 건물, 지분 문서, 악수, 신문 1면]
variation_axes:
  compressible_to_episodes: 5_to_30
  scalable_values: [종잣돈, 산업, 정치 접근 거리]
invariants: [자산 획득마다 새 무대와 사람의 충성이 붙는다]
confidence: medium
```

재사용 함수: 자산 앵커마다 새로운 무대 접근권과 사람의 충성이 붙어 장기 스케일을 만든다.

## 현대 금융물 합성 클러스터

카나리아 계열의 기본 앵커는 아래를 한 덩어리로 쓴다.

```text
진입 포지션
-> 외부 거시 trigger + 내부 관계 pressure
-> 현금/문서/지위의 비가역 conversion
-> 1~3화 인간 aftershock
-> 생활·가문·관계 reader debt 상환
-> 더 큰 자금/arena/적의 next pressure
```

단순 `가격 상승 -> 수익 -> 다음 종목`은 체인이 아니라 절반짜리 숫자 로그다.
