# ff_foundry Charter

> **Current workflow authority:** [Anchored Story Loop](anchored_story_loop.md)가 작품 제작 흐름·권위·역방향 재활용·BR0/BR1 감리의 SSOT다. 활성 이름은 [Firefly Terminology](terminology.md)를 따른다. 이 문서 아래 남은 `north_star / blueprint / draft / Donor Chain / canonical_stage`는 레거시 작품과 과거 receipt를 설명할 때만 읽는다.

`ff_foundry` is not a Codex harness factory.

It is a foundry for model-led creative judgment. WebGPT, Gemini, Claude, and Codex may all read a rights-cleared source and produce model-stamped results. `ff_foundry` preserves those results, compares them, and promotes only useful material into writing assets.

## Core Philosophy — no fear harness

Creative models are not treated as hazards to be scared into obedience. Conservatism protects the owner's intent; it must not become a workaround against that intent.

Concrete surface is fuel. Proper names, titles, money, places, objects, gestures, and scene surface carry genre feel, prose rhythm, and the material taste of money. They are observed and used as anchors, not erased out of fear.

Copy/similarity concern is handled only when the owner explicitly calls for that audit layer. It is not installed as a standing threat in model-facing prompts, templates, review rubrics, or relay scripts. Model-facing creative/review language says what to preserve, intensify, route, or retry; it does not rely on blanket bans, penalties, or shame.

## Authority

```yaml
source_truth: ff_sources
model_run_truth: ff_foundry/20_model_runs
promoted_material_truth: ff_foundry/30_materials
work_surface_truth: ff_foundry/40_works
approved_history_truth: exact_owner_approved_manuscript_revision
story_strategy_truth: living_spine_and_anchor_rail
assembly_recipe_role: pre_pitch_build_evidence_without_story_authority
narrative_state_role: rebuildable_projection_from_manuscript_hashes
canon_note_role: manuscript_conflict_resolution_or_owner_retcon_only
portfolio_status_truth: ff_studio_v2/command_board/state/firefly.yaml
work_status_truth: ff_foundry/40_works/<work_slug>/00_status.md
notion_role: human_facing_read_model_and_owner_input_surface
source_feed_prompt_template: ff_foundry/40_works/_template/00_source_feed_prompt.md
owner_final_authority: human_owner
```

## Model Lanes

**2026-07-11 owner 결정 — 생산 풀/감리/운반 분리.** 이 절이 이전의 모든 레인 정책 서술("Web Gemini 단독 기본 생산"과 "동격 writer" 포함, workflow_adoption의 Model Lane Policy 포함)을 대체한다. 모델 성능은 계속 바뀌므로 특정 회사 모델 하나에 생산 권위를 영구 고정하지 않는다. 병목은 여전히 "사람답게 쓰는가 / 장면을 용감하게 채우는가"이며, 산출물별로 더 잘 나온 후보를 채택한다.

- **생산 풀 (creative prose): Web Gemini Pro / GPT·Codex.** 둘 다 Pitch Candidate·Story Plan·화별 약속·원고 후보의 동급 생산자가 될 수 있다. Web Gemini는 repo를 읽지 못하므로 **dispatch 패킷(파일첨부)**으로 받고, GPT·Codex는 repo-native stage packet을 직접 읽되 사용한 규칙 SSOT·레퍼런스와 producer identity를 receipt에 남긴다. 한 산출물에서 복수 후보를 만들 수 있으나 평균내지 않고 더 강한 후보 또는 강한 블록을 고른다.
- **감리: 해당 산출물을 생산하지 않은 인간 / Gemini / Claude Code / Codex.** dispatch 패킷 조립, Episode Bet 설계 보조, manuscript BR0/BR1 review, craft_doctrine 수확, 재발 탐지를 맡을 수 있다. 감리 원칙: **죽이는 감리가 아니라 고르는 감리** — 생산자의 과잉은 결함이 아니라 원료다. 생산자 self-review는 범위 점검일 뿐 최종 pass가 아니다.
- **관리·운반: Codex (기본) 또는 Claude.** 파일첨부 운반, 캡처, receipt(20_model_runs), repo 구조를 맡는다. 관리자가 같은 산출물의 생산자로 올라갈 수는 있지만, 그때는 producer identity를 명시하고 최종 감리를 다른 레인 또는 owner에게 넘긴다. 운영 주체 자체는 자유다.
- **WebGPT:** 사용 가능할 때 GPT 생산 풀의 외부 표면으로 취급한다. 특정 WebGPT만을 고정 기본값으로 삼지 않는다.
- **화별 약속 조립 = Claude / Web Gemini / GPT·Codex.** howlib 조회를 바닥으로 깔되 근거 있는 비틀기·빈 셀 발명은 환영한다. 생산자가 화별 약속도 조립했다면 해당 화의 감리는 다른 레인이 맡는다.

**정본 read-only 원칙:** 생산·운반 레인은 승인 원고 revision을 수정·포크하지 않는다. 미래 전략인 Living Spine·Anchor Rail은 owner 판단으로 계속 고칠 수 있다. Canon Note는 원고 내부 의미 충돌 또는 명시적 retcon에만 쓴다.

**External gate anti-moralizing:** 감리자는 인간 / Gemini / Claude Code / Codex가 될 수 있다. 감리는 도덕 교정, 주인공 호구화, 헐리웃식 구원자화, 악역성 세탁을 하지 않는다. 감리 기준은 정합성, 상업성, 페이싱, Episode Bet 약속, payoff, 인간 후폭풍, 독자 보상, 다음화 압력이다.

**Web Gemini 세션 선결조건:** Web Gemini는 빈 세션으로 canonical 루프를 시작하지 않는다. 서오·강동호 현대판타지 원문 재료를 작품별로 순차 주입하고 absorption/synthesis receipt를 남긴 뒤에만 pitch/story/Episode Bet/manuscript 발주를 시작한다. 세 작품을 한 번에 던지지 않는다.

```yaml
rule: web_gemini_source_fed_session_required
applies_to: [Web_Gemini, Web_Gemini_Pro]
production_start_allowed_only_if:
  - session_has_per_source_absorption_receipts
  - session_has_final_synthesis_readback
  - session_used_source_feed_prompt_template
  - session_has_style_cloning_readback
  - source_packet_has_one_base_source_and_2plus_role_bound_supporting_sources
  - source_packet_scope_is_3plus_works_default_or_5_max_sliced_equivalent
fallback_if_not_fed:
  - feed_source_material_one_work_at_a_time
  - get_short_absorption_readback_after_each_work
  - get_final_synthesis_readback_after_all_sources
  - verify_style_cloning_readback
  - record_chat_url_and_attachment_or_slice_list
  - then_start_production_dispatch
source_feed_prompt_template: 40_works/_template/00_source_feed_prompt.md
receipt_root: 20_model_runs/gemini/
decision: ff_studio_v2/command_board/decisions/web-gemini-source-fed-session-precondition-20260611.md
```

**Anchor refinement 루프:** 시작부터 엔딩까지 6~12개 tentpole을 희소하게 박고, 가장 가까운 두 앵커만 자세히 만든다. Rolling Corridor는 다음 1화 committed + 뒤 2화 provisional을 기본으로 하며 Anchor Rail을 소리 없이 바꾸지 않는다. 생산자 self-review는 범위 점검일 뿐 최종 승격이 아니다. exact raw는 `20_model_runs/`에 보존한다.

```yaml
rule: anchor_rail_rolling_corridor
applies_to: [Web_Gemini, Web_Gemini_Pro]
tentpoles_total: 6_to_12
detailed_nearest_anchors: 2
rolling_default: current_1_committed_plus_2_provisional
required_sequence:
  - raw_attempt1_saved
  - self_review_saved
  - raw_attempt2_saved
  - external_gate_before_promotion
self_review_is_final_gate: false
pacing_gate:
  required_for: [anchor_conversion, reader_debt, aftershock, next_pressure]
  authority: [human, gemini, claude_code, codex]
  verdict: pass | retry
  producer_self_review_can_pass: false
```

**Production Flow — thin default:** 현재 제작 단계(`production_stage`)는 `pitch -> story -> episode_bet -> manuscript -> review`를 쓴다. 피치 전에는 출처가 보이는 Story Block을 조립표로 엮지만, 조립표는 `20_model_runs/`에 두는 build evidence이며 제작 단계가 아니다. owner가 채택한 Frozen Pitch부터 사람-facing 작품 표면이 시작된다. `story`는 작품 척추 + 장기 앵커 + 근접 3화의 Story Plan이다. 원고 후보는 BR0/BR1 뒤 owner 승인을 받아야 승인 원고가 된다. 상태 스냅샷은 승인 원고에서 재생성하는 투영이고 충돌 판정 메모는 선형 단계가 아니다. dispatch는 운반 기록, receipt는 증거다. 원고 후보 발주 전에는 현재 화별 약속, 직전 승인 원고, 가까운 장기 앵커/근접 3화, 필요한 JIT 재료가 있어야 한다. 예외 산출물은 `20_model_runs/...`의 model-run experiment로만 보존한다.

**Web Gemini 운반 원칙:** Web Gemini는 병렬로 돌리지 않는다. 탭/대화/생성은 항상 1개만 열고, 현재 chunk의 첨부 chip 확인 -> prompt 전송 -> 응답 완료 -> raw/receipt 저장까지 닫힌 뒤에만 다음 chunk를 시작한다. 병렬 탭은 첨부 누락과 전송 누락을 만든다.

```yaml
rule: web_gemini_serial_only
applies_to: [Web_Gemini, Web_Gemini_Pro]
parallel_tabs: forbidden
parallel_generations: forbidden
advance_next_chunk_only_after:
  - upload_chip_verified_before_prompt
  - upload_chip_verified_after_prompt
  - response_generation_complete
  - raw_saved
  - receipt_saved
answer_now_button:
  meaning: long_source_absorption_in_progress
  action: do_not_click
  wait_policy: wait_until_stop_button_disappears_and_response_text_is_visible
```

**Subscription lane hygiene:** 큰 model-run은 receipt에 `subscription_lane`과 `context_budget`을 남긴다. 기본은 구독 UI/interactive surface를 쓰는 `thin` 레인이다. `thick` 컨텍스트는 새 source-feed, high-risk gate, canon reopen, owner explicit일 때만 연다. `ANTHROPIC_API_KEY`, `--bare`, cloud provider key, unknown billing surface는 자동 기본값이 아니며 auth preflight 후에만 쓴다. `claude -p`/headless는 금지가 아니라 **bounded headless** 후보지만, 인증·구독·agentic/API 레인을 receipt에 남긴다.

**모델 프롬프트 위생:** 생산자와 감리자에게 겁을 주지 않는다. Web Gemini, Claude, Codex에게 보내는 창작·감리 문장은 긍정문으로 쓴다. 첨부는 닫힌 세계가 아니라 **문체·장르감·속도·돈의 물질감·고유 표면·반복쾌감 참고자료**다. 익숙한 장르 포맷은 결함이 아니라 상업적 자산으로 다룬다. 문체 참고를 명시하고, 필요한 분량은 하한만 둔다. 실행 기록과 감리 기록은 모델에게 작가 페르소나 대신 개발자 페르소나를 강제하지 않는다.

**사람-facing 표면 분리:** pitch/story/Episode Bet/manuscript처럼 사람이 읽는 창작 표면에는 `yaml`, status, self-check, gate 판정, receipt 링크 같은 운영 메타를 섞지 않는다. 생산 레인은 사람말 본문을 쓰고, 운반/감리 레인이 상태값·합격선·채택 여부를 별도 gate/receipt/Notion 속성에 남긴다.

**Feedback harvest scope routing:** owner 피드백, gate 실패, model self-review 신호는 바로 `craft_doctrine.md`에 전역 승격하지 않는다. 먼저 `40_works/<work_slug>/00_feedback_profile.md`와 `30_materials/craft/genre_profiles/`를 통해 `attempt_only / stage_local / work_local / genre_family / universal_craft`로 분류한다. 모든 review/gate 산출물은 `feedback_harvest`를 남기며, 최종 승격 권한은 owner에게 있다.

권리·유사성 정리는 상시 공포 규칙으로 하네스에 박지 않는다. owner가 명시한 감리 단계에서 따로 본다. 채굴 단계도 같은 원칙을 따른다. **고유 표면 채굴은 유지한다.** 고유명·직함·금액·장소·물건·장면 표면은 관찰 근거로 짧게 남긴다. 모델에게는 **짧은 앵커와 고유 표면을 살리고, 처리 방식과 읽는 맛을 뽑는다**고 말한다.

owner 최종 권한은 불변. 레인 우열은 주장이 아니라 산출물 블라인드 AB로 재캘리브레이션한다(50_cross_model_ab).

## Rule

`ff_sources` remains the canonical authority for raw source bodies (`source_truth` above is unchanged). The isolation duty — "raw bodies live only in `ff_sources`" — is **repealed** (owner decision, 2026-06-10): working copies of source text (slices, scene cuts, etc.) MAY be git-tracked inside `ff_foundry` when they serve material mining. `ff_sources` stays the single source of truth for the authoritative original.

`ff_foundry` may store:

- model receipts
- model outputs
- ESM/QRP/block style material
- cross-model comparisons
- working copies of source text (slices, scene cuts) used for mining — not the canonical original
- project pitch, Living Spine, Anchor Rail, Rolling Corridor, Episode Bet, manuscript, review, Narrative State, and narrow Canon Notes

`ff_foundry` must not pretend a local Codex extraction is final authority merely because it is structured. Better human smell from a model can outrank a cleaner local ledger after owner or PD review.
