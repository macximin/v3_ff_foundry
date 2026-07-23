# Canonical Pipeline Contract Audit — 2026-07-18

상태: `implemented_pending_owner_review`

범위: `ff_foundry`의 활성 Charter, Terminology, work template, `Invoke-DraftRelay.ps1`, 그리고 해당 template test만 검사했다. 특정 작품, 원고, model run, 생산자 품질, source corpus는 의도적으로 제외했다.

## 결론 안정성

다섯 번의 독립 대조에서 결론은 바뀌지 않았다.

1. **권위/템플릿 대조:** Anchored Story Loop와 template은 source-fed 생산, 2–3개 render selection, BR0 blind readback을 명시한다.
2. **정본 간 대조:** Charter와 README의 생산 레인 설명, Charter의 고정 source 묶음과 source-feed template의 역할 기반 묶음이 서로 다르다.
3. **정적 실행 경로 대조:** relay가 실제로 강제·전달·생성하는 입력/패킷을 template 계약과 비교했다.
4. **review→route→승격 대조:** `pass` 경로가 승인 원고나 manifest를 자동 변경하지 않는지, owner 승인 권위가 보존되는지 검사했다.
5. **schema→validator 대조:** status, manifest, Episode Bet, review template이 정한 기계 판독 계약과 relay의 실제 assertion 범위를 대조했다.

따라서 문제는 새 창작 단계나 별도 Hermes/Codex 규칙 파일의 부재가 아니다. **기존 canonical contract가 relay 경계에서 일부만 실행되는 문제**다.

4차 감리는 `pass`가 `20_model_runs` 안의 exact settled candidate만 만들고 `04_manuscript`/manifest를 자동 수정하지 않는 것을 확인했다. 이 승격 경계는 보존한다.

## 현재 보존할 것

- `Frozen Pitch -> Story Plan -> Episode Bet -> manuscript candidate -> BR0/BR1 -> owner approval` 흐름.
- source-fed producer, 얇은 현재 단계 packet, BR0 blind / BR1 plan-aware 분리.
- `render_selection`을 2–3개의 현재 화 장면 재료로만 쓰고, 점수표·별도 stage·후처리 humanize loop로 만들지 않는 원칙.
- owner만 승인 원고를 승격한다는 권위 순서.

## 확인된 계약 단절

### P0 — render selection은 template에만 있고 relay admission에서 검증되지 않는다

`03_episode_bet/ep000_episode_bet.md`는 2–3개의 `render_selection`을 요구한다. 그러나 relay의 `Get-ModernFantasyContractIssues`는 해당 section의 존재, 항목 수, 각 항목의 `scene_slot` 및 `must_make_visible`을 검사하지 않는다.

결과적으로 `committed` Episode Bet은 render selection이 비어 있거나 형식이 깨져도 dispatch 경로로 갈 수 있다. 이는 새 gate를 추가하는 일이 아니라 이미 있는 Episode Bet 계약을 fail-closed로 만드는 일이다.

### P0 — relay는 선택 재료를 별도 생산 packet으로 컴파일하지 않는다

dispatch template은 `render_selection`을 attachment로 요구한다. 실제 relay `Invoke-Prepare`는 Episode Bet 전체의 경로만 attachment list에 넣고, 선택된 2–3개를 추출하거나 receipt에 표시하지 않는다.

생산자는 긴 Episode Bet 안에서 직접 찾아야 하며, 외부 producer에 전달할 때 그 부분이 누락됐는지 확인할 receipt도 없다. 선택값을 한 번만, dispatch cover order 아래에 명시적으로 컴파일해야 한다.

### P0 — BR0 template의 관찰 항목이 relay가 만드는 blind packet에 빠진다

review template에는 다음 BR0 관찰이 있다.

- first remembered sensory/object/action anchor
- independent response or changed behavior
- abstract procedural surface displacement

하지만 `New-BlindReviewPacketText`는 이 세 항목을 output target에 요구하지 않는다. blind reviewer는 template을 자동으로 읽는 것이 아니라 relay가 만든 blind packet을 따른다. 따라서 surface drift 관찰이 실제 BR0에서 빠질 수 있다.

### P1 — source-fed precondition은 선언만 되고 relay receipt와 연결되지 않는다

Charter는 Web Gemini의 source-feed receipt와 final synthesis readback을 production precondition으로 둔다. relay는 external producer에 대해 “already satisfy”라는 문장만 receipt에 남기며, 선택한 source-feed receipt의 경로·필수 필드·`stage packet ready`를 확인하지 않는다.

검증 대상은 Web Gemini lane으로 한정해야 한다. GPT/Codex repo-native lane에 같은 선결조건을 강제해서는 안 된다.

### P1 — 활성 정본 문구가 두 군데에서 어긋난다

- Charter와 `AGENTS.md`는 Web Gemini Pro와 GPT/Codex를 동급 생산 풀로 둔다.
- README는 Web Gemini Pro를 default manuscript producer로, Claude/Codex prose를 owner-explicit lane으로 설명한다.
- Charter는 서오·강동호 포함을 고정 source-feed precondition으로 적지만 source-feed template은 후보별 base + 기능별 support의 가변 묶음을 정본으로 적는다.

이 두 항목은 명시적인 단일 policy로 Charter에 맞춰 README와 source-feed precondition을 정렬해야 한다.

### P1 — relay의 실행 stage와 직전 원고 권위 검증이 얇다

relay는 `schema_version`, workflow schema, active portfolio, current episode, committed Episode Bet, 이전 endpoint의 path/hash를 검사한다. 그러나 다음은 검사하지 않는다.

- dispatch 시 `production_stage: manuscript`인지.
- native work의 직전 manifest endpoint가 `authority: owner_approved`인지.
- `approved_through` / `manuscript_through` / `state_through`가 manifest 및 Narrative State와 일관되는지.

hash가 맞는 파일은 legacy bridge의 기록일 수 있다. native canonical production에서는 owner-approved endpoint만 직전 원고로 쓸 수 있어야 하며, `imported_legacy_bridge`만 명시적인 예외 경로를 가져야 한다.

### P1 — reviewer independence는 문서화돼 있으나 route에서 검증되지 않는다

Charter는 해당 산출물을 만들지 않은 레인이 감리해야 한다고 정하고 review template도 `reviewer_lane`과 `producer_lane`을 기록한다. relay의 route는 첫 verdict만 읽고 두 레인이 다른지 확인하지 않는다.

이 검사는 identity의 품질을 판정할 필요가 없다. 둘이 같을 경우 owner HIL로 올리거나 route를 막는 정도의 구조적 확인이면 충분하다.

## 최소 개선안 — 순서 고정

### 1. 정본 문구 정렬

Charter의 Model Lanes를 우선 권위로 명시하고 README의 오래된 단독 기본 생산자 문구를 교체한다. source-feed는 `3+ works`, `base + role-bound supporting sources`, receipt-bound routing으로 쓰며 특정 작가 고정 포함 요건은 Charter에서 제거하거나 “해당 장르의 최소 source family”로 재정의한다.

### 2. relay에 render-selection validator 추가

selected `modern_fantasy` work의 committed Episode Bet에 대해 아래를 검사한다.

- `## Render selection` section 존재.
- 정확히 2–3 항목.
- 각 항목에 `function`, `source_or_work_local_basis`, `scene_slot`, `must_make_visible`, `do_not_turn_into`이 비어 있지 않음.
- `scene_slot`이 장면 지도에 존재하고, `must_make_visible`이 추상 delta가 아니라 action/reaction/material/end image 중 하나임.

이 검사는 Episode Bet의 기존 약속을 구조적으로 확인할 뿐, 문체·창작적 선택을 자동 판정하지 않는다.

### 3. dispatch receipt에 선택값과 source-feed proof를 한 번씩 컴파일

relay의 prepare 단계가 다음을 receipt와 dispatch cover order에 표시한다.

- `render_selection` 전체 2–3개 (중복 없이 한 번).
- Web Gemini lane일 때만 source-feed receipt path, synthesis readback path, source count, bundle role fields의 검증 결과.

외부 생산자가 실제로 받은 재료와 canonical admission 증거가 같은 run 폴더에 남는다.

### 4. BR0 packet을 review template과 동기화

`New-BlindReviewPacketText`에 template의 세 관찰 항목을 그대로 추가한다. BR0는 계속 plan-blind이며, 점수나 자동 탈락 규칙은 만들지 않는다.

### 5. 테스트를 template string 존재 검사에서 relay contract smoke로 확장

최소 fixture로 다음을 검증한다.

- 1개·4개·빈 render selection은 relay가 거부한다.
- 정상 2개는 통과한다.
- 생성 dispatch/receipt에 선택값이 정확히 한 번 포함된다.
- 생성 blind packet에 세 BR0 관찰 항목이 모두 있다.
- Web Gemini source-feed proof 누락은 거부하고, GPT/Codex lane은 해당 검사를 요구하지 않는다.
- README/Charter의 model lane 및 source-bundle 정책 핵심 문구가 같은 정책을 가리킨다.

### 6. native/legacy와 감리 독립성의 얇은 경계 검사 추가

- dispatch는 `production_stage: manuscript`일 때만 통과한다.
- `layout_profile: native`는 직전 manifest endpoint의 `authority: owner_approved`를 요구한다.
- `layout_profile: imported_legacy_bridge`는 명시된 legacy authority만 예외로 받고, receipt에 bridge 사실을 남긴다.
- review decision의 producer/reviewer lane이 같으면 자동 승격 후보로 route하지 않고 owner HIL로 돌린다.

## 수용 기준

아래가 모두 충족되면 개선이 끝난다.

1. template 계약의 필수 선택값이 relay에서 fail-closed 된다.
2. dispatch packet과 receipt가 실제 전달한 선택 재료를 재구성 없이 보여 준다.
3. BR0의 눈먼 관찰이 template과 generated packet에서 동일하다.
4. Web Gemini의 기존 source-feed 선결조건은 증거 경로로 확인되며, 다른 생산 레인에는 오적용되지 않는다.
5. native 이전 원고의 owner-approved 권위와 외부 감리 레인이 기계적으로 확인되고, legacy bridge만 좁은 예외를 쓴다.
6. 새로운 stage, 새 `HERMES.md`, 새 창작/폴리싱 loop, 자동 승격은 생기지 않는다.

## 검증 결과

- `python3 -m unittest discover -s tests -v`: PASS (5 tests).
- `python3 -m py_compile tests/test_clone_texture_templates.py`: PASS.
- `Invoke-DraftRelay.ps1` PowerShell parse: PASS.
- 이 테스트는 현재 template 문자열의 존재를 확인한다. 위 개선 전에는 relay의 실제 admission/packet 생성 계약까지 보장하지 않는다.

## 구현 receipt — 2026-07-18

owner 승인 후 다음 최소 변경을 적용했다.

- Charter의 Web Gemini source bundle을 고정 작가 목록에서 `base + 2+ role-bound supporting sources`로 정렬했다.
- README를 Charter의 동급 생산 풀 정책과 정렬했다.
- status template에 Gemini source-feed receipt pointer를 추가했다.
- relay가 `production_stage`, native/legacy layout, native 직전 endpoint의 `owner_approved`, modern fantasy render selection의 2–3개 구조를 검사하게 했다.
- relay dispatch/receipt에 render selection과 Gemini source-feed evidence를 한 번씩 컴파일하게 했다.
- generated BR0 packet에 template의 세 surface-drift 관찰 항목을 추가했다.
- route 전에 reviewer lane이 producer lane과 다른지 확인하게 했다.
- template string test를 relay contract coverage까지 확장했다.

검증: Python unit test 8건 PASS, PowerShell parse PASS, `git diff --check` PASS. 이 구현은 canonical rule/relay/test만 바꾸며, 작품·원고·model run·승인 원고는 건드리지 않는다.
