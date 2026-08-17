# Hermes Writer Operations — canonical contract

상태: **ADOPTED · 2026-07-28**

이 문서는 `v3_ff_foundry` 안에서 작동하는 네 Hermes 작가 프로필의 작품 배정·발주·승인 경계를 정한다. 일반 Foundry 권위 순서와 Anchored Story Loop를 대체하지 않는다.

## 고정 원칙

- 대상은 `author_cheese`, `author_grape`, `author_yuja`, `author_honeybread` 네 프로필뿐이다.
- 한 프로필은 최대 세 작품만 담당한다.
- 인간 owner는 원고·A/B·배정·우선순위를 먼저 자유롭게 바꾸거나 직접 작업할 수 있다. 사전 티켓, 사전 decision ID, Sentinel 허가를 요구하지 않는다.
- 작품 배정·해제·재배정의 **자동화 반영**은 owner decision ID가 있는 `hermes_writer_operations.json` 변경으로만 가능하다. 프로필·Sentinel·모델이 스스로 담당작을 바꾸지 않는다.
- 인간 변경 뒤 정본·레지스트리가 잠시 어긋나도 인간 작업은 막지 않는다. 다만 Hermes 제작을 재개하기 전에는 현재 상태와 배정을 맞춰야 한다. 배정이 없는 작품은 Hermes 제작 대상이 아니다.
- 모든 활성 원고의 목표는 `ep250` 완결이다.
- 초반 `ep001~ep003`은 사람 전용이다. 인간은 자유롭게 작성·수정할 수 있고, Hermes와 Web GPT Pro 원고 생성 티켓만 발주하지 않는다.

## A-Rail / B-Rail gate

- 인간은 A-Rail/B-Rail 없이도 먼저 생각·작성·수정할 수 있다. 다만 Hermes 제작 티켓은 둘 중 하나라도 없으면 `Blocked`다.
- A-Rail은 시작부터 엔딩까지의 장기 Anchor이며, B-Rail은 Anchor로 가는 결산 Arc다. 신작 `webnovel_1_to_3`은 1~3화, profile이 없거나 `legacy_1_to_5`인 기존 작품은 1~5화다. 둘을 블라인드 A/B 비교나 같은 단위로 취급하지 않는다.
- `ep250`은 장기 완결 목표다. 신작 `webnovel_1_to_3`은 먼저 `target_episode / 3`을
  올림한 전체 B-Rail 용량(기본 84개 고유 내구 슬롯)과
  `route_status: route_to_ending_ready`를 갖춰야 한다. 그 위에서 현재
  owner-approved 10-Arc batch가 열려 있어야 Hermes 제작을 시작할 수 있고,
  B010 closeout 전 다음 batch를 사람 review로 보강한다. 전체 route capacity gate와
  현재 batch 승인 gate는 서로 대체하지 않는다. 먼 B는 기능·보상축·독자부채·차별점만
  가설로 두며 구체 사건을 미리 확정하지 않는다.
- B가 닫힐 때마다 승인 원고와 Narrative State를 갱신하고, A 영향 확인·B closeout·남은 B reflow를 끝낸 뒤 다음 B의 Episode Bet을 연다. Episode Bet의 `committed`는 본문 제작 상태이며 Git commit이 아니다. 현재 Arc의 첫 화 하나만 committed하고 같은 Arc의 뒤 최대 2개만 provisional로 준비한다.

## 10-Batch 사람 승인 경계

- B001~B010, B011~B020처럼 B 10개가 하나의 batch다.
- 10개 batch는 이미 준비된 전체 route에서 지금 제작할 범위를 여는 owner gate다. 10개만 채워 전체 엔딩 경로 용량 검사를 대신할 수 없다.
- batch 안의 각 B는 작품 `00_status.md`의 `arc_pacing_profile` 상한과 closeout/reflow 규칙을 그대로 따른다. 알 수 없는 profile이면 Hermes 티켓은 `Blocked`다.
- 10번째 B가 owner-approved로 닫히면 `10-Arc Human Review.md`를 만들고 상태를 `review_required`로 전환한다.
- owner가 다음 batch의 decision ID를 기록해 `active`로 열기 전에는 다음 batch의 Episode Bet·원고 티켓을 만들거나 실행하지 않는다.
- 이 gate는 먼 10개 B의 구체 사건을 선커밋하는 장치가 아니다. 각 B closeout 뒤 A/B 영향과 현재 Narrative State를 다시 읽는다.

## Web GPT Pro 원고 gate

`Episode Bet -> Web GPT Pro 원고 후보 -> Web GPT Pro 내부감리 PASS -> 독립 BR0/BR1 -> owner 승인 -> manifest + Narrative State`

- Web GPT Pro 내부감리 영수증은 다음 화로 넘어가기 위한 필수 선행 조건이다.
- producer의 내부감리는 BR0/BR1 또는 owner 승인을 대체하지 않는다.
- 다음 화 티켓은 직전 화의 WGP continuation receipt를 Markdown 경로와 SHA-256으로 가리킨다.
- production WGP continuation receipt는
  `40_works/_template/05_review/wgp_continuation_receipt.md` 계약을 따른다.
  티켓 작품과 직전 화가 일치하고 `producer: web_gpt_pro`,
  `continuation_authorized: true`, source candidate SHA-256이 모두 있어야
  다음 화 gate 증거가 된다.

### 응답 대기 Sentinel watch

Web GPT Pro가 느릴 때 `Firefly operation=wgp_wait` 티켓은 **Sentinel의
watch-only 대기**다. 이는 Web GPT Pro 발주나 브라우저 자동화가 아니며,
기존 채팅을 열거나 클릭·재촉·중복 발주하지 않는다.

- `WGP dispatch reference`, repo-relative receipt Markdown 경로,
  `WGP response deadline`을 티켓에 기록한다.
- Sentinel은 receipt 부재 동안 `Awaiting response` heartbeat만 갱신한다.
- 도착한 receipt는 로컬 SHA-256과 front matter (`work_slug`, `episode`,
  `producer`, `continuation_authorized`, source candidate SHA)를 검증한다.
- 유효 receipt가 있어도 watch 티켓만 `Done`이 된다. 원고 작성, 캐논 승격,
  Storyyard 동기화·publish, 다음 제작 티켓 생성은 하지 않는다.
- 기한 초과는 `Review`, 잘못된 receipt는 `Blocked`다. 어느 경우에도 자동
  재발주·재촉을 하지 않으며 다음 행동은 인간 owner가 결정한다.

### WGP 5-Arc gated pipeline

`Firefly operation=wgp_arc_pipeline`은 owner가 정확한 작품·채팅·A/B 범위와
출력 경계를 승인한 장거리 Story Plan 전용 Hermes 티켓이다. Sentinel의
watch-only `wgp_wait`와 달리 이 티켓의 Hermes 세션이 Chrome Beta의 동일
WGP 채팅을 끝까지 소유하고, 각 전송 뒤 5분마다 같은 URL을 확인한다.

- 먼저 현재 owner-approved 10-Arc 범위를 감리한다. 명시적 PASS 전에는 다음
  B 설계를 요청하지 않는다.
- 다음 설계는 한 번에 최대 B 다섯 개다. 설계 응답을 보존한 뒤 같은 채팅에서
  별도 감리를 받고, 그 PASS 전에는 다음 다섯 B를 요청하지 않는다.
- 각 단계는 변경 없는 raw response, SHA-256, 채팅 URL, 판정을 receipt로 남긴다.
- 설계 산출물은 durable A/B hypothesis다. 정확한 먼 화수·손님·음식·장면·
  보상·금액·저승 우주론을 확정하지 않으며, B closeout 뒤 reflow한다.
- 이 티켓은 원고·Episode Bet·Narrative State·Rolling Corridor·Storyyard
  변경이나 B011 이후 production batch 개방 권한이 아니다.
- 일반 Chrome, 새 채팅, 검색 결과, 재촉·중복 전송, 인증·잠금 화면 유도는
  금지한다. URL·제목 불일치나 브라우저 권한 문제는 `Blocked`다.

## Hermes owner-selected alternate producer lane

`author_cheese`, `author_grape`, `author_yuja`, `author_honeybread` 중 하나와
`Execution runtime=Hermes`, `Firefly operation=manuscript`를 함께 지정한
티켓은 owner가 **그 티켓 하나에만 선택한 대체 원고 생산 레인**이다.
프로필이나 Sentinel이 기본 생산자를 영구 변경하거나 다음 티켓까지 선택을
이어받지 않는다.

- Hermes가 만든 결과는 `noncanonical candidate`다. owner-approved 원고,
  manifest history, Narrative State 사실, Storyyard 공개본이 아니다.
- Hermes 생산 후보도 Web GPT Pro continuation review를 통과해야 다음 화를
  열 수 있다. WGP receipt는 후보 source SHA-256을 고정하며 생산자 self-review
  또는 Hermes 실행 성공 영수증으로 대체할 수 없다.
- 독립 BR0/BR1, owner의 정확 revision 승인, manuscript manifest 등록,
  Narrative State 재생성 순서를 그대로 거친다.
- owner 승인과 별도 Storyyard gate 전에는 projection·publish할 수 없고,
  Storyyard에서 Foundry로 역동기화하지 않는다.
- 이 대체 레인은 배정, A/B 용량, ep001~003, ep005 이후 WGP receipt,
  10-Batch 사람 승인 gate를 우회하지 않는다.

## Notion 티켓과 Markdown 지시서

모든 Foundry Hermes 티켓은 아래 메타데이터와 실제 `.md` 지시서를 가져야 한다.

- `Instruction MD path`, `Instruction MD SHA-256`
- `Firefly work slug`, `Firefly B arc`, `Firefly arc batch`, `Firefly episode`, `Firefly operation`
- `WGP continuation receipt` (ep005 이후 필수)
- `WGP continuation receipt SHA-256` (ep005 이후 필수)

지시서에는 최소한 현재 승인 원고 범위, Narrative State, A/B/Corridor 참조, 금지 사실, 이번 산출물, 검증 조건, 다음 화 진행 조건을 적는다. 경로가 없거나 해시가 다르면 Sentinel은 티켓을 실행하지 않는다. 인간의 직접 변경에는 이 티켓 계약을 적용하지 않으며, 다음 Hermes 티켓을 열기 전에만 정합성을 회복한다.

작가가 처음 읽을 문서는 [`docs/runbooks/hermes-writer-onboarding.md`](../docs/runbooks/hermes-writer-onboarding.md), 실제 발주 양식은 [`docs/runbooks/hermes-writer-ticket-template.md`](../docs/runbooks/hermes-writer-ticket-template.md)다. 온보딩은 말투를 강제하려는 문서가 아니라, 차갑게 지킬 캐노니컬과 따뜻하게 살릴 장면을 구분하게 만드는 작업 기준이다.
