# Mac mini Hermes handoff — 2026-07-28

## 목적

이 문서는 Mac mini에서 실제 Hermes/Sentinel 환경을 Foundry의 새 작가 운영 계약에 맞추기 위한 인계서다. **원고·아크·Notion 제작 티켓을 실행하는 문서가 아니다.** 이번 작업의 종료점은 실제 설정과 Notion 스키마의 동기화, 그리고 dry-run 검증이다.

## 이미 Git에 반영된 설계

`hq_control`:

- 작가 프로필: `author_cheese`, `author_grape`, `author_yuja`, `author_honeybread`
- 네 프로필 모두 `v3_firefly_studio` / `v3_ff_*` 라우팅
- `genai-reporter`는 별도 보고자이며 Telegram terminal notification은 비활성
- Foundry 티켓은 Markdown 지시서 경로와 SHA-256, 작품/B-Arc/batch/화수/작업종류를 필수로 검증
- `ep001~003` Hermes 차단, `ep005` 이후 WGP continuation receipt 없으면 차단

`v3_ff_foundry`:

- `00_charter/hermes_writer_operations.md`가 작가 운영 정본
- `00_charter/hermes_writer_operations.json`이 기계 판독 배정/batch 레지스트리
- 모든 활성작의 목표는 `ep250`
- B 10개마다 사람 review 후 다음 batch decision이 있어야 진행
- 인간 owner는 언제든 직접 먼저 수정할 수 있으며, 이 gate는 Hermes 자동화만 막음

## 현재 의도된 차단 상태

1. `assignments`는 비어 있다. owner가 담당작과 decision ID를 기록하기 전에는 어떤 작가도 제작 티켓을 실행하면 안 된다.
2. 다음 작품은 250화 경로 최소치인 B 슬롯 50개가 아직 없다.

   - `afterlife_restaurant`: 5
   - `cheongma_restaurant`: 10
   - `isekai_restaurant`: 4
   - `tyrant_restaurant`: 10

   `knights_restaurant`, `romance_fantasy_restaurant`는 51개다.
3. 따라서 이번 Mac mini 작업에서 production ticket, Web GPT Pro 발주, manuscript write, Storyyard publish를 실행하면 안 된다.

## Mac mini에서 할 일

1. `hq_control`과 `v3_ff_foundry`를 각각 최신 commit으로 pull한다. 둘은 독립 Git repo다.
2. 실제 Sentinel config를 새 profile route로 마이그레이션한다. 기존 옛 이름 profile은 ticket 호환 alias로만 남고 새 실행 profile은 네 `author_*` 이름을 쓴다.
3. 실제 Hermes home을 확인한다.

   - `~/.hermes/profiles/author_cheese`
   - `~/.hermes/profiles/author_grape`
   - `~/.hermes/profiles/author_yuja`
   - `~/.hermes/profiles/author_honeybread`
   - `~/.hermes/profiles/genai-reporter`

   기존 profile을 삭제하지 않는다. 새 profile을 안전하게 만들거나 연결한 뒤 각 profile의 Notion 연결과 Codex runtime만 점검한다.
4. Sentinel schema ensure를 실행해 Foundry ticket 속성을 Notion에 추가한다. Telegram 발송은 켜지 않는다.
5. Foundry fixture 또는 dry-run ticket으로 아래를 확인한다.

   - Markdown 지시서 SHA 불일치 차단
   - 빈 배정 차단
   - `ep001~003` 차단
   - `ep005`의 WGP 영수증 누락 차단
   - B011의 사람 batch approval 누락 차단
6. Mac mini 상태/실행 영수증만 남기고 종료한다. production queue는 `Ready`로 만들지 않는다.

## 인간 owner가 나중에 결정할 것

- 6작품의 `work_slug -> author_*` 최초 고정 배정
- 50 B 슬롯 미달 작품의 장기 가설 B-Rail 보강
- 각 작품 첫 Hermes batch의 실제 시작 시점

## 금지

- 인간 owner의 직접 수정이나 직접 집필을 막거나 되돌리지 않는다.
- 배정표를 모델이 임의로 채우지 않는다.
- production manuscript를 만들지 않는다.
- Storyyard로 역동기화하거나 publish하지 않는다.
