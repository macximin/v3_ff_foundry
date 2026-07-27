# 저승식당 ep004 중복 삽입 복구

```yaml
decision_id: owner-afterlife-ep004-duplicate-removal-20260727
decided_at: "2026-07-27"
scope:
  - 04_manuscript/ep004_manuscript.md
source:
  - 20_model_runs/web_gpt_pro/afterlife_restaurant_ep004_generation_20260727/ep004_web_gpt_pro_candidate.md
repair_mode: exact_candidate_body_restore
```

## 원인과 경계

- 기존 정본은 1,173행이었다.
- 5~487행에는 같은 장면의 압축 구버전이 들어 있었다.
- 487행은 `아직 아무것도 모른다는 것이었`에서 미완으로 끊겼다.
- 489행부터 같은 회차가 `가능합니다.`로 다시 시작했다.
- 489~1173행은 보존 후보 685행과 장면표지 2개를 제외하고 일치했다.

## 복구

- 제목 `ⓚ004`를 보존했다.
- 구버전 중복 484행과 미완 경계를 제거했다.
- 보존 후보의 685행 본문을 정확히 복원했다.
- 잘못 바뀐 `---` 2개를 보존 후보의 `***` 2개로 되돌렸다.

## 검증

- 복구 정본: 687행
- 제목과 빈 줄을 제외한 685행은 보존 후보와 차이 0건이다.
- `가능합니다.` 시작: 1회
- `***` 장면표지: 2개
- `---`: 0개
- 미완 문장: 0개
- ep004 SHA-256: `23285a3853e6be3a82961368fbb4e7e2aaec8b0079d9d88eb8af55cbf1fbc0fb`
- revision-set SHA-256: `67b205e5d16835ada592568cd1922c4e85de362b2845b684ea309789454b934b`
