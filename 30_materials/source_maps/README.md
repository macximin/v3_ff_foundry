# source_maps — Story Block Library

성공작이나 승인 원고에서 **무엇이 어떤 순서로 작동했는지** 역으로 읽고, 새 작품에서 호출할 수 있게 만든 출처 기반 라이브러리다. 각 문서는 Source Map이고, 최소 호출 단위는 Story Block이다.

```text
entry state -> pressure/want -> protagonist move -> proof/payoff
            -> capital/authority/relationship delta -> cost/debt -> next pressure
```

## 규칙

- 모든 Story Block은 stable `block_id`, source 좌표, evidence 경로를 가진다.
- 블록은 `entry_contract -> sequence -> exit_contract`를 명시한다. 입출력 계약이 없는 멋진 장면은 아직 호출 가능한 블록이 아니다.
- `entry / sequence / exit`가 실제 사건 source 좌표에서 파생된 블록은 자동으로 carrier 채굴 대상이다. cited evidence에 보이는 무대·목격자, 물건, 주인공 행동, 타인의 반응, 관계 전환, 물질 보상, 끝 이미지를 빠짐없이 `carrier_surfaces`에 적는다. 원문에 실제로 없는 범주는 비워 둔다.
- 관찰과 추론을 분리하고 confidence/alternative를 남긴다.
- 피치 전에는 기준 원작(`base_source`) 하나와 보강 블록(`supporting_blocks`)을 조립표로 엮는다. 실행본은 `20_model_runs/`에 둔다.
- 화별 약속에는 전체 Source Map을 복사하지 않고 `story_block_receipt`로 필요한 instance만 참조한다.
- 재사용의 중심은 작동 기능, 순서, 물성이다. 고유명·금액·물건·장면 표면은 evidence anchor로 보존하고, Recipe에서 유지·이름 변경·규모 변경·재배치를 명시한다.
- Recipe는 채워진 carrier 값마다 `retain / transform / intentional_omit` 처분을 가진다. 실제 사건 좌표를 달아 놓고 carrier만 비우거나, `use: new`로 donor 표면을 갈아끼우면 compile fail이다.
- ESM/QRP/페이싱 패턴/CHARACTER/howlib를 대체하지 않는다. 그 재료를 이야기 운동으로 연결하는 provenance view다.

## 호출 단위

- **Source Map:** 한 원작에서 추출한 Story Block과 출처를 담는 문서.
- **Story Block:** 다른 작품의 조립 순서에 넣을 수 있는 최소 호출 단위.
- **instance:** 특정 조립표나 화별 약속에서 Story Block을 변형해 사용한 기록.

양식: [source_map_template.md](source_map_template.md) · [assembly_recipe_template.md](assembly_recipe_template.md) · [premise_transaction_template.md](premise_transaction_template.md) · [character_court_template.md](character_court_template.md)

## 정본화 전 고위험 논리 게이트

1화, 주인공 대표 성과·대형 보상·배신·몰락·가까운 Anchor를 새로 만들거나 바꿀 때는 Story Plan에 넣기 전에 두 build evidence를 쓴다.

- **Premise Transaction:** 보상의 실제 돈·권한·다음 선택, 주인공 불가결성, 적대자의 비용, 패배 메커니즘을 검증한다.
- **Character Court:** 각 인물이 당시 가진 정보·수단·대안으로 자기 이익에 맞게 행동하는지 반사실까지 돌린다.

실행본은 `20_model_runs/`에 두며 이야기 권위가 아니다. `pass`한 두 receipt 경로만 Living Spine과 해당 Episode Bet으로 운반한다. 고위험 선택의 대안 탐색은 이 안에서만 `Best-of-N` 기본 5개→상위 2개 시뮬레이션→1개 채택으로 쓰며, 일반 문장과 모든 장면에 ToT를 확장하지 않는다.

현재 starter maps:

- [modern_finance_story_blocks.md](modern_finance_story_blocks.md) — 재벌·금융·거시 사건·미국 확장
- [modern_talent_story_blocks.md](modern_talent_story_blocks.md) — 사람의 진짜 값 판별·버려진 기술 즉시 환전
- [yujaemu_misfortune_chaebol_story_blocks.md](yujaemu_misfortune_chaebol_story_blocks.md) — 불행 감지 재벌물의 초반 생애주기·sector ladder
