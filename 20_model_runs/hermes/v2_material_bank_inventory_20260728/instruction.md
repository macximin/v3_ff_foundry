---
task_id: v2-material-bank-inventory-20260728
execution_runtime: Hermes
profile: author_grape
mode: research_only
owner_hq: v3_firefly_studio
target_repo: v3_ff_foundry
approval_scope: phase_0_inventory_only
---

# v2 재료 뱅크 Phase 0 동결 인벤토리

## 목적

레거시 `ff_studio_v2`의 Foundry 재료와 현재 v3 Foundry 재료를 읽기 전용으로 대조하여, 이후 owner가 재사용 여부를 판단할 수 있는 동결 인벤토리와 분류 보고서를 만든다.

이번 런은 이관·정리·채택·캐논 보강이 아니다. 자료의 존재, 출처 단서, Git 상태, 중복 가능성, 장르 편향만 조사한다.

## 입력 범위

읽기만 허용한다.

1. v2 재료 루트
   - `/Users/a2501/Desktop/ff_studio_v2/edge_repos/ff_foundry/30_materials`
2. v3 재료 루트
   - `/Users/a2501/Desktop/v3_firefly_studio/edge_repos/v3_ff_foundry/30_materials`
3. 기준 계획서
   - `/Users/a2501/Desktop/v3_firefly_studio/edge_repos/v3_ff_foundry/docs/reports/v2-material-bank-reconciliation-plan-20260728.md`
4. Git 추적 여부와 HEAD 확인을 위한 각 Foundry Git 메타데이터

`ff_studio_v2`와 그 edge repo는 레거시 archive다. 어떤 파일도 수정하지 않는다.

## 쓰기 범위

다음 폴더 안의 산출물만 생성·수정할 수 있다.

`/Users/a2501/Desktop/v3_firefly_studio/edge_repos/v3_ff_foundry/20_model_runs/hermes/v2_material_bank_inventory_20260728`

예상 산출물:

- `inventory.tsv`
- `classification_report.md`
- `receipt.md`

이 `instruction.md`는 수정하지 않는다.

## 필수 인벤토리 열

`inventory.tsv`는 한 파일당 한 행으로 작성하고 최소한 다음 열을 포함한다.

- `system`: `v2` 또는 `v3`
- `repo_root`
- `relative_path`
- `material_family`
- `bytes`
- `sha256`
- `git_head`
- `git_state`: `tracked | ignored | local_only`
- `authority_class`: `bank_card | evidence | raw_source | model_run | methodology | superseded`
- `reuse_scope`: `work_local | genre_pack | cross_genre_candidate | ineligible`
- `modern_finance_contamination`: `yes | no | unclear`
- `source_rights_status`: `clear_pointer | missing_pointer | raw_or_excerpt | unclear`
- `v3_overlap`: v3 동일 해시·동일 경로·유사 명칭 후보 또는 `none`
- `notes`

TSV 셀 안에는 탭이나 줄바꿈을 넣지 않는다. 판단 근거가 부족하면 추정하지 말고 `unclear`로 둔다.

## 분류 기준

### authority_class

- `bank_card`: 재사용 가능한 정제 창작 카드
- `evidence`: 카드 판단을 뒷받침하는 관찰·근거
- `raw_source`: 원문·발췌·원자료에 가까운 파일
- `model_run`: 모델 응답·실행 로그·중간 생성물
- `methodology`: 절차·스키마·방법론
- `superseded`: 현재 계약과 중복되거나 낡은 버전

### reuse_scope

- `work_local`: 특정 작품·작가·캠페인 맥락에 묶여 범용 주입하면 안 됨
- `genre_pack`: 특정 장르군에서만 유효한 카드
- `cross_genre_candidate`: 다른 장르에서도 작동 원리가 재사용될 가능성이 있으며 owner 검토 가치가 있음
- `ineligible`: 원문성·권리·중복·오염·불명확성 때문에 재사용 후보가 아님

재벌·현대금융·기업 승계·투자·지분·계약·권력상승 전제에 의존하는 항목은 `modern_finance_contamination=yes`로 표시한다. 단어 출현만으로 단정하지 말고 카드의 작동 전제가 장르를 구속하는지 본다.

## 분석 질문

`classification_report.md`는 다음을 답한다.

1. v2와 v3의 파일 수, 총 용량, Git 추적 상태 요약
2. material family별 v2/v3 격차
3. 동일 SHA-256, 동일 상대경로, 유사 명칭 기준 중복 후보
4. v3에는 없지만 검토 가치가 있는 `cross_genre_candidate`
5. 재벌물·현대금융 편향이 강한 family와 범용화 시 위험
6. 원출처 좌표나 권리 상태가 불명확한 항목
7. 현재 v3 Story Block/Source Map/Character/ESM/Craft와 역할이 겹치는 항목
8. Phase 1로 넘겨도 되는 후보와 넘기면 안 되는 항목
9. 계획서에서 빠졌거나 기준이 모호한 지점

파일명만 보고 내용 판정을 확정하지 않는다. 정제 카드 후보는 본문을 읽고 판단한다. 다만 raw source나 대용량 파일은 해시·메타데이터 중심으로 처리하고, 필요한 최소 범위만 열람한다.

## 절대 금지

- v2 파일 수정·이동·삭제
- v3 `30_materials`, `40_works`, 캐논, 원고, Storyyard 투영 파일 수정
- raw source를 Foundry로 복사
- 카드 이관 또는 stable ID 신설
- 레지스트리·자동화·Sentinel·Notion 수정
- 외부 전송, 브라우저 게시, API 제출
- Git stage, commit, push, branch 생성
- defer 사유의 추정·복원·기록

## 검증과 영수증

작업 전후에 두 Foundry Git root의 HEAD와 상태를 기록한다.

`receipt.md`에는 다음을 남긴다.

- 시작·종료 시각
- 사용한 정확한 입력 루트
- 생성한 산출물 경로와 SHA-256
- v2 시작/종료 HEAD와 `git status --short`
- v3 시작/종료 HEAD와 `git status --short`
- 허용 폴더 밖 변경이 없음을 확인한 결과
- `git diff --check` 결과
- 불확실성 및 owner 검토가 필요한 결정

완료 시 채팅 응답은 산출물 경로, 핵심 집계, 하드스톱 준수 여부만 간결하게 보고한다.
