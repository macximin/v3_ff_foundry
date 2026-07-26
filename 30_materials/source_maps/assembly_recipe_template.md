# Assembly Recipe — noncanonical pitch build

> 실제 실행본은 `20_model_runs/<producer>/<run>/assembly_recipe.md`에 둔다. 이 파일은 production stage가 아니며, Frozen Pitch를 대신하지 않는다.

```yaml
recipe_id:
target_work:
producer:
mode: source_backed_assembly

base_source:
  source_id:
  block_ids: []
  owns:
    - protagonist_background
    - deficiency
    - asymmetry_device
    - first_use
    - first_payoff
    - first_arena

protagonist_operating_assembly:
  base_operating_archetype:
  base_evidence: []
  owns: [real_vocation, recurring_economic_verbs, revenue_model, accumulated_assets, final_magnate_identity]
  supporting_archetypes:
    - archetype_id:
      role: voice | market_texture | relationship | pacing

required_story_facts:
  - fact_id:
    required_by_instance:
    reader_dependency:
    resolution_route: source_block | work_local_invention | owner_fork
    resolved_value:
    evidence_or_reason:
    authority_target: pitch | living_spine | anchor_rail | episode_bet

supporting_blocks:
  - source_id:
    role: pacing | payoff | human_texture | long_route
    block_ids: []

ordered_blocks:
  - instance_id: I01
    block_id:
    episode_window:
    use: donor | transform | new
    transforms:
      - carrier:
        disposition: retain | transform | intentional_omit
        source_coords: []
        preserved_function:
        changed_expression:
        canon_or_causal_conflict:
        sourced_concrete_replacement:
    entry_bindings: []
    exit_bindings: []

new_story_blocks: []
unresolved_owner_forks: []
```

## 기준 원작 rule

기준 원작(`base_source`) 하나가 초반 생애주기를 끝까지 책임진다.

```text
주인공 배경 -> 결핍 -> 정보격차 장치 -> 첫 사용 -> 첫 환전 -> 첫 무대
```

보강 블록은 이 뼈대를 갈아끼우지 않는다. 속도, 보상 착지, 가족·관계의 반응, 장기 확장 경로처럼 명시된 한 역할만 강화한다.

## ordered block notes

초반 1~10화의 주요 beat를 순서대로 적는다. 변형은 다음처럼 짧고 구체적으로 쓴다.

- `compress: source 4 episodes -> target 2 episodes`
- `reorder: recognition before seed grant`
- `scale: 1 million -> period-appropriate amount`
- `surface: family dinner -> board luncheon`

`transforms`에는 Story Block의 채워진 carrier 값이 하나씩 등장해야 한다. `intentional_omit`은 현재 작품의 구체 캐논·인과 충돌과 출처 있는 구체 대체물(물건·행동·관계 전환·물질 보상)을 함께 적는다. `권한 상승`, `접근권 확보`, `자본 증가` 같은 추상 delta만으로는 대체가 아니다.

`new`는 실패가 아니다. 다만 source-backed mode에서는 조용한 접착제로 숨기지 않고 `new_story_blocks`에도 같은 instance를 올린다.
`use: new`는 추가 재료나 donor가 없는 빈칸에만 쓴다. donor carrier의 처분을 대신할 수 없다.

## story-fact resolution

블록을 고른 뒤에는 그 블록이 재미있어지기 전에 독자가 알아야 할 선행 정보를 `required_story_facts`로 푼다. 조연·아이템·산업·사이다 장면 자체보다 먼저 주인공의 가치·욕망·관계·받아야 할 보상 같은 의미 전제가 필요할 수 있다.

해소 순서는 다음과 같다.

1. **source_block:** 기준 원작 또는 보강 Story Block에 필요한 기능이 있으면 호출·변형한다.
2. **work_local_invention:** 출처에 없고 작품의 판매 약속·도덕성·장기 목표·핵심 능력·대형 앵커를 바꾸지 않는 접착 사실은 생산자가 구체적으로 발명한다.
3. **owner_fork:** 위 다섯 축 중 하나를 바꾸는 사실은 추천안과 영향을 적어 owner에게 한 번에 올린다.

`work_local_invention`은 허가 회피가 아니라 생산자의 정상 책임이다. 사람·행동·대가·결과가 있는 구체 값으로 만들고 `authority_target`에 컴파일한다. `owner_fork`도 빈 질문으로 올리지 않고 가장 상업적인 추천안을 기본값으로 붙인다.

## compile gate

- [ ] 이전 block의 `exit_contract`가 다음 block의 `entry_contract`를 만족한다.
- [ ] 주인공의 나이·지위·자본·권한으로 각 행동이 가능하다.
- [ ] 정보격차 장치의 범위와 한계가 block 사이에서 몰래 바뀌지 않는다.
- [ ] 각 episode window가 약속한 보상과 인간 환전을 그 안에 지급한다.
- [ ] 기준 원작이 여섯 lifecycle ownership을 모두 가진다.
- [ ] 기준 작동 원형 하나가 현실 직업·반복 경제행동·수익모델·축적물·최종 거물상을 끝까지 책임진다.
- [ ] 보강 작동 원형은 최대 2개이며 각각 한 역할만 맡는다.
- [ ] 작품 제목과 이능력을 지워도 극중 사업과 주인공의 능력 밖 실력이 설명된다.
- [ ] `new_story_blocks`와 `use: new` instance가 정확히 일치한다.
- [ ] actual-event source 좌표의 evidence를 다시 보았을 때 가시적인 carrier 값이 모두 Story Block에 잡혀 있다.
- [ ] 채워진 donor carrier 값마다 출처 좌표가 있는 `retain / transform / valid intentional_omit` 처분이 있다.
- [ ] `use: new`는 추가 재료나 donor가 없는 빈칸이며 donor carrier를 대체하거나 장면의 주된 축에서 밀어내지 않는다.
- [ ] 각 주요 block의 선행 독자 정보가 `required_story_facts`에 있고 source_block 또는 work_local_invention으로 해소됐다.
- [ ] 판매 약속·주인공 도덕성·장기 목표·핵심 능력·대형 앵커를 바꾸는 값만 owner_fork로 라우팅됐다.
- [ ] `unresolved_owner_forks`가 비었다.

## compile result

```yaml
result: pass | revise
unresolved_bindings: []
unresolved_owner_forks: []
pitch_output:
```
