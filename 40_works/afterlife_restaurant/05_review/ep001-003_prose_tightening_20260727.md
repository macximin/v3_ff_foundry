# 저승식당 ep001·ep003 도입부 압축 채택 영수증

```yaml
decision_id: owner-afterlife-ep001-003-prose-tightening-20260727
decision: ADOPT_EXACT_LOCAL_REVISIONS
decided_at: "2026-07-27T13:07:55+09:00"
owner_scope:
  episodes: [ep001, ep003]
  change: prose_tightening
publication: false
storyyard_sync: false
producer: owner_directed_local_revision
reviewer: codex_transport_qc
```

## 채택 범위

- ep001은 공주가 식당에 눌러앉은 사정을 짧은 현재 상태 소개로 압축한 현지 수정본을 채택한다.
- ep003은 공주의 가출·숙식·정체 공개를 짧은 회상으로 압축한 현지 수정본을 채택한다.
- ep002와 ep004의 본문은 변경하지 않는다.
- 이 결정은 원고 정본 갱신과 Git 운송만 승인하며 공개 발행이나 Storyyard 동기화는 포함하지 않는다.

## 승인 원고 무결성

- ep001 SHA-256: `c80913ca46c062e4f63e5b34433c02dea6197ee3cbe50fa52d42b8864a8957d9`
- ep003 SHA-256: `9d2d0f273269e04bf72f875972cdc8a60be1a0f300d016f6f849319c4d54d824`
- revision-set SHA-256: `3e10ea3cb109e7c2066b2f2589764d6bb0de470e9abb2448d1f7e665aa93be24`

## 운송 QA

- 원고 파일과 manifest의 SHA-256 일치를 확인한다.
- Narrative State의 revision-set과 원고별 소스 해시를 같은 값으로 재투영한다.
- Foundry에서 Storyyard로만 투영하며 역방향 동기화하지 않는다.
