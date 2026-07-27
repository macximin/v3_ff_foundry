# Firefly Screenplay Terminology — active vocabulary SSOT

상태: **ADOPTED · 2026-07-27**

적용 범위: `45_screenworks/`

| 사람용 이름 | 기술명·경로 | 뜻 | 권위 |
|---|---|---|---|
| 영상 가족 | Screen Family | format variant가 공유하는 IP core | 공통 제약 |
| 영상 작품 | Screenwork / Variant | 독립 format·편집·대본 권위를 갖는 제작 단위 | 제작 컨테이너 |
| 원천 고정 | Source Binding | 원작 revision과 SHA-256을 고정하거나 screen original임을 선언 | 입력 근거 |
| 대본 브리프 | Screen Brief | 시청자 약속, 형식 목표, 각색 범위 | 수정 가능한 전략 |
| 포맷 바이블 | Format Bible | 화면비, 길이, 화법, 등급, 반복 문법 | variant 제작 계약 |
| 시즌 설계 | Season Design | 시즌 질문, episode route, 결산 지점 | 수정 가능한 전략 |
| 화별 약속 | Episode Promise | 한 episode의 지급·변화·끝 압력 | 현재 episode 계약 |
| 장면 카드 | Scene Cards | 장면 목적, 진입·이탈, 지식·인과, 순서 설계 | 대본 입력 |
| 시간 대본 | Timed Script | 예상 시간 범위를 붙인 Fountain 대본 revision | 승인 전 후보 |
| 장면 metadata | `.scenes.json` | scene ID·순서·시간·dependency만 담는 sidecar | 기계 투영 |
| 승인 대본 | Approved Script | owner가 승인한 정확한 episode Fountain SHA-256 | 최종 영상 전 이야기 권위 |
| 기획 상태 | Planning State | 승인 대본에서 재생성한 provisional state | 파생값 |
| 화면 상태 | Screen State | 최종 승인 영상과 conform에서 재생성한 factual state | 파생값 |
| 맞춤 기록 | Conform / Change Map | 실제 편집·연기 변경을 대본 revision에 되돌려 닫은 기록 | 최종 영상 승인 전 필수 근거 |
| 최종 승인 영상 | Final Approved Video | owner가 승인한 정확한 영상 파일 SHA-256 | 영상 사실 최고 권위 |
| 개념 자산 | `concept_asset_id` | family가 공유하는 캐릭터·장소·소품의 의미 ID | 공통 의미 |
| 제작 자산 | `production_asset_id` | variant별 model sheet·rig·배경·렌더 자산 ID | 제작 사실 |

## 충돌 방지

- `Screen Brief`는 원작 각색뿐 아니라 screen original도 포괄한다. 범용 stage를 Adaptation Brief라 부르지 않는다.
- `source_chronology`와 `screen_order`를 같은 필드로 합치지 않는다.
- `omit`과 `move`를 같은 연산으로 기록하지 않는다.
- `Planning State`를 이미 화면에 일어난 사실로 부르지 않는다.
- 장면 lock, PD signoff, reviewer pass를 owner의 episode 승인과 같은 권위로 부르지 않는다.
- `latest`를 approved revision이나 최종 영상이라고 부르지 않는다.
- 같은 IP라는 이유로 format variant의 screen canon을 자동 공유하지 않는다.
- 대본 레인의 `screen_stage`를 소설 레인의 `production_stage`로 기록하지 않는다.
