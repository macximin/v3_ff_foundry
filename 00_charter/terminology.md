# Firefly Terminology — active vocabulary SSOT

상태: **ADOPTED · 2026-07-12**

이 문서는 활성 제작 용어의 단일 진실원천이다. 파일명·기계 필드가 영어여도 사람에게는 아래 **사람용 이름**을 먼저 쓴다. `north_star / blueprint / draft / Donor Chain / canonical_stage`는 legacy 기록에서만 읽는다.

## 한 줄 흐름

```text
[재사용·빌드 레인 — 이야기 권위 없음]
원문 정본 -> Story Block -> 조립표 -> Pitch Candidate -> owner 채택

[작품 제작 레인]
Frozen Pitch -> Story Plan -> 화별 약속 -> 원고 후보 -> BR0/BR1 -> owner 승인 -> 승인 원고
                   |              |
                   |              +-- episode loop: 다음 화별 약속으로 복귀
                   +-- 작품 척추 + 장기 앵커 + 근접 3화

[승인 뒤 파생]
승인 원고 -> 상태 스냅샷
충돌 또는 owner retcon -> 충돌 판정 메모
```

## 용어표

| 사람용 이름 | 기술명·경로 | 뜻 | 이야기 권위 |
|---|---|---|---|
| 원문 정본 | Source Truth · `ff_sources` | 참고 원작의 정확한 본문 | 원문에 대해서만 최고 |
| Source Map | `30_materials/source_maps/` | 출처와 Story Block을 담는 provenance 문서 | 재료 근거 |
| Story Block | `block_id` | `entry -> sequence -> exit` 계약을 가진 최소 재사용 단위 | 재료 근거 |
| 기준 원작 | `base_source` | 초반 생애주기 전체를 책임지는 원작 한 편 | 조립 입력 |
| 보강 블록 | `supporting_blocks` | 속도·보상·인간 질감·장기 경로 한 역할만 보강 | 조립 입력 |
| 조립표 | `assembly_recipe.md` | Story Block을 Pitch Candidate로 컴파일하는 build evidence | 이야기 권위 없음 |
| Pitch Candidate | `20_model_runs/.../pitch.md` | owner 채택 전 판매 약속 후보 | 이야기 권위 없음 |
| Frozen Pitch | `40_works/<work>/01_pitch/pitch.md` | owner가 채택해 동결한 판매 약속 | 채택된 미래 약속 |
| Story Plan | `02_story/` | 작품 척추·장기 앵커·근접 3화의 묶음 | 수정 가능한 미래 전략 |
| 작품 척추 | `living_spine.md` | 판매 약속·주인공 엔진·대리만족·엔딩 방향 | 수정 가능한 미래 전략 |
| 장기 앵커 | `anchor_rail.md` | 시작부터 엔딩까지 6~12개 비가역 tentpole | 수정 가능한 미래 전략 |
| 근접 3화 | `rolling_corridor.md` | 현재 1화 committed + 뒤 2화 provisional | 수정 가능한 미래 전략 |
| 화별 약속 | `Episode Bet` | 한 화 안에 지급할 독자 효용·변화·다음 클릭 계약 | 현재 화 제작 계약 |
| Genre Profile | `30_materials/craft/genre_profiles/` | 작품이 opt-in한 장르 가족의 정적 acceptance contract와 feedback router | 이야기 권위 없음 |
| 주인공 가치 전환 단위 | `Core Satisfaction Unit · CSU` | 주인공 행동 또는 이전 선택의 결과가 이번 화의 구체 receipt로 환전되는 한 묶음 | 화별 약속 인스턴스 |
| 외부 가치 신호 | `external value signal` | 가격·호칭·위임·신뢰·공포·보고·대응으로 주인공 가치가 외부에 반영된 증거 | 화별 약속/원고 증거 |
| 장면 준비 메모 | `Scene Forge` | 1화·앵커·실제사건/원문 핵심 장면의 비권위 source receipt와 인과 설계 | 이야기 권위 없음 |
| 원고 후보 | `20_model_runs/.../manuscript_candidate.md` 또는 producer raw | 감리·owner 승인 전 원고 | 이야기 권위 없음 |
| 감리 | BR0 / BR1 | 실제 읽힌 이야기 복원 후 계획과 비교 | 판정 근거 |
| 승인 원고 | owner-approved manuscript revision | 이미 일어난 이야기 | 최고 이야기 권위 |
| 상태 스냅샷 | `Narrative State` | 승인 원고 해시에서 재생성되는 현재 상태 cache | 파생값 |
| 충돌 판정 메모 | `Canon Note` | 원고 내부 의미 충돌 또는 owner retcon | 좁은 판정 권위 |
| 현재 제작 단계 | `production_stage` | 지금 `pitch/story/episode_bet/manuscript/review` 중 어디서 일하는지 | 권위 등급 아님 |

## 충돌 방지

- `Story Block`과 `30_materials/block/`은 다른 개념이다. `30_materials/block/`은 사람에게 **페이싱 패턴**이라고 부른다.
- `Source Map`은 컨테이너, `Story Block`은 호출 단위, 조립표의 `instance`는 특정 작품에 변형 적용한 사용 기록이다.
- `Story Plan`은 stage 하나다. 내부 세 문서는 순서대로 만들 수 있지만 `production_stage: story`는 세 문서가 모두 준비된 뒤에만 성립한다.
- `Genre Profile`은 stage가 아니다. `00_feedback_profile.md`가 선택하고 생산·감리에 조건부로 컴파일한다.
- CSU 정적 정의는 Genre Profile, 아크별 보상·평가 순환은 Story Plan, 이번 화 CSU 값은 Episode Bet, 실제 발생 이력은 Narrative State가 소유한다.
- `상태 스냅샷`과 `충돌 판정 메모`는 선형 제작 단계가 아니다.
- `정본`을 단독으로 쓰지 않는다. 규칙 정본·원문 정본·승인 원고처럼 무엇의 권위인지 붙여 쓴다.
- legacy 파일의 `Donor Chain`, `canonical_stage`, `north_star`, `blueprint`, `draft`는 당시 역사 설명이다. 새 활성 문서와 모델 발주에는 쓰지 않는다.
