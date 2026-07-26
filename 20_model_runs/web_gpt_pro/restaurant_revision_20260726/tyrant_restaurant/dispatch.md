# 폭군식당 PHASE A — Web GPT Pro dispatch

- candidate: `폭군식당`
- candidate_slug: `tyrant_restaurant`
- producer: `Web GPT Pro`
- subscription_lane: `ChatGPT Pro interactive UI`
- context_budget: `thin; three source episodes attached`
- canonical: `false`
- promotion: `not_started`
- chat_url: `https://chatgpt.com/c/6a65887c-4c54-83ee-b701-b15bc8b0d4a6`
- dispatched_at: `2026-07-26T13:08+09:00`

## Source packet

| local file | ChatGPT attachment chip | SHA-256 |
|---|---|---|
| `10_inbox/2026-07-24_afterlife_restaurant_candidates/source_packet/폭군식당/1화.txt` | `1화(8).txt` | `04ee4e5fd50ad222dfa01299f734e9acee4459f01ef9800105bda4277a435d5a` |
| `10_inbox/2026-07-24_afterlife_restaurant_candidates/source_packet/폭군식당/2화.txt` | `2화(7).txt` | `13bfc457c0d3eaf0bdbd9679a05efcf0255b1eb3e049b9c2d5e945dea7a70e37` |
| `10_inbox/2026-07-24_afterlife_restaurant_candidates/source_packet/폭군식당/3화.txt` | `3화(6).txt` | `14676bbd5702ecc800dbcd734183d26dd869b310f973097e11357ef72f678c8e` |

ChatGPT가 같은 이름의 과거 첨부와 구분하려고 chip 이름에 괄호 번호를
붙였지만, 실제 업로드 선택 경로와 원본 SHA-256은 위와 같다. 세 chip은
프롬프트 입력 전과 전송 후 메시지에서 모두 확인했다.

## Dispatch prompt

당신은 한국 상업 웹소설 편집장이다. 이 채팅은 후보작 <폭군식당> 전용이며,
첨부한 1화·2화·3화만 대상으로 PHASE A 통합 감리를 수행한다. 익숙한 장르
형식과 고유한 인물·장소·물건·금액·행동 표면을 상업적 자산으로 보고,
무엇을 살리고 강화할지 중심으로 진단하라.

먼저 세 파일을 실제로 끝까지 읽었음을 다음 형식으로 구체적으로 증명하라.

`[ATTACHMENT READBACK]`

- 1화: 파일에 실제 등장하는 인물명 2개 이상, 핵심 사건 3개, 첫 장면의
  구체 물건/행동 1개, 마지막 장면의 구체 사건 1개
- 2화: 파일에 실제 등장하는 인물명 2개 이상, 핵심 사건 3개, 첫 장면의
  구체 물건/행동 1개, 마지막 장면의 구체 사건 1개
- 3화: 파일에 실제 등장하는 인물명 2개 이상, 핵심 사건 3개, 첫 장면의
  구체 물건/행동 1개, 마지막 장면의 구체 사건 1개

파일 간 내용을 섞지 말고, 모호한 요약 대신 원문에서 확인되는 고유명과
행동을 적어라.

그 다음 `[통합 상업 감리]`를 작성하라. 반드시 아래를 포함한다.

1. 1~3화 전체 훅과 초반 독자 계약
2. 모바일 연재 가독성과 장면 전환/문장 리듬
3. 각 회차의 즉시 보상과 말미 다음화 압력
4. 주인공의 욕망, 선택, 작동성, 삭제 반사실
5. 제목과 장르가 약속한 폭군·식당·권력/경영/요리 쾌감의 실제 이행
6. 회차별 이탈 위험 지점과 이유
7. 인물·정보·시간·공간·행동의 연속성
8. 보존해야 할 강점과 고유 표면
9. 수정 우선순위: P0/P1/P2로 나누고 각 항목에 대상 회차, 문제, 독자
   영향, 수정 방향을 적는다.
10. 1~3화 순차 수정 시 반드시 유지해야 할 연속성 잠금 목록

이번 응답은 감리만 작성한다. 수정 원고는 아직 쓰지 않는다. 한국어로
충분히 구체적으로 작성하라.

## Sequencing lock

통합 감리의 응답 완료, raw 저장, SHA-256 및 receipt 저장이 모두 끝난 뒤에만
같은 채팅에 1화를 다시 첨부한다. 1화 완성본의 저장과 해시가 끝난 뒤 2화,
2화가 끝난 뒤 3화로 간다. 동일 프롬프트 재전송은 하지 않는다.
