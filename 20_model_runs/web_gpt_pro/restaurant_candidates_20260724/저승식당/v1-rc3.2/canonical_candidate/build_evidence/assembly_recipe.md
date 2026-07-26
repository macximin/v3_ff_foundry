# 저승식당 Assembly Recipe — imported candidate reverse reconstruction

```yaml
recipe_id: afterlife_restaurant_rc3_2_reverse_20260725
target_work: afterlife_restaurant
producer: codex_desktop_gpt_5_6_terra
mode: imported_candidate_reverse_reconstruction

base_source:
  source_id: internal_intake_afterlife_restaurant_v1_rc3_2
  block_ids:
    - AFR-WL-001
    - AFR-WL-002
    - AFR-WL-003
    - AFR-WL-004
    - AFR-WL-005
    - AFR-WL-006
  owns:
    - protagonist_background
    - deficiency
    - asymmetry_device
    - first_use
    - first_payoff
    - first_arena

protagonist_operating_assembly:
  base_operating_archetype: AFR-OP-WL01_operator_chef
  base_evidence:
    - ../../ep001.txt
    - ../../ep002.txt
    - ../../ep003.txt
  owns:
    - real_vocation
    - recurring_economic_verbs
    - revenue_model
    - accumulated_assets
    - final_restaurateur_identity
  supporting_archetypes:
    - archetype_id: OP-04
      role: discarded_material_to_product_craft
    - archetype_id: OP-06
      role: supply_and_operating_base_expansion

required_story_facts:
  - fact_id: F01_guest_entry
    required_by_instance: AFR-WL-003
    reader_dependency: 왜 특정 망자만 삼도식당 문을 보는가
    resolution_route: source_block
    resolved_value: 미련이 한 끼에 묶여 그 식사를 마쳐야 다음 길로 건널 수 있는 망자만 문을 본다
    evidence_or_reason: ep001 계약 설명
    authority_target: pitch
  - fact_id: F02_return_transaction
    required_by_instance: AFR-WL-003
    reader_dependency: 한 그릇이 왜 도윤의 생환과 연결되는가
    resolution_route: source_block
    resolved_value: 제대로 배웅한 망자 한 명당 하루를 적립하고 1,095일을 모으면 멈춘 18:31부터 수술실 시간이 재개되며 그 수명이 명부에 붙는다
    evidence_or_reason: ep001 계약과 ep002 첫 적립
    authority_target: living_spine
  - fact_id: F03_payment_rule
    required_by_instance: AFR-WL-004
    reader_dependency: 김문성의 6닢이 개인 노잣돈인지 일반 식대인지
    resolution_route: work_local_invention
    resolved_value: 손님이 남기는 노잣돈은 개인별 변동 대가이며 귀환 하루와 별개다
    evidence_or_reason: ep002에는 6닢만 확인되고 일반 고정 식대라는 증거는 없음
    authority_target: rolling_corridor
  - fact_id: F04_princess_name
    required_by_instance: AFR-WL-005
    reader_dependency: 장기 반복 인물로 쓸 공주의 호명 가능성
    resolution_route: work_local_invention
    resolved_value: 연화
    evidence_or_reason: 현재 1~3화에서는 본명을 의도적으로 숨김
    authority_target: pitch
  - fact_id: F05_restaurant_decline
    required_by_instance: AFR-WL-001
    reader_dependency: 세계급 셰프의 식당 예약이 왜 끊겼는가
    resolution_route: work_local_invention
    resolved_value: 아내 사망 뒤 빚을 한 번에 갚으려 해외 대회와 결승 준비에 매달리며 자기 식당의 영업과 딸의 일상을 동시에 비운 운영 과신
    evidence_or_reason: ep001의 반복 대회 출전, 예약 단절, 빚, 딸과의 약속 취소가 같은 결핍을 가리킴
    authority_target: living_spine

supporting_blocks: []

ordered_blocks:
  - instance_id: I01
    block_id: AFR-WL-001
    episode_window: ep001
    use: new
    transforms: []
    entry_bindings: []
    exit_bindings:
      - 십 년산 소스보다 딸과의 프렌치토스트를 택해 생환 욕망을 연다
  - instance_id: I02
    block_id: AFR-WL-002
    episode_window: ep001
    use: new
    transforms: []
    entry_bindings:
      - 강도윤이 죽기 싫은 이유가 딸과의 약속으로 구체화됨
    exit_bindings:
      - 죽은 자의 혀에도 닿는 요리라는 정보격차가 계약 자격이 된다
  - instance_id: I03
    block_id: AFR-WL-003
    episode_window: ep001
    use: new
    transforms: []
    entry_bindings:
      - 서하진이 도윤의 음식 가치를 직접 경험한 증인임
    exit_bindings:
      - 1,095일 계약과 첫 손님 김문성이 ep002의 선택을 연다
  - instance_id: I04
    block_id: AFR-WL-004
    episode_window: ep002
    use: new
    transforms: []
    entry_bindings:
      - 김문성이 가장 좋아한 음식의 이름조차 모름
    exit_bindings:
      - 귀항탕 완식이 하루와 6닢을 지급하고 빈 창고를 드러낸다
  - instance_id: I05
    block_id: AFR-WL-005
    episode_window: ep003
    use: new
    transforms: []
    entry_bindings:
      - 6닢으로 다음 손님용 정상 재료를 살 수 없음
    exit_bindings:
      - 폐재료가 18닢 잔액, 여덟 재료, 공급계약, 시장 평판으로 바뀐다
  - instance_id: I06
    block_id: AFR-WL-006
    episode_window: ep003_to_ep004
    use: new
    transforms: []
    entry_bindings:
      - 식당이 두 번째 손님을 받을 운영 기반을 확보함
    exit_bindings:
      - 혀 없는 손님이 기억 판독과 다른 감각 난제를 연다

new_story_blocks:
  - AFR-WL-001
  - AFR-WL-002
  - AFR-WL-003
  - AFR-WL-004
  - AFR-WL-005
  - AFR-WL-006

unresolved_owner_forks: []
```

## Work-local Story Blocks

- `AFR-WL-001`: 깨진 십 년산 소스에서 금 간 휴대전화로 손을 돌리는 선택.
- `AFR-WL-002`: 독이 되는 이승 음식을 감수하고 양파 수프를 먹어 온 서하진의 증언.
- `AFR-WL-003`: `18:31`, 망자 한 명당 하루, 목표 `1,095일`의 생환 계약.
- `AFR-WL-004`: 김문성의 몸을 읽고 출항 기억 오작동을 거쳐 귀항탕으로 교정하는 첫 완식.
- `AFR-WL-005`: 박명조 날개와 터진 회혼매 `1닢`을 매출 `50닢`, 도윤 몫 `30닢`, 재고와 공급계약으로 환전하는 공개 검증.
- `AFR-WL-006`: 혀 없이 맛있는 음식을 요구하는 두 번째 손님의 목패.

## Compile gate

- [x] 이전 블록의 결과가 다음 블록의 행동 조건이 된다.
- [x] 도윤의 지위·기술·자본 범위 안에서 1~3화 행동이 성립한다.
- [x] 정보격차는 장부의 정답이 아니라 관찰·조리·운영 실력으로 유지된다.
- [x] ep001은 계약, ep002는 첫 완식, ep003은 첫 사업 환전을 지급한다.
- [x] 내부 입고 원고 한 묶음이 초반 생애주기 여섯 축을 모두 소유한다.
- [x] `AFR-OP-WL01` 하나가 직업·경제행동·수익·축적을 책임진다.
- [x] 보강 원형은 기술가치 환전과 운영 기반 확장의 역할만 맡는다.
- [x] 제목과 장부를 지워도 셰프 겸 식당 운영자의 사업이 설명된다.
- [x] 모든 `use: new`와 `new_story_blocks`가 일치한다.
- [x] 이름·결제 성격·식당 부진 인과는 후보 안에서 구체적인 work-local 값으로 닫혔다.

```yaml
result: pass
unresolved_bindings: []
unresolved_owner_forks: []
pitch_output: ../01_pitch/pitch_candidate.md
```

`pass`는 이 후보 안에서 조립 결정을 닫았다는 뜻일 뿐이다. 원고·Pitch·이름·규칙의 캐노니컬 권위는 owner Adopt 뒤에만 생긴다.
