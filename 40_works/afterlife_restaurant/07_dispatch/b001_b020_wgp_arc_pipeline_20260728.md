---
work_slug: afterlife_restaurant
assigned_writer: author_cheese
assignment_decision_id: owner-afterlife-author-cheese-assignment-20260728
operation: wgp_arc_pipeline
execution_runtime: Hermes
producer_lane: web_gpt_pro
owner_pipeline_decision_id: owner-afterlife-wgp-five-arc-gated-route-20260728
current_review_range: B001-B010
first_design_range: B011-B015
first_review_range: B011-B015
second_design_range: B016-B020
second_review_range: B016-B020
max_design_arcs_per_step: 5
wgp_chat_url: https://chatgpt.com/c/6a656f75-91d0-83ee-9fbb-0b5ffbb3488c
source_packet_path: 40_works/afterlife_restaurant/07_dispatch/b001_b020_wgp_arc_pipeline_source_20260728.md
source_packet_sha256: 85f87f14ef3259fc7a2e29c1d1e789239c2ce5268ed1232f206999c36557c7cf
output_root: 20_model_runs/web_gpt_pro/afterlife_restaurant_arc_pipeline_20260728
---

# 저승식당 WGP 5-Arc gated pipeline

## 이번 일

정확한 기존 WGP 채팅에서 현재 B001~B010을 먼저 감리한다. 통과했을 때만
B011~B015를 설계하고 다시 감리하며, 그 감리가 통과했을 때만 B016~B020을
설계하고 다시 감리한다. 각 설계 단계는 최대 다섯 B만 다룬다.

이 작업은 owner가 장거리 A/B Story Plan 가설을 만들도록 승인한 것이다.
B011 이후 원고·Episode Bet·production batch를 여는 승인이 아니다.

## 브라우저와 heartbeat

- Chrome Beta의 기존 채팅 URL
  `https://chatgpt.com/c/6a656f75-91d0-83ee-9fbb-0b5ffbb3488c`만 사용한다.
- 화면에서 채팅 제목 `저승식당 초반 목적성 논의`와 URL을 함께 확인한다.
- 일반 Chrome은 열거나 포커스·종료·검사하지 않는다.
- 새 채팅, 검색 결과, 비슷한 제목의 다른 채팅으로 이동하지 않는다.
- 각 요청을 보낸 직후 이 Hermes 턴을 종료하지 않는다. 같은 URL을 5분마다
  확인하고 완전한 응답이 나타날 때까지 기다린다.
- 생성 중이면 재촉·추가 메시지·중복 전송하지 않는다.
- 정확한 채팅을 확인할 수 없거나 로그인·권한·브라우저 충돌이 생기면
  `Blocked`로 멈춘다. 인증 화면이나 macOS 암호 화면을 열거나 유도하지 않는다.
- 네이티브 파일 선택창을 heartbeat 대기 상태로 남기지 않는다. 이 작업은
  source packet 본문을 메시지에 포함할 수 있으므로 파일 첨부를 필수로 하지 않는다.

## 소스 고정

아래 파일을 로컬에서 읽고 SHA-256을 다시 계산한다.

- `40_works/afterlife_restaurant/07_dispatch/b001_b020_wgp_arc_pipeline_source_20260728.md`
- 기대 SHA-256:
  `85f87f14ef3259fc7a2e29c1d1e789239c2ce5268ed1232f206999c36557c7cf`

불일치하면 외부 전송 전에 멈춘다. WGP에 보낼 때 source packet 본문 전체와
해시를 포함해 이 입력을 기준으로 답하게 한다. 파일명만 반복하는 readback은
통과가 아니다.

## Phase 1 — B001~B010 감리

source packet 전체를 포함해 다음 계약으로 요청한다.

- A01→A02 전진, 각 B의 구분, 감정 결산과 운영 잔여물의 이중 엔진,
  1~5화 가변 cap, 약 3화 기본 리듬, ep250 장기 용량을 감리한다.
- 정확한 먼 화수·손님·음식·장면·금액을 새로 확정하지 않는다.
- 오류는 `치명 / 중요 / 경미`로 나누고 durable field 최소 수정만 제안한다.
- 마지막 줄은 정확히 `ARC_REVIEW_PASS: true|false`로 출력하게 한다.
- true는 “B011~B015 내구 가설 설계로 넘어가도 됨”만 뜻한다.

완전 응답을 변경 없이
`20_model_runs/web_gpt_pro/afterlife_restaurant_arc_pipeline_20260728/phase_01_b001_b010_review/raw_response.md`
에 저장한다. 응답 SHA-256과 채팅 URL, 확인 시각, 판정을 같은 폴더
`receipt.md`에 기록한다.

`ARC_REVIEW_PASS: true`가 없으면 아래 Phase를 전송하지 않고 멈춘다.

## Phase 2 — B011~B015 설계

Phase 1 PASS 뒤에만 같은 채팅에서 요청한다.

- 정확히 B011~B015 다섯 개만 설계한다.
- 각 B는 `target_anchor`, `narrative_function`, `payoff_axis`,
  `carried_reader_debt`, `contrast_requirement`, `cost_or_tradeoff`,
  `open_values`를 가진다.
- exact episode band는 비워 두고 `episode_span: 1_to_5`,
  `default_rhythm: about_3`만 쓴다.
- B001~B010과 중복되지 않고 A03 이후로 실질 전진해야 한다.
- 손님·음식·장면·금액·공주 본명 공개 시점·저승 우주론은 확정하지 않는다.
- 마지막 줄은 `ARC_DESIGN_COMPLETE: true|false`다.

완전 응답은
`phase_02_b011_b015_design/raw_response.md`, 정규화한 내구 제안은
`phase_02_b011_b015_design/proposal.md`, 영수증은
`phase_02_b011_b015_design/receipt.md`에 저장한다.

`ARC_DESIGN_COMPLETE: true`가 없거나 B가 정확히 다섯 개가 아니면 멈춘다.

## Phase 3 — B011~B015 감리

Phase 2의 변경 없는 raw response와 정규화 proposal을 같은 채팅에 다시
제시하고 아래만 감리시킨다.

- B011~B015가 다섯 개를 넘지 않는가.
- A-Rail을 실제로 전진시키고 B001~B010과 기능·보상·비용이 중복되지 않는가.
- durable field만 있고 먼 volatile detail을 고정하지 않았는가.
- ep250 목표와 B closeout reflow를 방해하지 않는가.
- 최소 수정이 필요하면 전체 재생성 대신 필드별 교정안을 준다.
- 마지막 줄은 `ARC_REVIEW_PASS: true|false`다.

raw response와 receipt를 `phase_03_b011_b015_review/`에 저장한다.
true가 아니면 B016~B020 요청을 보내지 않는다.

## Phase 4 — B016~B020 설계

Phase 3 PASS 뒤에만 같은 채팅에서 정확히 B016~B020 다섯 개를 요청한다.
Phase 2와 동일한 durable field, 1~5화 cap, 약 3화 기본 리듬, 열린 값 계약을
적용한다. B001~B015와 중복을 피하고 A03 이후 장기 압력을 확장한다.

raw response, proposal, receipt를 `phase_04_b016_b020_design/`에 저장한다.
마지막 `ARC_DESIGN_COMPLETE: true`와 정확히 다섯 B가 없으면 멈춘다.

## Phase 5 — B016~B020 감리

Phase 4 raw response와 proposal을 같은 채팅에서 Phase 3 기준으로 감리한다.
raw response와 receipt를 `phase_05_b016_b020_review/`에 저장한다.
마지막 `ARC_REVIEW_PASS: true`가 없으면 정본 A/B 파일을 수정하지 않는다.

## 최종 반영

Phase 1, 3, 5가 모두 PASS이고 Phase 2, 4가 정확히 다섯 B를 냈을 때만:

1. `40_works/afterlife_restaurant/02_story/anchor_rail.md`에는 필요한
   broad anchor 보강만 반영한다.
2. `40_works/afterlife_restaurant/02_story/arc_route_rail.md`에 B011~B020을
   durable hypothesis로 추가한다. 기존 B001~B010 ID와 history는 보존한다.
3. `40_works/afterlife_restaurant/02_story/first_twenty_arc_route_extension.md`
   에 각 다섯-아크 설계와 감리 결과, 열린 값, reflow 규칙을 남긴다.
4. `pipeline_receipt.md`에 다섯 phase 경로·응답 SHA·판정·동일 채팅 URL을
   기록한다.
5. `python3 tools/validate_wgp_arc_pipeline.py --work afterlife_restaurant
   --pipeline-root 20_model_runs/web_gpt_pro/afterlife_restaurant_arc_pipeline_20260728`
   와 `git diff --check`를 통과시킨다.
6. 위 파일만 commit·push한다. 캐논 원고, Episode Bet, Narrative State,
   Rolling Corridor, Storyyard는 변경하지 않는다.

## 중단 규칙

- 어느 review든 false/누락이면 이후 요청을 보내지 않는다.
- 어느 design이 다섯 B를 넘거나 덜 내면 이후 요청을 보내지 않는다.
- URL·제목 불일치, source SHA 불일치, WGP 답변 미완료, 브라우저 충돌,
  로그인·권한 요구는 `Blocked`다.
- 사람 owner가 직접 바꾼 기존 파일을 되돌리거나 덮어쓰지 않는다.
- 원고 작성·수정, Episode Bet, Storyyard, publish, 역동기화, 새 production
  티켓 생성은 전부 금지다.
