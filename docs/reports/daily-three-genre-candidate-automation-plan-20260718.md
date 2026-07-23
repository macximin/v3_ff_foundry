# Daily Five-Genre Candidate Automation — Implementation Plan

상태: `scheduled_implementation`

목적: 매일 서로 다른 장르의 **신작 후보 5개**를 만든다. 각 후보는 피치부터 **ep001 원고 후보**까지의 검토 패킷이며, owner가 Notion에서 `Review / Kill / Adopt`를 판정한다.

이 계획은 자동 생성·저장·감리·Notion 반영까지만 다룬다. Frozen Pitch, `40_works/<slug>`, 승인 원고, 공개는 자동으로 만들거나 바꾸지 않는다.

## 일일 산출물

```text
하루 1회
  └─ Market Brief가 고른 서로 다른 장르/직업물 후보 5개 × ep001
```

장르 슬롯은 배우물·요리물·재벌물 같은 고정 목록도, 고정 원작 세트도 아니다. Market Brief가 그날 공개 메타데이터에서 확인한 수요 신호와 장르 표본 범위를 바탕으로 5개 슬롯을 고른다. 같은 날 다섯 후보는 premise, 주인공 작동 직업, 첫 보상, 첫 무대 중 세 가지 이상이 겹치지 않아야 한다.

## 캐노니컬 경계

```text
source-fed Web Gemini session 또는 repo-native GPT/Codex
  -> 20_model_runs/<producer>/daily-five-genre/<date>/<genre>/<candidate>/
  -> ep001 BR0 / BR1 receipt
  -> Notion Opportunity Queue의 Review / Kill card
  -> owner Review / Kill / Adopt

Adopt only
  -> Frozen Pitch
  -> 40_works/<work_slug>/
  -> canonical production loop
```

`20_model_runs`의 산출물은 원고 후보와 실행 증거다. Story Plan과 Episode Bet은 그 후보를 3화까지 검증하기 위한 stage packet이며, owner 채택 전에는 작품의 미래 전략이나 승인 원고 권위를 얻지 않는다.

## 후보 하나의 필수 실행 순서

1. **장르 슬롯 선정** — 배우물 / 요리물 / 재벌물 중 해당 슬롯의 당일 후보를 하나 정한다.
2. **source bundle 구성** — 기준 원작 1개와 역할이 다른 보강 원작 2개 이상을 선택한다. 후보의 장르·직업·보상 엔진과 가까운 권리 확인 원문을 쓴다.
   - base: 주인공 배경 → 결핍 → 정보격차/특기 → 첫 사용 → 첫 환전 → 첫 무대의 lifecycle.
   - supports: voice, market/professional texture, relationship/human texture, pacing, payoff, long route 중 필요한 역할만 맡긴다.
   - 같은 source가 두 후보의 base가 되지 않는다. 다섯 후보의 support role도 가능한 한 분산한다.
3. **생산자별 source receipt** — Web Gemini는 작품별 순차 첨부, 작품별 absorption readback, 최종 synthesis readback, `stage packet ready`까지 닫는다. GPT/Codex는 repo-native로 실제 읽은 source·rule SSOT·stage packet 경로를 receipt에 남긴다.
4. **candidate packet 조립** — pitch candidate, 최소 Story Plan, ep001 Episode Bet을 만든다. Episode Bet은 2–3개의 `render_selection`을 가진다.
5. **원고 후보 생산** — Web Gemini 또는 GPT/Codex 중 그 후보의 생산자를 하나 고른다. 각 후보의 ep001만 생산하고 raw·dispatch·receipt를 저장한다.
6. **감리** — ep001 BR0 blind readback 뒤 BR1 plan-aware compare를 실행한다. 생산자와 다른 lane이 감리한다.
7. **Notion 반영** — 기존 `Opportunity Queue`의 `Review / Kill` 파이프라인에 후보별 카드 하나를 만들고 재조회한다. 카드에는 ep001 패킷과 모든 receipt 포인터를 둔다.

## 이 루틴의 모델 고정

| 역할 | 모델/레인 |
|---|---|
| 원고 후보 생산 | source-fed Web Gemini 또는 repo-native GPT/Codex |
| Market Brief → 후보 패킷 조립, 파일 운반, receipt 검증, Notion 반영 | Codex Desktop `gpt-5.6-terra`, reasoning `medium` |
| BR0/BR1 감리 | 생산자가 아닌 외부 lane 또는 owner |

이 제한은 **일일 5개 후보 루틴에만** 적용한다. ff_foundry 전체의 동급 생산 풀 정책을 바꾸지 않는다. 이 루틴에서 Codex Desktop은 다른 모델이나 reasoning effort로 바꾸지 않는다.

## Market Brief 기반 슬롯 선정

Market Brief는 매일 후보 생성 전에 다음만 확정한다.

- 관측 시각·표본 범위·evidence CSV 경로·freshness.
- 현재 표본에서 강한 기능 신호 3개와, 단일 snapshot이라 추세로 단정할 수 없는 항목.
- 수집면이 충분한 장르/직업 슬롯 후보 5개.
- 각 슬롯의 첫 환전과 피할 중복.

각 슬롯은 source corpus에서 동일하거나 가까운 장르의 base source를 찾을 수 있어야 한다. 공개 랭킹 메타데이터는 상업 신호만 주며, source prose나 장면을 원문 bundle로 삼지 않는다.

## 장르별 후보 계약의 예시

| 슬롯 | 반드시 보여 줄 첫 환전 | 전문/직업 물성 | 피할 중복 |
|---|---|---|---|
| 배우물 | 배역·오디션·현장 선택이 실제 기회/평가/관계 변화로 굳는 순간 | 대본, 콜시트, 카메라, 리허설, 캐스팅 권한, 매니저/제작사 이해관계 | 재벌 투자·사업 인수로 주 보상을 대체하지 않음 |
| 요리물 | 조리 판단이 맛·손님·매출·평판·자리 변화로 환전되는 순간 | 식재료, 손, 불, 주방 동선, 주문표, 원가, 손님/주방 조직 반응 | 단순 레시피 설명이나 심사 칭찬만으로 보상을 끝내지 않음 |
| 재벌물 | 돈·문서·조직 선택이 현금/통제권/관계/적 비용으로 굳는 순간 | 계약, 장부, 계좌, 공장/회사, 협상, 기관과 가족의 이해관계 | 배우/요리 슬롯의 직업 쾌감을 자본 일반론으로 흡수하지 않음 |

이 표는 창작 제한이 아니라 source bundle과 Episode Bet이 서로 다른 상업적 보상을 고르도록 돕는 운영 계약이다.

## Strict mode — 초기 필수 receipt

초기 10일 또는 owner가 완화 결정을 내리기 전까지 후보 하나는 다음이 모두 있어야 `Review` 카드가 된다.

```yaml
candidate_receipt:
  canonical_path:
    source_receipt: PASS
    pitch_candidate: PASS
    story_plan: PASS
    episode_bet: ep001
    raw_candidate: ep001
    br0: PASS
    br1: PASS
  source_bundle:
    base_source: <source id and local path>
    supporting_sources: [<source id, role, local path>]
    per_source_absorption_readbacks: [<path>]
    synthesis_readback: <path>
    producer_evidence: <Gemini chat URL or GPT/Codex repo-native paths>
  outputs:
    run_root: <20_model_runs path>
    episode_raw_path: <path>
    hash: <sha256>
    producer_lane: gemini | gpt
    reviewer_lane: <producer와 다른 lane 또는 human>
  notion:
    card_id: <id>
    card_url: <url>
    status: Review
    readback_verified: true
  promotion:
    owner_approval: pending
    frozen_pitch_created: false
    work_directory_created: false
```

하나라도 누락되면 candidate는 `blocked`다. 원고 후보와 실패 receipt는 `20_model_runs`에 남기되, Notion에서는 Review Queue 카드가 아니라 운영 실패 기록으로만 표시한다.

## Notion 카드 계약

한 후보당 기존 `Opportunity Queue`에 카드 하나만 만든다. 별도 대시보드나 중복 Opportunity 카드, 자동 채택 카드는 만들지 않는다.

- 제목: `<장르> · <후보 제목> · <YYYY-MM-DD>`
- 상태: `Review | Kill | Adopt | Blocked`
- 한 줄 판매 약속과 ep001 독자 효용
- Foundry run root 링크
- source bundle: 각 원문 경로, 역할, synthesis receipt 링크
- ep001 raw/dispatch/BR0/BR1 링크
- 감리 verdict와 reviewer lane
- `Kill`은 후보 종료만 기록한다.
- `Adopt`만 owner 결정 ID와 함께 Frozen Pitch/새 work 초기화 작업을 연다.

자동화는 카드 작성 후 반드시 해당 카드를 다시 읽어 제목·상태·링크·receipt가 실제 반영됐는지 확인한다. readback이 실패하면 후보는 `blocked`로 남기고 Adopt를 열지 않는다.

## 실패 처리

| 실패 | 처리 |
|---|---|
| 생산자별 source receipt 없음 | 그 장르 슬롯 `blocked`; 다른 슬롯을 임의로 재활용하지 않음 |
| source bundle이 3작품 미만 | `blocked`; 원문을 추가로 먹이지 않은 채 발주하지 않음 |
| ep001 BR0/BR1 미완료 | 후보를 `Review`로 올리지 않음 |
| reviewer lane이 producer와 같음 | `blocked` 또는 owner HIL |
| Notion write/readback 실패 | Foundry receipt에 실패 기록, 카드 채택 불가 |
| 다섯 후보가 같은 핵심 무대·직업·첫 보상에 수렴 | 해당 후보만 `revise`; 다른 장르 슬롯 결과를 복제하지 않음 |

## 수용 기준

초기 10일 동안 매일 최대 5개, 총 최대 50개의 Review 후보만 만든다. 각 후보는 source/feed/ep001/감리/Notion readback receipt를 재구성 없이 제시할 수 있어야 한다.

10일 뒤 owner는 다음 중 하나를 결정한다.

1. strict mode 유지
2. 통과한 receipt 항목만 얇게 축소
3. 특정 장르 슬롯의 source bundle 또는 Episode Bet 계약만 수정
4. 자동화 중단

어떤 경우에도 owner `Adopt` 전 자동 canonical promotion은 허용하지 않는다.

## 구현 범위

2026-07-19에 Codex Desktop 자동화로 등록한다. 매일 05:00 KST의 실행은 이 문서와 `docs/runbooks/daily-five-candidate-automation.md`를 함께 계약으로 읽는다. 실제 후보 생산과 Notion 쓰기는 등록 후 첫 실행부터이며, 인증·source feed·감리·Notion readback 중 하나라도 실패한 슬롯은 `blocked` receipt만 남긴다.
