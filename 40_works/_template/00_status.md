---
schema_version: firefly_work_status_v4
workflow_schema: anchored_story_loop_v3
layout_profile: native
work_slug: _template
title: ""
owner_id: wjjo
ownership_scope: personal
production_system: v3_firefly_studio
target_episode: ep250
assigned_writer: pending_owner_decision
assignment_decision_id: null
arc_batch: 1
arc_batch_state: active
portfolio_state: template
production_stage: none
current_episode: ep000
current_b_arc: B001
published_through: ep000
manuscript_through: ep000
approved_through: ep000
reviewed_through: ep000
state_through: ep000
next_action: copy_this_template_for_a_real_work
blockers: []
decision_ids: []
notion_page: null
source_origin: null
source_feed_receipt: null # Web Gemini only: 20_model_runs receipt with 3+ role-routed source feed
updated_at: 2026-07-12
---

# Work Status Template

YAML front matter가 작품 진행 상태의 유일한 기계 판독 정본이다. 본문은 사람용 설명만 둔다.

- `layout_profile`: `native | imported_legacy_bridge`
- `owner_id`, `ownership_scope`, `production_system`은 Storyyard 공개 여부와 별개인 작품 소유권·생산 provenance다.
- `target_episode`는 모든 활성 원고의 완결 목표다. 기본값은 `ep250`이며 변경은 owner decision으로만 가능하다.
- 인간 owner는 이 상태 파일과 레지스트리를 나중에 맞춰도 된다. Hermes 재개 시점에는 `assigned_writer`와 `assignment_decision_id`가 `00_charter/hermes_writer_operations.json`의 기계 판독 배정과 일치해야 하며, `pending_owner_decision` 작품에는 Hermes 제작 티켓을 발주하지 않는다.
- `arc_batch`는 10개 B-Arc 묶음 번호, `arc_batch_state`는 현재 묶음의 실행 가능 상태다. B011 등 다음 묶음은 owner가 새 batch decision을 기록하기 전까지 진행하지 않는다.
- `production_stage`: `none | pitch | story | episode_bet | manuscript | review`. 현재 작업 위치이며 이야기 권위 등급이 아니다.
- `current_b_arc`: B-Rail의 `active_b_arc`, Rolling Corridor의 `current_b_arc.b_id`와 같아야 한다. 어떤 B도 승인 원고 기준 5화를 넘을 수 없다.
- 선택 Genre Profile은 이 front matter가 아니라 `00_feedback_profile.md`의 `genre_profiles`가 소유한다.
- `story`는 Story Plan인 `02_story/{living_spine,anchor_rail,arc_route_rail,rolling_corridor}.md` 네 파일이 모두 있어야 한다.
- 충돌 판정 메모(Canon Note)와 상태 스냅샷(Narrative State)은 선형 stage가 아니다.
- `manuscript_through`는 owner가 승인해 manuscript manifest에 등록된 history endpoint다. raw/review candidate는 `20_model_runs/`에만 두며 owner approval 전에는 `manuscript_through`도 `approved_through`도 전진하지 않는다.
- `state_through`는 Narrative State가 어느 승인 원고까지 투영했는지 뜻한다.
- B 마지막 승인 원고 뒤에는 Narrative State 갱신, B 종결 감리, 이후 B-Rail reflow가 끝나기 전 다음 B의 Episode Bet을 committed하지 않는다.
- `source_feed_receipt`는 Web Gemini production lane에서만 이번 source-fed session evidence를 가리킨다. GPT/Codex repo-native production에는 `null`로 둔다.
- dispatch와 receipt는 production stage가 아니다.
