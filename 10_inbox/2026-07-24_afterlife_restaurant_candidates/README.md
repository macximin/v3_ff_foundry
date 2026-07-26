# 저승식당류 내부 원고 후보 입고

## 상태

- intake_date: `2026-07-24`
- authority: `non_canonical_candidate`
- owner_intent: `감리·생산·자료 준비 후 캐노니컬 후보 선별`
- promotion: `not_started`
- owner_approved_manuscript: `none`
- source_repository: `company_preproduction_studio`
- source_commit: `0279b2fe0b003dfe6a4df53461cf87c28d9cf522`
- source_scope: `projects/저승식당류/00_brief`

이 디렉터리는 회사 프리프로덕션 저장소에서 수동 입고한 내부 후보 패킷이다.
여기에 있다는 사실만으로 Frozen Pitch, 작품 정본, 승인 원고가 되지 않는다.

## 후보

| 우선순위 | 후보 | 입고 범위 | 초기 라우팅 |
|---:|---|---|---|
| 1 | 기사식당 | 1~3화, BRIEF, 기획서 | 웹소설 본선 우선 감리 |
| 2 | 저승식당 | 1~3화, Brief | 오리지널 요리 IP 우선 감리 |
| 3 | 천마식당 | 1~3화, 출처 README | 상업성·장기 엔진 감리 |
| 4 | 로판식당 | 1~3화 | 타깃 독자·화자 설득력 감리 |
| 5 | 폭군식당 | 1~3화 | 성인 로맨스 별도 레인 감리 |

공통 요구사항 원문인 `오리지널_요리IP 문의.md`도 함께 보존한다.

## 입고 시 확인된 정리 과제

- `천마식당/README.md`는 원고 파일명을
  `01_1화_죽기_직전에_미각이_돌아왔다.txt`로 적고 있으나 실제 입고 파일은
  `1화.txt`다.
- 같은 README는 1화만 수록됐다고 적고 있으나 현재 패킷에는 1~3화가 있다.
- 이 불일치는 원본 보존을 위해 입고 단계에서 고치지 않았다. 감리 패킷을
  만들 때 provenance receipt에서 해소한다.

## 권위와 다음 단계

현재 파일은 모두 **외부 입고 원고 후보**다. 다음 순서를 거쳐야 한다.

1. 후보별 producer/provenance receipt 확정
2. 원고를 보지 않는 BR0 blind readback 패킷 생성 및 감리
3. 기존 3화를 근거로 Pitch Candidate, Story Plan, 화별 약속을 역복원
4. BR1 plan-aware compare와 질감 감리
5. owner가 `Kill / Revise / Adopt` 결정
6. `Adopt` 후보만 Frozen Pitch 및 `40_works/<work_slug>` 초기화
7. 원고 수정본을 다시 감리한 뒤 owner 승인 시에만 승인 원고로 승격

생산자와 최종 감리자는 같을 수 없다. 이 입고 단계에서는 `40_works`,
manifest, Narrative State, 공개 상태를 만들거나 변경하지 않는다.

## 관련 자료

시각 자료와 시장 조사 파일은 프리프로덕션 저장소에 그대로 둔다. 필요할 때
승인된 자료만 별도 manifest로 가져온다.

- 시각 자료: `company_preproduction_studio/projects/저승식당류/01_visual`
- 시장 조사: `company_preproduction_studio/projects/저승식당류/03_research`

## 무결성

원본과 입고본의 SHA-256은 `SOURCE_SHA256SUMS`로 검증한다.
