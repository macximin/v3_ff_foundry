# 천마식당 1~3화 통합 감리 dispatch

- status: `dispatched`
- dispatched_at: `2026-07-26T04:10:48Z`
- candidate: `천마식당`
- producer: `Web GPT Pro`
- subscription_lane: `ChatGPT Pro web`
- chat_url: `https://chatgpt.com/c/6a6588b8-3db4-83e8-8422-5742efa78fc3`
- work_only_chat: `true`
- other_chat_touched: `false`
- requested_output: `attachment readback followed by integrated commercial webnovel audit`

## Attached inputs

| Source path | SHA-256 | Confirmed UI chip after upload |
|---|---|---|
| `10_inbox/2026-07-24_afterlife_restaurant_candidates/source_packet/천마식당/1화.txt` | `b12d4cd93511ccfbe6779c0949781630766b222f65d0539163087d43e832cd88` | `1화(7).txt` |
| `10_inbox/2026-07-24_afterlife_restaurant_candidates/source_packet/천마식당/2화.txt` | `7b5a205fabea3028f113f76054d5a993dc65eb85d59dcde0bad56ce5ecb38efd` | `2화(6).txt` |
| `10_inbox/2026-07-24_afterlife_restaurant_candidates/source_packet/천마식당/3화.txt` | `24b79a0075e639939e4f96665a53de7d36895435ab6a4b3e6237175e2328ed71` | `3화(5).txt` |

The browser selected duplicate-safe display names for the chips. The exact
local paths and hashes above identify the files that were uploaded.

## Exact prompt

당신은 한국 유료 연재 상업 웹소설의 선임 편집자다. 이 채팅에 실제 첨부된 1화.txt, 2화.txt, 3화.txt만 원문 권위로 삼아 작품 「천마식당」 1~3화 통합 감리를 수행하라. 기획을 새로 만드는 일이 아니라 현재 원고의 결제 전환, 다음 화 클릭, 초반 이탈 방지 가능성을 진단하는 편집 감리다. 원문에 없는 설정이나 작가 의도를 사실처럼 만들지 말고, 판단은 실제 장면·문장·수치에 근거하라.

먼저 ATTACHMENT READBACK을 출력하라.
1) 현재 읽을 수 있는 첨부 파일명을 3개 모두 정확히 적는다.
2) 각 파일마다 화 제목, 첫 장면의 구체 사건, 마지막 장면의 구체 사건, 그 화에만 있는 고유 디테일 또는 수치 2개를 적는다.
세 파일 중 하나라도 열리지 않거나 내용 확인이 불완전하면 감리를 시작하지 말고 BLOCKED_ATTACHMENT와 누락 파일명을 출력하라. 파일명만 보고 추정해서 읽었다고 하지 마라.

그 다음 INTEGRATED AUDIT을 아래 순서로 작성하라.
1. 총평 및 상업성 판정: PASS / REVISE / BLOCKED 중 하나와 핵심 근거 3개.
2. 1~3화 독자 경험 맵: 각 화별 오프닝 훅, 중반 추진력, 회차 내 보상, 엔딩 클릭 유도, 예상 이탈 지점을 장면 근거와 함께 평가.
3. 훅: 첫 3문단·첫 장면·1화 종료 훅의 강도와 더 빨리 제시할 정보.
4. 가독성: 문장 호흡, 반복 설명, 조리 묘사 밀도, 대사/행동 비율, 모바일 독서 피로. 삭제·압축·재배치 후보를 구체적으로 지목.
5. 회차 보상: 각 화에서 독자가 실제로 받는 능력 시연·관계 변화·수치 성과·새 위협을 구분하고 보상이 늦거나 중복되는 곳을 지적.
6. 주인공 욕망/작동성: 강태윤의 단기 목표, 개인적 욕망, 선택과 비용, 타인의 도움 없이 국면을 바꾸는 행동을 구분. 목표는 있으나 감정 욕망이 흐린지 별도 판정.
7. 장르 약속: 재벌가/경영, 무협 전생·능력, 요리·식당 회생 세 축이 1~3화에서 어떻게 약속되는지, 제목 「천마식당」과 실제 독서 경험이 일치하는지 평가.
8. 이탈 위험: 과도한 만능감, 반복되는 냄새 진단→맞춤 요리→감탄 구조, 긴 조리 공정, 의료·효능 과장, 악역의 평면성, 우연한 바이럴, 설정 설명 지연을 포함하되 실제 원문에 해당하는 것만 치명/높음/중간/낮음과 근거로 판정.
9. 연속성 점검: 사고·부상 상태와 웍 조리 강도, 선천적 미각 상실과 후각/미각 묘사, 전생 기억·내공/염화심법 발현 규칙, 한 달 흑자 조건과 독립 운영권, 메뉴/가격/재료/주문·손님·매출 수치, 직원 역할, 본사 개입, 검은 웍과 아버지 과거를 화별로 대조. 확정 오류와 단순 의문을 분리.
10. 수정 우선순위: P0/P1/P2로 나눠 문제 → 독자 영향 → 최소 수정 방향 → 적용 화/장면 형식. P0는 반드시 고치지 않으면 4화 진입을 해치는 항목만.
11. 화별 수정 브리프: 1화, 2화, 3화 각각 유지할 것 / 자를 것 / 당길 것 / 강화할 것 / 절대 바꾸지 말 것.
12. 최종 작업 지시: 후속 전체 원고 수정 때 지켜야 할 8개 이하의 명확한 편집 원칙. 장르와 인물 장점을 보존하는 최소 수정이어야 하며 바로 원고에 적용 가능하게 쓸 것.

인용은 위치 확인용 짧은 구절만 사용하고 긴 원문 재현은 금지한다. 확신할 수 없는 것은 확인 필요로 표시한다. 칭찬에 분량을 쓰지 말고 가장 큰 상업적 리스크와 수정 우선순위를 먼저 선명하게 제시하라.
