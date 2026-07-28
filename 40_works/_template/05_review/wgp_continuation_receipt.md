---
schema_version: firefly_wgp_continuation_receipt_v1
work_slug: <work_slug>
episode: ep000
producer: web_gpt_pro
continuation_authorized: false
source_candidate_sha256: <64-lowercase-hex>
reviewed_at: <ISO-8601 timestamp>
---

# Web GPT Pro continuation review receipt

이 영수증은 정확한 원고 후보를 Web GPT Pro가 내부감리한 결과와 다음 화를
열 수 있는지만 기록한다. 원고 본문, BR0/BR1, owner 승인, 캐노니컬 승격을
대체하지 않는다.

## Production positive 조건

- `work_slug`는 다음 티켓의 작품과 같다.
- `episode`는 다음 티켓 직전 화다.
- `producer`는 정확히 `web_gpt_pro`다.
- `continuation_authorized`는 정확히 `true`다.
- `source_candidate_sha256`은 검토한 로컬 후보 파일의 SHA-256이다.
- `reviewed_at`은 timezone을 포함한 ISO-8601 시각이다.

하나라도 다르면 다음 화 티켓은 차단한다. receipt 자체의 repo-relative
Markdown 경로와 SHA-256도 HQ Ticket에 함께 기록한다.

## Internal review summary

- 이번 화를 빼면 다음 화의 쾌감·관계 변화·소유 과정이 달라지는가:
- 주인공의 선택이 보상으로 환전됐는가:
- 직전 승인 원고 사실을 이어받았는가:
- 이번 화를 닫고 다음 압력을 남겼는가:
- blocker:

## 권위 경계

positive receipt도 noncanonical gate evidence다. 독립 BR0/BR1과 owner의
정확 revision 승인 뒤에만 manifest와 Narrative State를 전진한다.
Storyyard projection·publish는 별도 owner gate다.
