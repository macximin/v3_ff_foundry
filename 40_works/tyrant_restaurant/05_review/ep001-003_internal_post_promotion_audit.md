# 폭군식당 ep001~003 내부 승격 감리

```yaml
audit_id: tyrant-restaurant-internal-post-promotion-20260726
scope: owner-approved ep001-ep003, canonical projections, ep004 entry contract
inputs:
  - ../04_manuscript/manifest.yaml
  - ../04_manuscript/ep001_manuscript.md
  - ../04_manuscript/ep002_manuscript.md
  - ../04_manuscript/ep003_manuscript.md
  - ../03_episode_bet/ep001_episode_bet.md
  - ../03_episode_bet/ep002_episode_bet.md
  - ../03_episode_bet/ep003_episode_bet.md
  - ../08_state/narrative_state.yaml
  - ../../../20_model_runs/web_gpt_pro/restaurant_revision_20260726/tyrant_restaurant/br0_v2_review.md
  - ../../../20_model_runs/web_gpt_pro/restaurant_revision_20260726/tyrant_restaurant/br1_v2_review.md
reviewer: codex_desktop
producer: web_gpt_pro
owner_decision: owner-adopt-all-20260726-tyrant-restaurant-v2
```

## Integrity

| check | result |
|---|---|
| manifest entry SHA-256 = canonical snapshot SHA-256 | PASS — ep001 `127ef…54ac`, ep002 `a86b…3e60d`, ep003 `4968…a39d` |
| revision-set recipe | PASS — `abab318a104088bfadcf2f1f9c161eaba1b544b5cc1248569bfe8fa01e8bbb0b` |
| original Phase A output remains preserved | PASS |
| approved/published distinction | PASS — all three are approved; none is published |

## Manuscript-to-canon continuity

| subject | canonical fact through ep003 | result |
|---|---|---|
| protagonist | 강도윤은 황궁 구금형 고용 요리사이며, 자기 이름의 주방을 원한다 | PASS |
| imperial family | 카시안은 황제, 엘레오노라는 황녀이자 그의 딸이다 | PASS |
| northern party | 라우렌츠 발데르는 북부 대공이며 120명 기사단의 식사 시험을 제시한다 | PASS |
| restaurant prize | 수도 서문 밖 황실 소유의 세 번 망한 식당; 성공 뒤 운영권·길드 자격 | PASS |
| test terms | 사흘 식당 시험과 재료·인력 도착 뒤 한 달의 설원뿌리 개발은 분리 | PASS |
| failure cost | 식당 시험 실패는 처형이 아닌 북부행 | PASS |
| supply right | 북부산 설원뿌리 원물의 수도 우선 납품권은 개발 성공·품질·납기 조건부 | PASS |

## Story-plan and state boundary

- A01/B001의 ep004–ep008은 `committed entry`와 `active design`으로만 기록했다. 정확한 ep004 사건·메뉴·인물 추가는 아직 승인 사실이 아니다.
- A02 이후는 모두 `planned`다. Narrative State에는 ep003 이후의 결과를 과거 사실로 투영하지 않았다.
- open reader debt는 120인 사흘 시험, 한 달 개발, 황궁 구금, 비혼 보급 동맹의 비용으로 한정했다.

## Corrected documentation drift

감리 중 원고에는 없고 초기 캐논 초안에만 있던 표기 드리프트를 정정했다.

- `엘레노어` → `엘레오노라`
- `로렌스` → `라우렌츠`
- `황태자 카시안` → `황제 카시안`
- 승격 뒤에도 남아 있던 ‘ep001–ep003 채택 대기’ corridor 문구 제거

원고 스냅샷과 manifest 해시는 변경하지 않았다.

## Verdict

`PASS`

현재 1~3화의 승격을 유지한다. 다음 제작 게이트는 ep004 Episode Bet이다. Git stage/commit/push, 공개 발행, Storyyard sync는 이 감리에 포함되지 않는다.
