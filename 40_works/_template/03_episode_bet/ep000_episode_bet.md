# ep000 화별 약속 (Episode Bet)

상태: provisional

변화 계약·장면 압력·Story Block receipt·잠금이 실제 화에 맞게 채워지고 현재 화 약속으로 확정된 뒤에만 `상태: committed`로 승격한다. 파일명만 바꾼 빈 복사본은 dispatch할 수 없다.

## 한 줄 베팅

주인공은 **무엇을 걸어 어떤 선택**을 하고, 독자는 이 화 안에 **무엇을 받는다**.

## 독자 효용·CSU 계약

- reader question / paid utility:
- 초반 주인공 매력/유능함 증명: (첫 독해 단위에서 어떤 선택·결과·타인 행동으로 이 사람을 따라갈 이유를 만드는가)
- 유능함 판독 다리: (판의 기본 위험 -> 남들이 막히는 이유 -> 주인공의 다른 선택 -> 실제 결과 -> 없었을 때 손실/타인 행동 변화)
- 선행 정보 의존성 / 해소 경로: (이번 화의 조연·아이템·산업·사이다가 재미있어지기 전에 독자가 알아야 할 값 -> source_block | work_local_invention | owner_fork -> 해소된 구체 값)
- 정보 공개 순서: (중요도와 인과 순서. 1화는 주인공 구매가 supporting noun보다 먼저)
- 미해결 owner fork: 없음
- 논리 게이트 적용: required | inherited | not_applicable
- Premise Transaction receipt: (`20_model_runs/.../premise_transaction.md` 또는 `해당 없음`)
- Character Court receipt: (`20_model_runs/.../character_court.md` 또는 `해당 없음`)
- 고위험 선택 탐색: (Best-of-N 적용 대상·후보 수·상위 2개·채택값. 없으면 `해당 없음`)
- 새로 이해할 판 / 선택·보상 연결: (이번 화에 필요한 사람·규칙·병목·위험 중 무엇을 이해하고, 그 이해가 주인공의 어떤 선택과 즉시 보상을 가능하게 하는가)
- CSU 입력 행동:
- 주인공 고유 기여:
- receipt 종류:
- 구체 표면:
- 외부 가치 신호:
- 독자 답 — 왜 대단한가:
- 독자 답 — 무엇이 달라졌나:
- next-click purchase:
- ep001 reader orientation: 정체/위치 -> 능력과 욕망 -> 주요 관계 -> 몰락 인과 -> 후회 -> 새 목적
- skip test: (이 화를 건너뛰어도 다음 화의 쾌감·관계 변화·소유 과정이 같은가? `yes`면 합치거나 재설계)

## 변화 계약

- 시작 상태:
- 끝 상태:
- 현재 제약·비용:
- countable change:
- 입력-출력 비례성:
- 상대 이해관계:
- 보상 실질가치: (이름·직함·퍼센트를 지워도 남는 돈·현금흐름·통제권·관계·다음 선택)
- 주인공 삭제 반사실: (주인공이 없으면 같은 결과가 나는가. 조연 기여와 주인공만의 비가역 기여를 분리)
- 패배 합리성 / 적대자 비용: (주인공의 정상 방어 -> 적대자의 준비된 수단·행동·비용 -> 방어가 뚫린 이유)
- 비가역 표면(현금/문서/지위/관계/소유):
- 인간 후폭풍:
- 주 시점 / 화자 거리: (예: 주인공 현장 제한형 1인칭. 타인의 속마음은 독립 컷에서만)
- 독립 타인 POV 수 / POV 예외 기능:
- 전문 인과 의미 다리: (전문 trigger -> 실제 행동 -> 돈·시간·위험·관계의 독자용 결과. 전문 판이 없으면 `해당 없음`)
- next-click pressure:

## 장면 압력

장면 개수보다 `압력 -> 선택 -> 환전 -> 반응`의 인과를 쓴다.

- 가치 신호 route: same-scene | exit-appraisal | reaction-vignette | enemy-misread | report-chain | market-signal
- 평가자 / signal owner:
- 평가 변화: before -> evidence -> after -> behavior

1. 압력:
2. 선택:
3. 환전:
4. 후폭풍/절단:

### 장면 지도

| scene | owner | pressure | choice | conversion | reaction | transition purpose / bridge |
|---|---|---|---|---|---|---|
| S1 |  |  |  |  |  |  |

`owner`는 그 장면의 관찰 주체다. `transition purpose / bridge`에는 다음 장면이 새로 지급할 정보·평가·관계 후폭풍·적의 압박·규모 파급·다음 행동을 쓴다. 시간·장소 변경이나 재설명만으로는 전환이 아니다. 독립 타인 POV라면 주인공이 볼 수 없는 값을 적고, 다음 주인공 장면이 무엇을 이어받는지 밝힌다.

`modern_fantasy`를 선택한 작품은 위 CSU·가치 신호·POV·장면 지도에 이번 화 값만 채운다. 정적 profile 전문은 복붙하지 않는다.

## Story Block receipt

```yaml
story_blocks:
  - instance_id:
    block_id:
    use: donor | transform | new
    transforms: []
jit_materials: []
reuse_target: mechanism_and_materiality_only
passed_to_dispatch:
  stage_and_witnesses: []
  concrete_objects: []
  protagonist_behavior: []
  visible_reactions: []
  relationship_or_material_payoff: []
  end_image: []
```

`passed_to_dispatch`에는 donor에서 `retain / transform`하기로 한 구체 축만 적는다. 자본·권한·관계 delta는 변화 계약 안에서 계산하되 그 추상어 자체를 장면 해결책으로 보내지 않는다. `use: new`는 이 축을 풍부하게 할 수 있지만 대신할 수 없다.

## Render selection

이번 화의 source-linked rendering 선택은 **2–3개만** 적는다. 이 블록은 새 gate나 점수표가 아니라, source-fed 생산 세션이 이번 화에서 실제로 살릴 구체 장면 재료다. 비어 있는 유형은 억지로 채우지 않는다.

```yaml
render_selection:
  - function: sensory_anchor | witness_reaction | material_conversion | knowledge_provenance | residue_beat
    source_or_work_local_basis:
    scene_slot:
    must_make_visible: action | reaction | material consequence | end image
    do_not_turn_into: abstract procedure | access right | explanatory label
```

선택값은 현재 화의 압력·선택·환전·후폭풍 중 하나에 직접 붙는다. donor carrier를 밀어내지 않는 `work_local_invention`은 허용하지만, source 이름이나 원문 표현을 생산 패킷에 옮기지 않는다.

## 잠금과 여지

- 반드시 지킬 것:
- 생산자가 용감하게 채울 공간:
- Narrative State에서 확인한 사실 좌표:
