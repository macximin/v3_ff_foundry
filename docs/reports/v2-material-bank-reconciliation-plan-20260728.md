# v2 재료 뱅크 정합·재연결 계획 — 2026-07-28

상태: `proposal_only`

실행 권한: 없음. 이 문서는 계획만 정한다. 파일 이관, 캐논 수정, 원고 재작성, 자동화 변경, 커밋·푸시는 별도 owner 승인 전까지 하지 않는다.

비공개 경계: 과거 뱅크 연결을 defer한 이유는 `owner-private`로 둔다. 이유를 추정·복원·문서화하지 않는다.

## 목적

읽기 전용 `ff_studio_v2`에 남아 있는 검증된 창작 재료를 폐기하지 않고, 현재 v3 Anchored Story Loop의 선택형 JIT 재료로 다시 연결한다.

이 작업은 v2 복귀나 새 v4 설계가 아니다. v3의 권위·소유권·Storyyard 단방향 투영 구조를 유지하면서, 미완료된 재료 계층 이관만 닫는다.

## 현재 확인된 상태

| 재료군 | v2 | 현재 v3 | 계획상 처리 |
|---|---|---|---|
| PITCH | 뱅크·추출 자료 존재 | 실물 디렉터리 없음 | 카드와 근거를 분리해 재검토 |
| QRP | 뱅크·raw·source slice 포함 약 200개 파일 | 문서 참조만 있고 실물 없음 | 정제 카드 우선 복구, 원문은 Sources 권위로 분리 |
| ESM | 존재 | 존재 | 동일성·링크·버전만 대조 |
| BLOCK | 존재 | 존재 | Source Map/Story Block과 중복·역할 대조 |
| CHARACTER | 존재 | 존재 | 인물 원형과 작동 정체성 분리를 유지 |
| CRAFT | 존재 | 존재 | 중복 규칙 추가 없이 현재 inject와 대조 |
| HOWLIB | 존재 | 실물 없음 | JIT 조회 바닥으로 필요한 항목만 검토 |
| RENDER / OPENING | 존재 | 실물 없음 | 현 `render_selection`과 겹치지 않는 카드만 검토 |
| SYNTHESIS | 다수 존재 | 실물 없음 | 정본이 아닌 근거·색인으로만 선별 |
| Source Map | 존재 | 존재 | v3의 주 재사용 단위로 유지 |

v2의 원문·raw·실행 로그 파일 수를 그대로 “복구 가치”로 보지 않는다. 정제 카드, 근거 관찰, 원문, 실행 로그를 서로 다른 권위층으로 분류한 뒤 판단한다.

## 고정 원칙

1. `ff_studio_v2`와 그 edge repo는 끝까지 읽기 전용 archive다.
2. 승인 원고와 manifest가 이미 일어난 이야기의 최고 권위라는 v3 순서를 바꾸지 않는다.
3. Raw source 권위는 `v3_ff_sources`에 둔다. Foundry에 원문 덩어리를 새 정본처럼 복사하지 않는다.
4. 뱅크는 이야기 권위가 아니라 JIT 메뉴다. 전체 bank를 생산자에게 한꺼번에 주입하지 않는다.
5. 재사용 중심은 출처 좌표와 입출력 계약이 있는 작은 Story Block이다.
6. 기존 승인 원고를 뱅크에 맞춰 소급 재작성하지 않는다.
7. Web GPT Pro와 owner가 선택한 대체 생산 레인이 동일한 선택 재료 계약을 사용한다. Gemini 전용 source-feed receipt와 JIT 재료 선택을 혼동하지 않는다.
8. 새 canonical stage, 새 대시보드, 새 범용 bank는 만들지 않는다.

## 실행 단계

### Phase 0 — 동결 인벤토리

- v2/v3 각 재료 파일의 상대 경로, Git commit, 크기, SHA-256, 분류를 읽기 전용 manifest로 산출한다.
- 분류는 `bank_card | evidence | raw_source | model_run | methodology | superseded`로 제한한다.
- v3 문서가 가리키지만 실물이 없는 경로와, v3 실물이 있지만 참조되지 않는 경로를 함께 찾는다.
- 산출물은 비교표뿐이며 이 단계에서는 어떤 파일도 옮기지 않는다.

Gate 0: owner가 인벤토리 범위와 비공개 경계가 지켜졌는지 확인한다.

### Phase 1 — 권위·출처 판정

각 항목을 다음 네 가지 중 하나로 판정한다.

- `adopt_card`: v3 JIT 카드 후보
- `reference_only`: 근거 확인용 archive pointer
- `route_to_sources`: raw source 권위로 연결할 대상
- `retire`: 중복·낡은 계약·출처 불명으로 사용하지 않을 대상

판정에는 최소한 원출처 좌표, 기존 card ID, 중복 v3 자산, 허용 사용 범위, 저작권/원문 경계를 남긴다. “파일이 있으니 전부 복사”는 허용하지 않는다.

Gate 1: owner가 v3에 들어올 정확한 카드 집합을 승인한다.

### Phase 2 — 최소 재료층 복구

승인된 정제 카드만 다음 우선순위로 복구한다.

1. QRP 정제 bank
2. PITCH 정제 bank
3. HOWLIB의 현재 계약과 겹치지 않는 lookup
4. RENDER / OPENING의 `render_selection` 보강분
5. 필요한 SYNTHESIS 색인

복구 시 기존 stable ID를 가능한 한 유지하고, v2 경로와 source authority pointer를 기록한다. 상대경로 백링크는 v3 실제 경로로 재검증한다. raw source와 대량 model run은 Foundry bank 옆에 동반 복사하지 않는다.

Gate 2: 링크 무결성, source authority, 중복 여부, 금지된 원문 복사 0건을 검증한다.

### Phase 3 — 선택 영수증 연결

새 stage를 만들지 않고 기존 표면을 사용한다.

- 작품 전역 캘리브레이션: `20_model_runs/<lane>/<run>/material_calibration.md`
- 회차 선택: 기존 Episode Bet의 `jit_materials`, `story_blocks`, `render_selection`
- 실제 전달 증거: 기존 dispatch/receipt

작품 캘리브레이션은 다음만 가진다.

- 기준 주인공 작동 정체성 1개
- 주요 인물 원형 2~4개
- 작품에 허용된 QRP 후보 2~4개
- 허용된 ESM/BLOCK 보강 후보
- 금지·충돌 카드
- 선택 근거와 source pointer

회차 Episode Bet에는 이 메뉴 전체가 아니라 현재 결정에 필요한 카드만 넣는다.

- QRP 0~2개
- CHARACTER 0~2개
- ESM/BLOCK/ HOWLIB 합계 0~2개
- `render_selection`은 기존 계약대로 2~3개

빈 유형을 억지로 채우지 않으며, 선택된 카드가 없으면 `none`과 이유를 receipt에 남긴다.

### Phase 4 — 단일 작품 파일럿

owner가 고른 작품 하나의 **다음 미승인 회차**에서만 시험한다.

1. 승인 원고와 Narrative State에서 작품 고유성을 먼저 복원한다.
2. 재료 캘리브레이션을 만든다.
3. Episode Bet에 소수의 JIT 카드만 선택한다.
4. Web GPT Pro 발주 패킷에 선택값과 source pointer를 명시한다.
5. BR0는 기존대로 plan-blind로 원고만 읽는다.
6. BR1에서 선택 재료가 캐릭터 행동, 보상 물성, 장면 후폭풍에 실제로 기여했는지 비교한다.
7. owner가 `adopt | revise | stop`을 결정한다.

파일럿은 승인 원고를 자동 승격하지 않으며, 기존 1~3화 또는 이미 승인된 후속 화를 다시 쓰지 않는다.

Gate 3: 품질 상승이 확인된 선택 방식만 다음 작품에 반복한다.

### Phase 5 — 작품별 점진 적용

- 작품마다 캘리브레이션 1개를 먼저 만들고 회차별 선택은 작게 유지한다.
- B close reflow 때 먼 미래 재료 선택도 함께 `keep | revise | retire`로 재검토한다.
- 동일 카드의 반복 사용은 작품 안에서 기능이 누적될 때만 허용한다.
- 뱅크 사용량이나 첨부 수를 품질 KPI로 삼지 않는다.

## 검증 항목

### 구조 검증

- v3 문서의 깨진 bank 경로 0건
- 채택 카드마다 stable ID와 v2 provenance 존재
- raw source authority가 Foundry로 이동한 사례 0건
- v2 archive 수정 0건
- 새 canonical stage 0개

### 생산 검증

- dispatch receipt에서 실제 전달한 JIT 카드와 버전을 재구성할 수 있음
- full bank 첨부 0건
- BR0 packet에 계획·bank 정보 유입 0건
- BR1이 카드 존재 여부가 아니라 원고 표면의 행동·반응·물질 보상을 판정
- producer 종류와 무관하게 같은 선택 계약 사용

### 품질 판정

다음 질문에 파일럿 전보다 명확히 답할 수 있어야 한다.

- 인물의 선택과 목소리가 작품 안에서 더 구별되는가
- 보상이 돈·물건·권한·관계 변화로 손에 잡히는가
- 장면이 설명·문서 처리로 닫히지 않고 행동과 후폭풍을 남기는가
- 원작 표면 복사가 아니라 작동 원리와 물성이 작품 고유 표면으로 환전됐는가
- 다음 클릭 압력이 현재 B와 가까운 Anchor를 실제로 전진시키는가

## 중단 조건

아래 중 하나라도 발생하면 확대 적용을 멈춘다.

- 뱅크가 승인 원고나 Story Plan보다 높은 권위처럼 작동함
- 캐릭터가 원형 메뉴에 끌려 작품 고유성이 약해짐
- 원문 표현·고유명·사건 표면이 무근거로 복제됨
- source provenance를 재구성할 수 없음
- 전체 bank 첨부로 context가 오염됨
- 선택 영수증 없이 “사용했다”고만 기록됨
- 품질 차이가 없는데 계약과 운영비만 늘어남

## 완료 조건

1. owner가 승인한 v2 정제 카드만 v3에서 읽을 수 있다.
2. QRP를 포함한 채택 bank의 실제 경로와 문서 참조가 일치한다.
3. 원문은 `v3_ff_sources`, 창작 재료와 receipt는 `v3_ff_foundry`라는 경계가 유지된다.
4. 작품별 캘리브레이션과 회차별 선택 receipt가 기존 Episode Bet/dispatch 흐름에 연결된다.
5. 한 작품 파일럿에서 BR0/BR1/owner 판정이 닫힌다.
6. 승인 원고 소급 변경, v2 재가동, Storyyard 역방향 변경이 없다.

## owner 결정 지점

계획 승인 후에도 실행은 자동으로 시작하지 않는다. 다음 네 결정을 각각 따로 받는다.

1. 인벤토리 실행 승인
2. 정확한 카드 이관 집합 승인
3. 파일럿 작품·회차 승인
4. 파일럿 결과의 확대 적용 승인
