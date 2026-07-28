---
work_slug: afterlife_restaurant
assigned_writer: author_cheese
assignment_decision_id: owner-afterlife-author-cheese-assignment-20260728
operation: wgp_arc_pipeline
execution_runtime: Hermes
owner_pipeline_decision_id: owner-afterlife-wgp-five-arc-to-b015-20260728
pipeline_target_range: B001-B015
promotion_mode: supervisor_review
current_review_range: B001-B010
first_design_range: B011-B015
first_review_range: B011-B015
max_design_arcs_per_step: 5
wgp_chat_url: https://chatgpt.com/c/6a656f75-91d0-83ee-9fbb-0b5ffbb3488c
source_packet_path: 40_works/afterlife_restaurant/07_dispatch/b001_b015_wgp_arc_pipeline_source_20260728.md
source_packet_sha256: 247dad22cc32650afa8543f75391ebc28fde4b5406ecc60276676857ea753394
output_root: 20_model_runs/web_gpt_pro/afterlife_restaurant_arc_pipeline_b001_b015_20260728
---

# 저승식당 WGP B001~B015 5-Arc gated pipeline

## 목표

Chrome Beta의 기존 저승식당 WGP 채팅 하나에서 다음 세 단계만 수행한다.

1. 현재 B001~B010 감리
2. 감리 PASS 뒤 B011~B015 다섯 개 설계
3. 설계 완료 뒤 B011~B015 감리

각 단계의 완전한 응답, SHA-256, 동일 채팅 URL, 판정 영수증을 남긴다.
Phase 3가 끝나도 정본 A/B Rail을 수정하지 않고 `Review`로 멈춘다. Codex
슈퍼바이저가 원응답·제안·영수증을 독립 검토한 뒤 별도 정본 반영을 결정한다.

## 브라우저와 동일 세션

- Chrome Beta의 기존 채팅 URL
  `https://chatgpt.com/c/6a656f75-91d0-83ee-9fbb-0b5ffbb3488c`만 사용한다.
- 화면에서 채팅 제목 `저승식당 초반 목적성 논의`와 URL을 함께 확인한다.
- 일반 Chrome은 열거나 포커스·종료·검사하지 않는다.
- 새 채팅, 검색 결과, 유사 제목 대화, 다른 작품 채팅으로 이동하지 않는다.
- 첫 요청 또는 source SHA가 바뀐 재감리 요청에는 현재 SHA의 source packet
  파일 칩이 같은 채팅 composer에 실제로 보이는지 확인한다. supervisor가
  exact source packet을 브라우저 file chooser 경로로 미리 첨부했다면
  `20_model_runs/web_gpt_pro/afterlife_restaurant_arc_pipeline_b001_b015_20260728/supervisor_attachment_receipt.md`
  의 SHA가 현재 source SHA와 일치해야 한다. 정확한 파일명 칩이 하나 보이면
  그대로 사용하고 중복 첨부하지 않는다. 과거 메시지에 붙은 같은 파일명이나
  이전 SHA receipt는 현재 첨부 증거가 아니다.
- 칩이 사라졌을 때만 `파일 등 추가` 메뉴를 연 뒤 `컴퓨터에서 업로드하세요`
  항목을 새 스냅샷에서 찾고, 그 항목에 `mcp__chrome_beta__upload_file`로 정확한
  절대 경로를 전달한다. 바깥의 `파일 등 추가` 버튼 자체를 upload 대상으로
  쓰지 않는다. 네이티브 파일 선택창이나 좌표 추측은 사용하지 않는다.
- WGP가 첨부 본문을 읽었다는 증거로 작품명, 현재 승인 바닥, A01~A02,
  B001~B010 중 세 가지 이상의 구체 사실을 짧게 되읽게 한다. 파일명 반복만
  있으면 Phase 1 판정으로 받아들이지 않는다.
- 각 요청 전송 직후 이 Hermes 턴을 끝내지 않는다. 같은 URL을 5분마다 확인하고
  완전 응답이 나타날 때까지 기다린다.
- 생성 중에는 재촉·추가 메시지·중복 전송·새 채팅 전환을 하지 않는다.
- 로그인, 새 macOS 동의, 암호 화면이 실제로 필요하면 한 번만 `Blocked`로
  멈추고 반복 시도하지 않는다.

## 소스 고정

전송 전에 아래 파일의 SHA-256을 다시 계산한다.

- `40_works/afterlife_restaurant/07_dispatch/b001_b015_wgp_arc_pipeline_source_20260728.md`
- 기대값:
  `247dad22cc32650afa8543f75391ebc28fde4b5406ecc60276676857ea753394`

불일치하면 외부 전송 전에 멈춘다. source packet은 원고 발주가 아니라
owner-approved Story Plan 감리·설계 입력이다.

## Phase 1 — B001~B010 감리

첨부 source packet을 기준으로 다음을 요청한다.

- A01→A02의 실제 전진
- B별 중심 기능·payoff·독자 부채·비용의 구분
- 손님 감정 결산과 운영 잔여물의 이중 엔진
- 각 B의 1~5화 하드 상한과 약 3화 기본 리듬
- 먼 사건을 잠그지 않으면서 `ep250` 방향을 받을 수 있는 장기 용량

치명·중요·경미 문제와 durable field 최소 수정안을 분리하게 한다. 정확한 먼
손님·음식·장면·보상·화수·금액·저승 우주론을 새로 확정하지 않는다. 마지막
줄은 정확히 `ARC_REVIEW_PASS: true|false`다.

완전 응답을 변경 없이 아래에 저장한다.

- `20_model_runs/web_gpt_pro/afterlife_restaurant_arc_pipeline_b001_b015_20260728/phase_01_b001_b010_review/raw_response.md`
- 같은 폴더 `receipt.md`: 응답 SHA-256, 채팅 URL, 확인 시각, readback 증거,
  판정

`ARC_REVIEW_PASS: true`가 아니면 Phase 2를 보내지 않고 `Review`로 멈춘다.

## Phase 2 — B011~B015 설계

Phase 1 PASS 뒤 동일 채팅에 정확히 B011~B015 다섯 개만 요청한다.

각 B는 source packet의 다음 필드를 가진다.

- `b_id`, `target_anchor`, `narrative_function`, `payoff_axis`
- `carried_reader_debt`, `contrast_requirement`, `cost_or_tradeoff`
- `episode_span: 1_to_5`, `default_rhythm: about_3`, `open_values`

B001~B010과 중복되지 않고 A03 이후로 실질 전진해야 한다. 정확한 회차 좌표,
손님, 음식, 장면 해결, 금액, 공주 본명 공개 시점, 저승 우주론은 열린 값으로
남긴다. 마지막 줄은 `ARC_DESIGN_COMPLETE: true|false`다.

산출물:

- `phase_02_b011_b015_design/raw_response.md`: 변경 없는 WGP 응답
- `phase_02_b011_b015_design/proposal.md`: raw에서 durable field만 정규화
- `phase_02_b011_b015_design/receipt.md`: 응답·proposal SHA-256, 동일 채팅 URL,
  정확히 다섯 B인지 판정

완료 marker가 true가 아니거나 B가 정확히 다섯 개가 아니면 Phase 3을 보내지
않고 `Review`로 멈춘다.

## Phase 3 — B011~B015 감리

Phase 2의 raw response와 proposal을 동일 채팅에 제시하고 다음을 감리시킨다.

- 정확히 B011~B015 다섯 개인가.
- A-Rail을 전진시키고 B001~B010과 기능·보상·비용이 중복되지 않는가.
- 각 B가 1~5화 안에 독립 결산 가능한가.
- durable field만 있고 volatile detail을 확정하지 않았는가.
- `ep250` 목표와 B closeout reflow를 방해하지 않는가.
- 교정이 필요하면 전체 재생성 대신 최소 필드 교정안을 주는가.

마지막 줄은 `ARC_REVIEW_PASS: true|false`다. raw response와 receipt를
`phase_03_b011_b015_review/`에 저장한다.

## 슈퍼바이저 인계

Phase 1과 Phase 3가 PASS이고 Phase 2가 정확히 다섯 B를 냈더라도 다음 파일은
이 티켓에서 수정하지 않는다.

- `40_works/afterlife_restaurant/02_story/anchor_rail.md`
- `40_works/afterlife_restaurant/02_story/arc_route_rail.md`
- `40_works/afterlife_restaurant/02_story/rolling_corridor.md`
- `40_works/afterlife_restaurant/08_state/narrative_state.yaml`
- 모든 Episode Bet과 원고

아래 검증만 수행하고 결과를 `Review`로 반환한다.

```bash
python3 tools/validate_wgp_arc_pipeline.py \
  --work afterlife_restaurant \
  --pipeline-root 20_model_runs/web_gpt_pro/afterlife_restaurant_arc_pipeline_b001_b015_20260728 \
  --through-phase 3
git diff --check
```

슈퍼바이저 인계에는 세 phase 경로, 각 SHA-256, 세 marker, 동일 채팅 URL,
열린 값, 정본 반영 시 최소 변경 후보를 포함한다.

## 금지

- B016 이후 설계·감리·발주
- 원고·Episode Bet 생성 또는 수정
- 승인 원고, Narrative State, Rolling Corridor 수정
- Storyyard projection·publish·역동기화
- 새 WGP 채팅, 재촉, 중복 전송
- 정본 A/B Rail 자동 승격
- commit·push
- 사람 owner가 직접 바꾼 파일의 되돌림 또는 덮어쓰기
