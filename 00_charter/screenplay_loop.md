# Firefly Screenplay Loop — workflow authority

상태: **ADOPTED · 2026-07-27**

적용 범위: `45_screenworks/`

소설 제작 규칙은 `anchored_story_loop.md`가 계속 소유한다. 이 문서는 원작 각색과 영상 오리지널의 대본 제작만 소유하며 `40_works/`의 stage·파일·도구 의미를 바꾸지 않는다.

## 한 줄 흐름

```text
Source Binding -> Screen Brief -> Format Bible -> Season Design
-> Episode Promise -> Scene Cards -> Timed Script
-> BR0 -> BR1 -> owner 승인 -> 승인 대본 -> Planning State

[후속 production lane]
승인 대본 -> breakdown -> storyboard -> animatic
-> conform -> owner 최종 영상 승인 -> Screen State
```

v0의 구현·승격 범위는 `승인 대본 -> Planning State`까지다. 후속 production lane은 이 권위 계약을 유지한 채 별도 단계로 확장한다.

## 권위 순서

1. 최종 승인 영상이 존재하면 정확한 영상 파일과 그 전에 닫힌 conformed script/change map이 영상 사실의 최고 권위다.
2. 최종 승인 영상 전에는 owner가 승인한 정확한 episode script revision SHA-256이 해당 episode의 이야기 권위다.
3. Planning State는 승인 대본에서 재생성 가능한 provisional projection이다.
4. Screen State는 최종 승인 영상과 conformed script에서 재생성 가능한 factual projection이다.
5. Scene Cards, Episode Promise, Season Design, Format Bible, Screen Brief는 수정 가능한 미래 제작 전략이다.
6. 원작 소설은 원작 자체의 권위를 유지한다. 각색 레인은 고정한 source revision을 입력으로 쓸 뿐 원작을 덮어쓰지 않는다.

`latest` 파일명·링크·Drive shortcut은 편의 포인터일 뿐 권위가 아니다.

## family와 variant

```text
45_screenworks/<screen_family_slug>/
  00_family/
  variants/<screenwork_id>/
```

- family는 캐릭터·세계·관계·목표의 공통 core와 `concept_asset_id`를 소유한다.
- variant는 format bible, season, episode, script, 승인 이력, `production_asset_id`를 소유한다.
- 가로형·세로형, 등급 차이, 별도 편집판은 화면 순서·사건·관계 의미가 달라지면 별도 screenwork로 fork한다.
- 그림 편집과 이야기 내용이 같고 번역·더빙만 다르면 같은 screenwork의 delivery variant다.
- variant 간 변경은 candidate + impact report + owner 승인으로만 채택한다. 자동 합치기와 평균내기는 금지한다.

## Source Binding

`source_kind`는 다음 둘뿐이다.

- `novel_adaptation`: 원작 revision의 경로 또는 외부 식별자와 SHA-256을 고정한다.
- `screen_original`: 외부 원작 revision 없이 영상 레인에서 시작한다.

각색 착수 뒤 원작이 바뀌어도 자동 추종하지 않는다. 새 원작 revision은 impact report만 만들며 owner가 승인한 `rebase` receipt가 있어야 source binding을 바꾼다. 화면에서 생긴 설정·대사·사건은 소설에 자동 writeback하지 않는다.

## Stage

기계 필드는 `screen_stage`를 쓴다.

```text
none
source_binding
screen_brief
format_bible
season_design
episode_promise
scene_cards
timed_script
review
approved_script
```

소설의 `production_stage` enum을 확장하거나 재사용하지 않는다.

## 장면 순서와 안정 ID

- `episode_id`와 `scene_id`는 불변 식별자다. 표시 화수와 `screen_order`는 바뀔 수 있다.
- 각 장면은 `source_chronology`와 `screen_order`를 따로 가진다.
- 허용 연산은 `move | split | merge | intercut | bridge | omit | none`이다.
- `omit`은 재배열로 위장하지 않는다.
- 장면 이동은 같은 `scene_id`를 유지한다. 수정은 새 script revision을 만든다.
- split은 새 child ID가 parent를 가리키고, merge는 새 ID가 parent들을 가리킨다.
- 제거된 ID는 지우지 않고 `retired`로 남긴다.
- 인과, 인물 지식, 관계, 감정 결과가 달라지면 reorder가 아니라 `story_delta`다.
- 장면 이동은 출발·도착 episode의 기존 승인을 모두 다시 연다.

## 대본 본문과 metadata

- 사람이 읽는 대본 본문은 Fountain이 소유한다.
- 같은 basename의 `.scenes.json`은 scene ID, 순서, 예상 시간, parent, dependency만 소유한다. 대사·행동 본문을 복제하지 않는다.
- 승인 단위는 정확한 episode 전체 Fountain 파일 SHA-256이다. 장면 단위 lock은 제작 증거일 뿐 이야기 권위가 아니다.
- 대본 timecode는 예상 범위다. 실제 녹음 길이, 승인 animatic, 최종 영상 순서로 timing authority가 올라간다.

## BR0 / BR1과 모델 레인

- BR0는 Timed Script와 직전 승인 episode만 읽는 blind readback이다.
- BR1은 봉인된 BR0 뒤에 Screen Brief, Format Bible, Season Design, Episode Promise, Scene Cards와 비교한다.
- producer와 final reviewer의 모델 family는 달라야 한다.
- 후보는 독립 run에 보존하며 최대 2개가 기본값이다. 자동 평균·자동 merge하지 않는다.
- owner 승인 전 어떤 후보도 `08_approved_scripts/manifest.yaml`에 들어가지 않는다.

## 변경 분류와 invalidation

- `production_local`: 카메라·블로킹·SFX·침묵·비의미적 pacing. 제작 승인으로 진행 가능.
- `performance_delta`: 의미가 같은 어미·조사·작은 ad-lib. 최종 승인 전 conform 필수.
- `story_delta`: 사건·정보·관계·감정 결과 변화. 제작을 멈추고 script 승인을 다시 연다.
- 애매하면 더 높은 등급으로 올린다. 작은 변경이 누적되면 story review를 연다.

모든 파생 산출물은 parent path와 SHA-256을 기록한다. upstream이 바뀌면 downstream은 `fresh | stale_review_required | invalid`로 표시한다. 자동 삭제·자동 재작성하지 않는다.

## 승인과 동시성

- owner가 유일한 최종 story authority다.
- director·PD·editor signoff는 production evidence이며 canon이 아니다.
- canonical promotion은 scope별 lease 하나만 허용한다.
- promotion 직전 base revision을 다시 비교한다. 달라졌으면 자동 merge하지 않고 후보를 되돌린다.
- stale lease는 owner 또는 recovery tool만 해제한다.

## 저장과 복구

- Git: 문서, manifest, schema, 작은 preview.
- `gdrive_personal_v0`: 영상, 음원, PSD/AE, animatic 등 큰 binary.
- Drive root folder ID는 `.env`에 두며 repo에 기록하지 않는다.
- manifest는 logical asset ID, Drive file ID, 크기, SHA-256을 기록한다.
- `working/`은 덮어쓸 수 있고 `approved/`는 immutable이다.
- run은 `prepared | uploaded | verified | pending_approval | promoted | failed_recoverable` 상태를 가진다.
- 같은 `run_id`와 hash는 강제 종료 뒤 재개하며 재업로드하지 않는다.
- 자동 삭제와 approved overwrite는 금지한다.

대본 시스템은 라이선스를 심사하거나 production/publish를 법무 이유로 차단하지 않는다. 모델·prompt·첨부·hash는 재현성을 위해 기록할 수 있고, 법무 전달은 별도 adapter의 선택 기능이다.

## 버전과 무영향 계약

- 각 screenwork는 `schema_version`, `workflow_schema`, `template_origin_version`을 고정한다.
- template 변경은 기존 project에 자동 전파하지 않는다.
- migration은 dry-run impact report와 owner 승인 뒤 실행한다.
- 승인 산출물 본문은 migration이 다시 쓰지 않는다.
- 지원하지 않는 schema는 도구가 추측하지 않고 hard-fail한다.
- screenplay 도구는 `40_works/`를 쓰기 대상으로 받으면 hard-fail한다.
- `40_works/_template/`, `tools/draft_relay/`, `anchored_story_loop.md`, 소설 `production_stage` enum은 이 레인 때문에 바뀌지 않는다.
