# Daily Five Candidate Automation Runbook

상태: `scheduled`

매일 05:00 KST에 실행한다. 실행 주체는 Codex Desktop `gpt-5.6-terra`, reasoning `medium`이다. 이 규칙은 일일 후보 루틴에만 적용한다.

## 범위

- Market Brief를 먼저 새로 수집하고, 공개 순위 메타데이터·관측 시각·CSV 경로·freshness를 run receipt에 남긴다.
- 당일 신호와 source corpus의 실제 접근 가능 범위를 함께 보고 서로 다른 후보 5개를 고른다.
- 후보별로 source-fed Web Gemini 또는 repo-native GPT/Codex 중 한 생산자를 고르고 ep001 원고 후보를 만든다. Web Gemini 사용분은 **순차** 실행한다.
- 후보별 BR0 blind readback과 producer와 다른 lane의 BR1 plan-aware compare를 완료한다.
- 완결된 후보만 기존 Notion `Opportunity Queue`의 `Review / Kill` 카드 하나로 만든 뒤 다시 읽어 검증한다.

## 불변 경계

- `20_model_runs/<producer>/daily-five-genre/<YYYY-MM-DD>/<genre>/<candidate>/` 밖에 후보 원고를 두지 않는다.
- `40_works/`, Frozen Pitch, 승인 원고, manifest, 공개 상태를 만들거나 변경하지 않는다. `Adopt`는 owner만 연다.
- 카드·대시보드·DB를 새로 만들지 않는다. 기존 `Opportunity Queue` (`collection://79cdb826-5dc0-4a5e-a739-d54c23ea8a57`)의 `Review / Kill` 파이프라인만 찾고 사용한다. 찾지 못하면 해당 후보는 `blocked`다.
- Web Gemini source feed는 원문별 순차 첨부 → 원문별 absorption readback → synthesis readback → `stage packet ready` 순서를 지킨다. GPT/Codex 생산분은 repo-native로 실제 읽은 source·rule SSOT·stage packet 경로를 receipt에 남긴다.
- 슬롯 하나가 막혀도 다른 슬롯의 source bundle·원고·receipt를 재사용하지 않는다.
- 브라우저 탭/세션은 Gemini 원고 후보 하나씩만 연다. 로그인, 첨부, 생성, 저장을 확인한 뒤 다음 후보로 넘어간다.

## 후보별 완료 조건

```text
Market Brief evidence
-> 1 base + 2 supporting source bundle
-> Gemini: per-source absorption readbacks + synthesis readback / GPT: repo-native source-path receipt
-> pitch candidate + minimal Story Plan + ep001 Episode Bet (2–3 render selections)
-> selected producer ep001 raw + dispatch + receipt + sha256
-> BR0 + independent BR1 verdict
-> Notion Review card write + readback
```

한 항목이라도 없으면 `Review`로 올리지 않는다. run root에 `blocked`와 실패 원인을 기록한다.

## 일일 전량 감리

다섯 슬롯을 마지막에 표로 재검사한다. 각 행에 `producer`, `source receipt`, `packet`, `ep001`, `BR0`, `BR1`, `질감 감리`, `Notion readback`, `status`를 기록한다. `Review`는 모든 열이 PASS일 때만 가능하다. `blocked`는 이유와 누락 receipt 경로를 반드시 쓴다.

## 질감 감리

사람말 산문에는 `humanizer` → `avoid-ai-writing` → `deslop`의 detect pass를 적용한다. 수정은 필요할 때만 최소 범위로 하고, 장르의 속도·고유 표면·직업 물성·의도된 반복을 평평하게 만들지 않는다. 이 pass는 BR0/BR1을 대체하지 않으며 AI 탐지기 우회를 목표로 하지 않는다.

완료 보고에는 생성된 Review 카드 수, blocked 수, 각 후보 run root, 감리 verdict만 간결히 남긴다. 원고 본문을 채팅이나 v2 root에 복사하지 않는다.
