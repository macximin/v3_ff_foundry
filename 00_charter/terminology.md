# Firefly Terminology — active vocabulary SSOT

상태: **ADOPTED · 2026-07-12**

개정: **2026-08-09 · 기획서/Arc/원고 사용자 표면, profile별 Arc 상한**

이 문서는 활성 제작 용어의 단일 진실원천이다. 파일명·기계 필드가 영어여도 사람에게는 아래 **사람용 이름**을 먼저 쓴다. `north_star / blueprint / draft / Donor Chain / canonical_stage`는 legacy 기록에서만 읽는다.

## 한 줄 흐름

```text
[재사용·빌드 레인 — 이야기 권위 없음]
원문 정본 -> Story Block -> 조립표 -> Pitch Candidate -> owner 채택

[사용자 표면]
기획서 -> Arc -> 원고

[내부 제작 레인]
Frozen Pitch -> Story Plan -> 화별 약속 -> 원고 후보 -> BR0/BR1 -> owner 승인 -> 승인 원고
                   |              |
                   |              +-- 화별 약속·감리·상태 스냅샷은 sidecar/gate
                   +-- 작품 척추 + A-Rail + B-Rail + Rolling Corridor

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
| 기획서 표면 | `surface_profile: plan_arc_manuscript_v1`의 `plan` | Frozen Pitch·작품 척추·A-Rail을 한 흐름으로 읽는 사용자 표면 | 원본 계약들의 read model |
| Story Plan | `02_story/` | 작품 척추·A-Rail·B-Rail·Rolling Corridor의 묶음 | 수정 가능한 미래 전략 |
| 작품 척추 | `living_spine.md` | 판매 약속·주인공 엔진·대리만족·엔딩 방향 | 수정 가능한 미래 전략 |
| A-Rail | `anchor_rail.md` | 시작부터 엔딩까지 6~12개 비가역 Anchor를 잇는 장기 목적지 철로. B 여러 개를 포함하며 B 자체가 아님 | 수정 가능한 미래 전략 |
| B-Rail | `arc_route_rail.md` | 엔딩까지 이어지는 Story Arc의 순서표. `webnovel_1_to_3`은 1~3화, legacy 호환은 1~5화이며 먼 B는 기능·보상·부채만 가설로 유지 | 수정 가능한 미래 전략 |
| Story Arc(B) | B-Rail의 `b_id` | 중심 질문 하나를 profile 상한 안에 비가역 결산하는 중기 단위 | active B는 현재 제작 계약 |
| Arc 표면 | `surface_profile: plan_arc_manuscript_v1`의 `arc` | active B와 Rolling Corridor를 한 묶음으로 읽고 쓰는 사용자 표면 | Story Plan의 현재 작업 read model |
| Rolling Corridor | `rolling_corridor.md` | B-Rail의 현재 active B와 다음 provisional B, 현재 B 안의 회차 cursor를 비추는 작업창 | 수정 가능한 작업 투영 |
| B 종결 감리 | `05_review/arc_<b_id>_closeout.md` | 승인된 B의 실제 결과를 읽고 A-Rail과 남은 B-Rail을 reflow하는 근거 | 판정 근거 |
| 화별 약속 | `Episode Bet` | 한 화 안에 지급할 독자 효용·변화·다음 클릭 계약. Arc에 붙는 sidecar이며 사용자 권위 계층이 아니다 | 현재 화 제작 계약 |
| Genre Profile | `30_materials/craft/genre_profiles/` | 작품이 opt-in한 장르 가족의 정적 acceptance contract와 feedback router | 이야기 권위 없음 |
| 주인공 가치 전환 단위 | `Core Satisfaction Unit · CSU` | 주인공 행동 또는 이전 선택의 결과가 이번 화의 구체 receipt로 환전되는 한 묶음 | 화별 약속 인스턴스 |
| 외부 가치 신호 | `external value signal` | 가격·호칭·위임·신뢰·공포·보고·대응으로 주인공 가치가 외부에 반영된 증거 | 화별 약속/원고 증거 |
| 장면 준비 메모 | `Scene Forge` | 1화·앵커·실제사건/원문 핵심 장면의 비권위 source receipt와 인과 설계 | 이야기 권위 없음 |
| 원고 후보 | `20_model_runs/.../manuscript_candidate.md` 또는 producer raw | 감리·owner 승인 전 원고 | 이야기 권위 없음 |
| 원고 표면 | `surface_profile: plan_arc_manuscript_v1`의 `manuscript` | 현재 원고 후보와 승인 원고 history를 쓰고 읽는 사용자 표면 | 후보/승인 revision의 권위를 그대로 표시 |
| 감리 | BR0 / BR1 | 실제 읽힌 이야기 복원 후 계획과 비교 | 판정 근거 |
| 승인 원고 | owner-approved manuscript revision | 이미 일어난 이야기 | 최고 이야기 권위 |
| 상태 스냅샷 | `Narrative State` | 승인 원고 해시에서 재생성되는 현재 상태 cache | 파생값 |
| 충돌 판정 메모 | `Canon Note` | 원고 내부 의미 충돌 또는 owner retcon | 좁은 판정 권위 |
| 현재 제작 단계 | `production_stage` | 지금 `pitch/story/episode_bet/manuscript/review` 중 어디서 일하는지 | 권위 등급 아님 |

## 충돌 방지

- `Story Block`과 `30_materials/block/`은 다른 개념이다. `30_materials/block/`은 사람에게 **페이싱 패턴**이라고 부른다.
- `Source Map`은 컨테이너, `Story Block`은 호출 단위, 조립표의 `instance`는 특정 작품에 변형 적용한 사용 기록이다.
- `Story Plan`은 stage 하나다. 내부 네 문서는 순서대로 만들 수 있지만 `production_stage: story`는 `living_spine.md`, `anchor_rail.md`, `arc_route_rail.md`, `rolling_corridor.md`가 모두 준비된 뒤에만 성립한다.
- `A`와 `B`는 블라인드 A/B 원고 비교가 아니라 각각 Anchor Rail과 Arc Route Rail의 제작 식별자다.
- Anchor와 B를 같은 말로 쓰지 않는다. Anchor는 장기 도착점이고, B는 `00_status.md`의 `arc_pacing_profile`이 정한 상한을 넘지 않는 결산 단위다. `webnovel_1_to_3`은 3화, 값 없음 또는 `legacy_1_to_5`는 5화다.
- B가 닫히면 승인 원고와 Narrative State는 보존한다. 먼 B의 내구 필드는 재검증하고, 구체 사건·인물·음식·화수는 자동 승계하지 않고 다시 계산한다.
- `Genre Profile`은 stage가 아니다. `00_feedback_profile.md`가 선택하고 생산·감리에 조건부로 컴파일한다.
- CSU 정적 정의는 Genre Profile, 아크별 보상·평가 순환은 Story Plan, 이번 화 CSU 값은 Episode Bet, 실제 발생 이력은 Narrative State가 소유한다.
- `상태 스냅샷`과 `충돌 판정 메모`는 선형 제작 단계가 아니다.
- 기획서·Arc·원고는 사용자 표면 구분이다. Episode Bet·BR0/BR1·Narrative State·dispatch·receipt는 sidecar/gate이며 별도 상위·하위 권위 계층을 만들지 않는다.
- `정본`을 단독으로 쓰지 않는다. 규칙 정본·원문 정본·승인 원고처럼 무엇의 권위인지 붙여 쓴다.
- legacy 파일의 `Donor Chain`, `canonical_stage`, `north_star`, `blueprint`, `draft`는 당시 역사 설명이다. 새 활성 문서와 모델 발주에는 쓰지 않는다.
