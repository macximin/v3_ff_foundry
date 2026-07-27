# 저승식당 ep001 死者 오탈자 국소 수정 영수증

```yaml
decision_id: owner-afterlife-ep001-deceased-character-typo-20260727
decision: ADOPT_EXACT_LOCAL_REVISION
decided_at: "2026-07-27"
owner_scope:
  episodes: [ep001]
  change: typo_correction
publication: false
storyyard_sync: true
producer: owner_directed_local_revision
reviewer: codex_transport_qc
```

## 수정 범위

- ep001의 `사자(死子)`를 저승사자 문맥에 맞는 `사자(死者)`로만 바로잡는다.
- 문장 구조·의미·사건·다른 회차는 변경하지 않는다.

## 승인 원고 무결성

- ep001 SHA-256: `1217fa881b90d951de0c8169a2d07bdc185b7a17e8b96d8e6e985dd60ce05082`
- revision-set SHA-256: `7c9eae8e21cfea29eeacff4f81aefa2e7412b7163333cfe65b135474c55bfb63`

## 운송 QA

- 변경은 `死子` 한 글자를 `死者` 한 글자로 교체한 1건이다.
- manifest와 Narrative State의 ep001·revision-set 해시를 동일 값으로 재투영한다.
- Foundry에서 Storyyard로만 투영하며 역방향 동기화하지 않는다.
