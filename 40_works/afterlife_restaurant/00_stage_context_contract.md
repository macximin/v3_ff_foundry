# Stage Context Contract — Anchored Story Loop

모델에는 넓게 먹이되, 실제 발주 패킷은 현재 결정에 필요한 표면만 준다.

## 권위

1. 승인 원고 revision은 read-only history다.
2. 충돌 판정 메모(Canon Note)는 원고 내부 의미 충돌 또는 owner retcon만 다룬다.
3. 상태 스냅샷(Narrative State)은 승인 원고와 적용된 충돌 판정 메모의 해시에서 재생성 가능한 투영이다.
4. Story Plan(작품 척추·A-Rail·B-Rail·Rolling Corridor)은 미래 전략이며 고칠 수 있다. A는 장기 도착점, B는 최대 5화 Arc, Corridor는 현재 작업창이다.

## 현재 owner retcon hard stop

- `owner-afterlife-three-year-return-contract-20260726`이 활성 계획에서 문턱 반응형 생환과 손님당 하루·1,095일 적립을 대체한다.
- 기존 승인 원고 ep001~003과 manifest는 승인 당시의 read-only history로 보존한다.
- 새 후보는 이전 1~3화의 사건과 호흡을 유지하고 삼 년 계약 관련 모순만 국소 수정한다.
- 새 후보가 owner 승격되기 전에는 정식 manuscript manifest나 Storyyard로 투영하지 않는다.

## 현재 내부 캐논 기준

- `06_canon_note/canon_note_003_three_year_return_contract.md`가 오프닝 후보와 활성 Story Plan의 입력 기준이다.
- 후보 원고는 `20_model_runs/internal/afterlife_restaurant_3year_candidate_20260726/`에 있다.
- 저승의 세부 시간 계산과 우주론은 설계하지 않는다.

## 단계별 입력

| 작업 | 필수 입력 | 기본 제외 |
|---|---|---|
| pitch | 시장 약속, 장르, 통과한 조립표(기준 원작 + 선택 Story Block) | 전체 bank, 과거 실패 로그, 선택하지 않은 Source Map |
| story | Frozen Pitch, 필요한 Source Map, 기존 승인 원고가 있으면 BR0 readback | 원고를 지휘하는 거대 설정집 |
| episode_bet | 가까운 A-Anchor, 현재 B, 상태 스냅샷, 직전 승인 원고, JIT material | 먼 B의 구체 사건, 먼 Anchor 상세, full bank |
| manuscript | 화별 약속, 직전 승인 원고, 가까운 A-Anchor/현재 B, 짧은 craft inject | fact dump, full review transcript |
| review BR0 | 원고 후보, 직전 승인 원고 | 화별 약속, 상태 스냅샷, Story Plan |
| review BR1 | BR0 결과 + 화별 약속 + Story Plan + 상태 스냅샷 | 생산자 자기평가를 최종 판정으로 쓰기 |

## 운반 원칙

- 사람-facing 원고에는 YAML, gate 점수, receipt 링크를 섞지 않는다.
- 기본 생산은 작품별 Web GPT Pro 채팅에서 수행한다. 첨부 원문·요청·응답의 동일 대화 여부와 SHA-256 receipt를 남긴다.
- owner가 후보별 병렬 실행을 명시한 경우에만 서로 다른 작품 채팅을 최대 2개까지 병렬로 운용한다. 한 작품의 회차는 정합성을 위해 같은 채팅에서 순차 처리한다.
- owner가 Web Gemini 대체 생산 레인을 고른 경우에는 작품별로 source를 순차 공급하고 absorption receipt를 남긴다.
- producer identity와 reviewer lane을 receipt에 함께 기록한다. 기본 BR0/BR1 감리자는 Codex Desktop `gpt-5.6-terra`이며, GPT/Codex 생산물은 Codex 계열이 아닌 감리 레인 또는 owner에게 넘긴다.
- 같은 실패를 같은 prompt로 반복하지 않는다. 두 번 반복되면 화별 약속, 장기 앵커 또는 owner 질문으로 올라간다.
- 모델-facing 문장은 무엇을 살릴지 긍정문으로 쓴다.
- 구독 surface와 context budget은 큰 run receipt에 남긴다.
