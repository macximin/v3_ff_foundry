# Hermes Writer Operations — canonical contract

상태: **ADOPTED · 2026-07-28**

이 문서는 `v3_ff_foundry` 안에서 작동하는 네 Hermes 작가 프로필의 작품 배정·발주·승인 경계를 정한다. 일반 Foundry 권위 순서와 Anchored Story Loop를 대체하지 않는다.

## 고정 원칙

- 대상은 `작가_치즈`, `작가_포도`, `작가_유자`, `작가_꿀빵` 네 프로필뿐이다.
- 한 프로필은 최대 세 작품만 담당한다.
- 인간 owner는 원고·A/B·배정·우선순위를 먼저 자유롭게 바꾸거나 직접 작업할 수 있다. 사전 티켓, 사전 decision ID, Sentinel 허가를 요구하지 않는다.
- 작품 배정·해제·재배정의 **자동화 반영**은 owner decision ID가 있는 `hermes_writer_operations.json` 변경으로만 가능하다. 프로필·Sentinel·모델이 스스로 담당작을 바꾸지 않는다.
- 인간 변경 뒤 정본·레지스트리가 잠시 어긋나도 인간 작업은 막지 않는다. 다만 Hermes 제작을 재개하기 전에는 현재 상태와 배정을 맞춰야 한다. 배정이 없는 작품은 Hermes 제작 대상이 아니다.
- 모든 활성 원고의 목표는 `ep250` 완결이다.
- 초반 `ep001~ep003`은 사람 전용이다. 인간은 자유롭게 작성·수정할 수 있고, Hermes와 Web GPT Pro 원고 생성 티켓만 발주하지 않는다.

## A-Rail / B-Rail gate

- 인간은 A-Rail/B-Rail 없이도 먼저 생각·작성·수정할 수 있다. 다만 Hermes 제작 티켓은 둘 중 하나라도 없으면 `Blocked`다.
- A-Rail은 시작부터 엔딩까지의 장기 Anchor이며, B-Rail은 Anchor로 가는 1~5화 결산 Arc다. 둘을 블라인드 A/B 비교나 같은 단위로 취급하지 않는다.
- `ep250` 목표에서 B-Rail은 최소 50개 슬롯의 경로 용량을 가져야 한다. 먼 B는 기능·보상축·독자부채·차별점만 가설로 두며 구체 사건을 미리 확정하지 않는다.
- B가 닫힐 때마다 승인 원고와 Narrative State를 갱신하고, A 영향 확인·B closeout·남은 B reflow를 끝낸 뒤 다음 B의 Episode Bet을 연다.

## 10-Batch 사람 승인 경계

- B001~B010, B011~B020처럼 B 10개가 하나의 batch다.
- batch 안의 각 B는 기존 1~5화 상한과 closeout/reflow 규칙을 그대로 따른다.
- 10번째 B가 owner-approved로 닫히면 `10-Arc Human Review.md`를 만들고 상태를 `review_required`로 전환한다.
- owner가 다음 batch의 decision ID를 기록해 `active`로 열기 전에는 다음 batch의 Episode Bet·원고 티켓을 만들거나 실행하지 않는다.
- 이 gate는 먼 10개 B의 구체 사건을 선커밋하는 장치가 아니다. 각 B closeout 뒤 A/B 영향과 현재 Narrative State를 다시 읽는다.

## Web GPT Pro 원고 gate

`Episode Bet -> Web GPT Pro 원고 후보 -> Web GPT Pro 내부감리 PASS -> 독립 BR0/BR1 -> owner 승인 -> manifest + Narrative State`

- Web GPT Pro 내부감리 영수증은 다음 화로 넘어가기 위한 필수 선행 조건이다.
- producer의 내부감리는 BR0/BR1 또는 owner 승인을 대체하지 않는다.
- 다음 화 티켓은 직전 화의 WGP continuation receipt를 Markdown 경로와 SHA-256으로 가리킨다.

## Notion 티켓과 Markdown 지시서

모든 Foundry Hermes 티켓은 아래 메타데이터와 실제 `.md` 지시서를 가져야 한다.

- `Instruction MD path`, `Instruction MD SHA-256`
- `Firefly work slug`, `Firefly B arc`, `Firefly arc batch`, `Firefly episode`, `Firefly operation`
- `WGP continuation receipt` (ep005 이후 필수)

지시서에는 최소한 현재 승인 원고 범위, Narrative State, A/B/Corridor 참조, 금지 사실, 이번 산출물, 검증 조건, 다음 화 진행 조건을 적는다. 경로가 없거나 해시가 다르면 Sentinel은 티켓을 실행하지 않는다. 인간의 직접 변경에는 이 티켓 계약을 적용하지 않으며, 다음 Hermes 티켓을 열기 전에만 정합성을 회복한다.

작가가 처음 읽을 문서는 [`docs/runbooks/hermes-writer-onboarding.md`](../docs/runbooks/hermes-writer-onboarding.md), 실제 발주 양식은 [`docs/runbooks/hermes-writer-ticket-template.md`](../docs/runbooks/hermes-writer-ticket-template.md)다. 온보딩은 말투를 강제하려는 문서가 아니라, 차갑게 지킬 캐노니컬과 따뜻하게 살릴 장면을 구분하게 만드는 작업 기준이다.
