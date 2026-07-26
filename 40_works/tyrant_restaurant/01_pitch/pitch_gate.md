# Pitch gate — 폭군식당

## Inputs

- source packet: `10_inbox/2026-07-24_afterlife_restaurant_candidates/source_packet/폭군식당/1화.txt`–`3화.txt`
- Phase A receipts: `20_model_runs/web_gpt_pro/restaurant_revision_20260726/tyrant_restaurant/`
- Phase B build evidence: `.../tyrant_restaurant/phase_b/`

## Checks

- 주인공의 현실 직업과 반복 동사가 명확하다: PASS
- 한 접시의 성과가 사업 자산으로 전환된다: PASS
- 조건부 운영권·길드 자격·공급권의 물질 가치가 설명된다: PASS
- 엘레오노라·라우렌츠·카시안·황궁 제도의 행동 이유가 분리된다: PASS
- 후보 원고와 캐논 원고의 경계가 보존된다: PASS

## Decision

- decision_id: `owner-phase-b-go-20260726-tyrant-restaurant`
- outcome: Frozen Pitch / Story Plan ready
- scope: Phase B 설계 자료만
- subsequent decision: `owner-adopt-all-20260726-tyrant-restaurant-v2` adopted exact ep001–ep003 revisions; see `05_review/ep001-003_adoption_review.md`
