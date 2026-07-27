# ff_foundry Charter

> **Current workflow authority:** 소설은 [Anchored Story Loop](anchored_story_loop.md), 영상 대본은 [Screenplay Loop](screenplay_loop.md)가 각각 제작 흐름·권위·BR0/BR1 감리의 SSOT다. 활성 이름은 [Firefly Terminology](terminology.md)와 [Screenplay Terminology](screenplay_terminology.md)를 따른다. 이 문서 아래 남은 `north_star / blueprint / draft / Donor Chain / canonical_stage`는 레거시 작품과 과거 receipt를 설명할 때만 읽는다.

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
screenwork_surface_truth: ff_foundry/45_screenworks
approved_history_truth: exact_owner_approved_manuscript_revision
approved_script_truth: exact_owner_approved_episode_script_revision
story_strategy_truth: living_spine_a_rail_b_rail_and_rolling_corridor
assembly_recipe_role: pre_pitch_build_evidence_without_story_authority
narrative_state_role: rebuildable_projection_from_manuscript_hashes
canon_note_role: manuscript_conflict_resolution_or_owner_retcon_only
portfolio_status_truth: ff_studio_v2/command_board/state/firefly.yaml
work_status_truth: ff_foundry/40_works/<work_slug>/00_status.md
screenwork_status_truth: ff_foundry/45_screenworks/<family>/variants/<screenwork_id>/00_status.yaml
source_writeback: forbidden
notion_role: human_facing_read_model_and_owner_input_surface
source_feed_prompt_template: ff_foundry/40_works/_template/00_source_feed_prompt.md
owner_final_authority: human_owner
```

## Screenplay Lane Boundary

`45_screenworks/`는 소설 `40_works/`와 분리된 영상 대본 제작 표면이다. 원작 각색과 영상 오리지널을 모두 다루되, 원작 revision은 정확한 SHA-256으로 고정한다. 원작 변경을 자동 추종하지 않고 impact report 뒤 owner가 승인한 명시적 rebase만 허용한다.

영상 변경은 소설에 자동 반영하지 않으며, 소설 변경도 영상에 자동 반영하지 않는다. 같은 IP의 가로형·세로형 등 format variant는 family core만 공유하고 각각 독립된 대본 권위와 상태를 가진다. 최종 승인 영상이 생기기 전에는 owner가 승인한 정확한 episode script revision이 영상 이야기 권위다. 최종 승인 영상 단계에서는 실제 반영된 변경을 conformed script와 change map에 먼저 되돌려 기록한 뒤, owner가 정확한 영상 파일을 승인해야 영상 사실 권위가 생긴다.

대본 레인의 상세 stage, 장면 재배열, 승인·무효화, 자산·저장소·복구 규칙은 [Screenplay Loop](screenplay_loop.md)가 소유한다. 대본 도구는 `40_works/`, 기존 `production_stage`, `tools/draft_relay/`를 수정하거나 쓰기 대상으로 삼지 않는다.

## Model Lanes

**2026-07-24 owner 결정 — Web GPT Pro 생산 / Codex 5.6 Terra 감리 기본값.** 이 절이 이전의 동급 생산 풀 및 특정 WebGPT 비고정 정책을 대체한다. 기본값은 영구적인 이야기 권위가 아니라 운영 라우팅이며, 최종 권위는 계속 owner 승인에만 생긴다.

- **기본 생산자 (creative prose): Web GPT Pro.** Pitch Candidate·Story Plan·화별 약속·원고 후보를 Web GPT Pro에 우선 발주한다. 컴파일된 dispatch와 필요한 파일을 첨부하고, 실제 전달한 패킷·응답·producer identity를 receipt에 남긴다. 한 산출물에서 복수 후보를 만들 수 있으나 평균내지 않고 더 강한 후보 또는 강한 블록을 고른다.
- **기본 감리자: Codex Desktop `gpt-5.6-terra`.** Web GPT Pro가 생산한 산출물의 BR0 blind readback과 BR1 plan-aware compare를 담당한다. BR0가 봉인되기 전 BR1 재료를 읽지 않으며, 판정은 `pass | revise | restart`만 쓴다. 감리 원칙은 **죽이는 감리가 아니라 고르는 감리**다.
- **관리·운반: Codex.** 파일첨부 패킷 조립, 응답 캡처, receipt와 SHA-256, `20_model_runs` 및 repo 상태를 관리한다. 감리와 관리가 같은 Codex 실행 주체여도 되지만, BR0/BR1은 Web GPT Pro 생산 원문을 수정하지 않고 판정 산출물로 분리한다.
- **대체 생산 레인:** Web GPT Pro가 접근 불가이거나 owner 품질 기준을 충족하지 못한 경우에만 owner가 Web Gemini Pro / GPT·Codex / Claude를 지정한다. GPT·Codex가 직접 생산한 산출물은 Codex가 최종 감리할 수 없고, 인간 / Gemini / Claude 등 다른 레인으로 넘긴다.
- **화별 약속 조립:** 기본 생산자 또는 Codex 관리 레인이 맡을 수 있다. 조립자가 원고까지 직접 생산한 경우에도 원고 생산자 identity를 receipt에 명시한다. howlib 조회를 바닥으로 깔되 근거 있는 비틀기·빈 셀 발명은 허용한다.

**원고 Markdown 장면전환 계약 (2026-07-27 owner 결정):** Web GPT Pro에 원고 제작을 발주할 때는 실제 장면전환 위치를 앞뒤 빈 줄 1개를 둔 단독 `◆ ◆ ◆`로 쓰라고 발주문에 명시한다. 단독 `###`는 Markdown에서 3단계 제목 문법으로 해석되므로 모델이 반환하는 Markdown 원고와 원고 후보의 장면전환 기호로 쓰지 않는다. 별도의 최종 TXT 산출이 필요한 경우에만 운반·조판 레인이 검증된 `◆ ◆ ◆`를 단독 `###`로 변환할 수 있다. 생산자가 필요한 장면전환 기호를 누락하면 승인 원고를 소리 없이 고치지 않고, 운반·감리 레인이 실제 시간·장소·시점 경계를 판독해 별도 수정 후보로 제시한다.

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

**A-Rail / B-Rail refinement 루프:** A-Rail은 시작부터 엔딩까지 6~12개 Anchor를 희소하게 박고 가장 가까운 두 Anchor만 자세히 만든다. **Anchor는 장기 도착점이고 Arc가 아니다.** B-Rail은 엔딩까지 이어지는 순서형 Story Arc 경로다. 각 B는 중심 질문 하나를 승인 원고 기준 1~5화 안에 결산하며, 먼 B는 Anchor·서사 기능·보상 축·독자 부채·직전과의 차이만 가진다. Rolling Corridor는 B-Rail의 현재 B와 다음 B를 비추는 작업창이며 별도 이야기 정본이 아니다. 현재 B 안에서 다음 1화 committed + 최대 2화 provisional만 본다. 현재 B가 owner 승인 원고로 닫히면 Narrative State를 재생성하고 A-Rail을 재확인한 뒤, B-Rail의 먼 슬롯은 내구 필드를 재검증하고 구체 사건·인물·음식·화수는 무효화·재작성한다. 생산자 self-review는 범위 점검일 뿐 최종 승격이 아니다. exact raw는 `20_model_runs/`에 보존한다.

```yaml
rule: anchor_rail_rolling_corridor
applies_to: [Web_GPT_Pro, Web_Gemini, Web_Gemini_Pro, GPT_Codex, Claude]
tentpoles_total: 6_to_12
detailed_nearest_anchors: 2
anchor_is_arc: false
arc_episode_cap: 5
b_rail_route_to_ending: required
b_rail_statuses: [closed, active, provisional, hypothesis, retired]
b_rail_durable_fields: [target_anchor, narrative_function, payoff_axis, carried_reader_debt, contrast_requirement]
b_rail_volatile_fields: [exact_episode_coordinates, guest_identity, food, scene_solution, exact_reward]
rolling_corridor_role: working_projection_of_current_and_next_b
episode_cursor_default: current_1_committed_plus_up_to_2_provisional_within_current_b
arc_close_requires:
  - owner_approved_arc_endpoint
  - narrative_state_rebuilt
  - arc_closeout_review
  - anchor_impact_check
  - downstream_b_rail_reflow
later_b_fields_after_close: revalidate_durable_invalidate_volatile
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

**Production Flow — thin default:** 현재 제작 단계(`production_stage`)는 `pitch -> story -> episode_bet -> manuscript -> review`를 쓴다. 피치 전에는 출처가 보이는 Story Block을 조립표로 엮지만, 조립표는 `20_model_runs/`에 두는 build evidence이며 제작 단계가 아니다. owner가 채택한 Frozen Pitch부터 사람-facing 작품 표면이 시작된다. `story`는 작품 척추 + A-Rail + 엔딩까지의 B-Rail + 현재 B 작업창을 가진 Story Plan이다. 원고 후보는 BR0/BR1 뒤 owner 승인을 받아야 승인 원고가 된다. 상태 스냅샷은 승인 원고에서 재생성하는 투영이고 충돌 판정 메모는 선형 단계가 아니다. dispatch는 운반 기록, receipt는 증거다. 원고 후보 발주 전에는 현재 화별 약속, 직전 승인 원고, 가까운 A-Anchor/현재 B, 필요한 JIT 재료가 있어야 한다. 예외 산출물은 `20_model_runs/...`의 model-run experiment로만 보존한다.

**웹 생산자 운반 원칙:** Web GPT Pro는 후보마다 독립 채팅을 쓰며 owner가
병렬 운용을 지시하면 서로 다른 후보를 최대 2개까지 동시에 생성할 수
있다. 한 채팅에는 한 후보의 첨부와 프롬프트만 두고, 각 채팅에서 첨부
chip을 전송 전후로 확인한다. 세 번째 후보는 기존 두 슬롯 중 하나의
응답 완료·raw 저장·receipt 저장이 끝난 뒤 연다. Web Gemini는 별도 owner
지시가 없으면 기존처럼 1개씩 직렬 운반한다. 같은 후보를 여러 채팅에서
동시에 생성하거나 한 채팅에 후보를 섞지 않는다. Web GPT Pro receipt에는
채팅 URL 또는 응답 식별자, 후보명, 첨부 목록과 SHA-256을 남긴다.

```yaml
rule: web_producer_bounded_parallel
applies_to: [Web_GPT_Pro, Web_Gemini, Web_Gemini_Pro]
web_gpt_pro_parallel_candidate_max: 2
web_gemini_parallel_candidate_max: 1
distinct_chat_per_candidate: required
same_candidate_parallel_generations: forbidden
mixed_candidate_attachments_in_one_chat: forbidden
each_chat_requires:
  - upload_chip_verified_before_prompt
  - upload_chip_verified_after_prompt
  - candidate_identity_in_prompt
slot_reuse_only_after:
  - response_generation_complete
  - raw_saved
  - receipt_saved
answer_now_button:
  applies_to: [Web_GPT_Pro, Web_Gemini, Web_Gemini_Pro]
  meaning: long_source_absorption_in_progress
  action: do_not_click
  wait_policy: wait_until_stop_button_disappears_and_response_text_is_visible
```

**Subscription lane hygiene:** 큰 model-run은 receipt에 `subscription_lane`과 `context_budget`을 남긴다. 기본은 구독 UI/interactive surface를 쓰는 `thin` 레인이다. `thick` 컨텍스트는 새 source-feed, high-risk gate, canon reopen, owner explicit일 때만 연다. `ANTHROPIC_API_KEY`, `--bare`, cloud provider key, unknown billing surface는 자동 기본값이 아니며 auth preflight 후에만 쓴다. `claude -p`/headless는 금지가 아니라 **bounded headless** 후보지만, 인증·구독·agentic/API 레인을 receipt에 남긴다.

**모델 프롬프트 위생:** 생산자와 감리자에게 겁을 주지 않는다. Web GPT Pro, Web Gemini, Claude, Codex에게 보내는 창작·감리 문장은 긍정문으로 쓴다. 첨부는 닫힌 세계가 아니라 **문체·장르감·속도·돈의 물질감·고유 표면·반복쾌감 참고자료**다. 익숙한 장르 포맷은 결함이 아니라 상업적 자산으로 다룬다. 문체 참고를 명시하고, 필요한 분량은 하한만 둔다. 실행 기록과 감리 기록은 모델에게 작가 페르소나 대신 개발자 페르소나를 강제하지 않는다.

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
- project pitch, Living Spine, A-Rail, B-Rail, Rolling Corridor, Episode Bet, manuscript, review, Narrative State, and narrow Canon Notes

`ff_foundry` must not pretend a local Codex extraction is final authority merely because it is structured. Better human smell from a model can outrank a cleaner local ledger after owner or PD review.
