# 작품 초기화

이 폴더는 특정 작품의 내용이 아니라 Anchored Story Loop의 복사 가능한 골격이다.

기본 모델 레인은 **Web GPT Pro 생산 → Codex Desktop `gpt-5.6-terra` BR0/BR1 감리**다. Codex는 발주 운반·응답 보존·receipt 기록을 맡는다. owner가 명시적으로 고른 대체 생산 레인만 예외로 쓰며, GPT/Codex가 원고를 생산한 경우에는 Codex 계열이 아닌 감리 레인 또는 owner가 최종 판정한다. 이 기본값은 권위를 대신하지 않는다. 캐노니컬 승격에는 항상 owner 승인이 필요하다.

1. source-backed greenfield라면 `30_materials/source_maps/assembly_recipe_template.md`를 `20_model_runs/<producer>/<run>/assembly_recipe.md`로 복사해 기준 원작과 보강 블록을 먼저 컴파일한다. 조립표는 work 폴더에 넣지 않는다.
2. `_template` 전체를 `40_works/<work_slug>/`로 복사한다.
3. `00_status.md`, `00_feedback_profile.md`, `04_manuscript/manifest.yaml`, `08_state/narrative_state.yaml`의 `work_slug`를 같은 값으로 바꾼다.
4. `00_feedback_profile.md`에서 작품이 쓸 Genre Profile을 고른다. 현재 기본값은 `modern_fantasy`이며 금융·재벌물이면 `modern_finance`를 함께 선택할 수 있다.
5. title·portfolio state·stage·episode를 실제 착수 상태로 바꾼다. 빈 복사 직후에는 canonical dispatch를 열지 않는다.
6. Frozen Pitch 뒤 `protagonist_operating_identity_template.md`를 실행해 기준 작동 원형 하나와 현실 직업·반복 경제행동·수익모델·축적물·최종 거물상을 `pass`로 닫고 receipt를 Living Spine에 연결한다.
7. 1화의 대표 성과·보상·배신·몰락과 가까운 Anchor는 `premise_transaction_template.md`와 `character_court_template.md`를 `20_model_runs/`에서 먼저 실행한다. 둘 다 `pass`한 receipt 경로만 Living Spine으로 운반한다.
8. Story Plan 네 표면을 채우고 `ep000` 화별 약속 양식을 실제 화수로 복사·개명한다. A-Rail은 장기 도착점, B-Rail은 엔딩까지의 1~5화 Arc 경로, Rolling Corridor는 현재/다음 B 작업창이다. 첫 3화의 화별 약속은 모두 채운 뒤 `committed`로 잠그고, 이후에는 현재 B 안에서만 현재 1화 committed + 뒤 최대 2화 provisional을 쓴다. `modern_fantasy`를 선택했다면 각 committed 화의 CSU·receipt·external value signal·논리 게이트 receipt·장면 지도 인스턴스를 채운다.
9. 새 작품의 빈 manifest와 Narrative State는 동일한 empty revision-set hash를 유지한다. 첫 owner 승인 원고부터 manifest entry·aggregate·Narrative State를 함께 갱신한다. 현재 B 종결 뒤에는 `05_review/arc_closeout_template.md`로 실제 결과를 닫고, A-Rail을 재확인하고 남은 B-Rail의 내구 필드와 변동 필드를 구분해 reflow한 뒤 다음 B로 넘어간다.
10. 다음 화 continuation gate는
    `05_review/wgp_continuation_receipt.md`를 사용한다. production positive는
    같은 작품의 직전 화, `producer: web_gpt_pro`,
    `continuation_authorized: true`, 정확한 source candidate SHA-256을
    모두 요구하며 BR0/BR1 또는 owner 승격을 대신하지 않는다.

작품 focus를 바꾸기 위해 이 template이나 relay schema를 고치지 않는다. 작품 고유 내용은 복사된 work 폴더에만 둔다.

Pitch 발주는 [`01_pitch/dispatch.md`](01_pitch/dispatch.md)가 범용 entry다. 현대판타지 재벌물은 선택 preset인 [`modern_fantasy_chaebol/greenfield_pitch_dispatch.md`](../../30_materials/presets/modern_fantasy_chaebol/greenfield_pitch_dispatch.md)를 덧붙인다. [`00_source_feed_prompt.md`](00_source_feed_prompt.md)는 owner가 Web Gemini 대체 생산 레인을 고른 경우에만 사용한다.
