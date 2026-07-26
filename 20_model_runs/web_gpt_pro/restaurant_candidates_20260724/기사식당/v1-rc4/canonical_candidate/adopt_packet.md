# 기사식당 owner Adopt 판정 패킷

## 현재 권고

**Codex 감리 권고: `ADOPT ALL`**

작품과 `v1-rc4` 원고 1~3화를 함께 채택할 준비가 됐다. 이 권고는 owner의 명시적 선택 전까지 실행되지 않는다.

## 이미 닫힌 항목

| gate | verdict | 근거 |
|---|---|---|
| 입고 원천 무결성 | pass | `SOURCE_SHA256SUMS` 전 항목 일치 |
| 기존 정적 감리 | pass with risks | 판매 표면·장기 엔진 확인, 원천 계획과 원고의 차이 기록 |
| v1-rc3 최종 감리 | 조건부 통과 95% | 납기 산술 P0, 지급·인수 P1, 반복 호흡 P2만 잔존 |
| v1-rc4 ep001 | 보존 | v1-rc3와 바이트 동일 |
| v1-rc4 ep002 | 생산 완료 | 성공 인증 반복만 최소 압축 |
| v1-rc4 ep003 | 생산 완료 | 납기·잔금·인수·현지 재료·창고 귀책 잠금 |
| 독립 BR0 | pass | 치명 산술·계약 오류 없음, 상업 연독성 매우 뛰어남 |
| Pitch / Story Plan 역복원 | candidate | 원고 우선, 미래값은 제안으로 분리 |
| Premise Transaction / Character Court | pass | 보상 실질가치·카일 불가결성·상대 비용 성립 |
| Episode Bet 1~3화 | pass | 실제 원고 사건·수치·관계 변화와 일치 |
| BR1 | pass | plan_closed_loop·표면 이탈·치명 모순 없음 |
| owner approval | pending | 이 문서의 선택 대상 |

## Adopt하면 고정되는 작품 약속

- 카일 하르벤은 제국의 소유물로 살 운명에서 빠져나와 `자기 땅 → 자기 식당 → 자기 규칙 → 자기 계약`을 쌓는다.
- 핵심 대리만족은 거물의 사랑 자체가 아니라, 권력자도 식당에서는 카일의 안전·가격·배식 규칙을 따르는 소유권·독립 경영 역전이다.
- 카일의 우위는 전생 기사식당 경험, 현생 기사·지휘 경험, 원작의 멸망 시한 지식이다. 만능 시스템은 없다.
- 음식은 병을 완치하지 않는다. 몸·노동·계급·신뢰·외교의 문제를 한 끼와 운영으로 부분 해결하고, 그 결과가 손님·현금·길·창고·인력·계약으로 남는다.
- 큰 보상은 반드시 책임을 동반한다. 군납은 상금이 아니라 생산·검수·납기·교육·조달 의무다.
- 제국 멸망까지 3년이라는 장기 압력은 사라지지 않는다. 카일은 제국을 구하려 하지 않지만 하르벤을 생존 가능한 생활권으로 키운다.
- 거물의 관심은 `음식 → 식당의 규칙 → 카일의 태도와 존재` 순서로 이동한다. 첫입 즉시 연애로 가지 않는다.
- 1~3화의 아델린 아크는 기존 계획보다 빠르게 군납과 기반시설 계약까지 도달한 원고 쪽을 채택한다.

## 아직 고정하지 않는 값

- 아델린과 이세라 중 로맨스 메인 축 여부 및 인물 연령
- 4화 이후 정확한 손님·음식·사건 순서
- 옆집 매입과 지방 귀족 굴복의 정확한 화수
- 성녀·마탑주·대상단주의 이름과 음식 연결을 그대로 쓸지 여부
- 250화 정확한 좌표
- 커밋·푸시·Storyyard 반영

## owner 선택지

### `ADOPT ALL`

작품과 `v1-rc4` 원고 1~3화를 함께 승인한다. 승인 뒤에만 `40_works/knights_restaurant`를 만들고 Frozen Pitch, Story Plan, committed Episode Bet, manuscript manifest, Narrative State를 운반한다.

### `ADOPT PLAN ONLY`

작품·Pitch·Story Plan만 승인하고 `v1-rc4` 원고는 후보로 남긴다.

### `REVISE: <좌표>`

지정한 값만 다시 연다. 예: `REVISE: 로맨스 축`, `REVISE: ep003 지급 일정`, `REVISE: 4~10화`.

### `KILL`

승격하지 않는다. 입고·후보·감리 기록은 비정본 이력으로 보존한다.

## 권위 경계

```yaml
work_adopted: false
frozen_pitch: none
work_directory: none
manuscript_v1_rc4_approved: false
manifest_registered: false
narrative_state_created: false
storyyard_synced: false
v1_0_canon: false
commit: none
push: none
```
