---
task_id: popular-author-cooking-corpus-study-20260728
execution_runtime: Hermes
profile: author_grape
mode: research_only
owner_hq: v3_firefly_studio
target_repo: v3_ff_foundry
approval_scope: internal_rights_cleared_corpus_study_only
---

# 인기영 요리물 중심 내부 원문 코퍼스 학습 및 감상

## 정정 배경

이전 티켓은 owner의 “인기영 작품”을 “인기 있는 작품”으로 잘못 해석해 공개 웹 메타데이터를 조사했다.

이번 티켓의 `인기영`은 **작가명**이다. Google Drive 정본과 로컬 읽기 전용 캐시에 보유한 권리 확인 원문을 실제로 읽고, 성공 법칙·상업성 패턴·문장과 장면 질감·크로스 장르 접점을 학습한다.

이전 공개 웹 보고서는 인기 근거와 외부 메타데이터 보조자료일 뿐, 본문 관찰을 대신하지 않는다.

## 권리와 원천 권위

- Google Drive 정본: `FF_STUDIO/01_원천_코퍼스/원고들_코퍼스`
- `v3_ff_sources/config/source-rights-clearance.tsv`:
  - `source_rights_clearance_verified=true`
  - `rights_basis=publisher_owned_or_authorized`
  - `rights_scope=internal_analysis_and_derivative_planning`
- 아래 파일은 내부 분석용 읽기 전용 캐시 또는 Drive 로컬 미러다.
- 원문은 수정·이동·복제하지 않는다.
- 보고서에는 장문 원문을 복사하지 않고, 출처 좌표와 짧은 관찰만 쓴다.

## 필수 원문 — 인기영 3작품

### P1

- 작품: `레벨 업! 하는 식당`
- 작가: 인기영
- Drive file id: `1PHIg_wweQ47KaG-kk29oSjGgJOTtXSyf`
- 로컬 캐시:
  `/Users/a2501/Desktop/v3_firefly_studio/.hermes/source-cache/drive/레벨 업! 하는 식당(1~266화)_인기영_합본.txt`
- SHA-256:
  `de47eee671a7e631193289d860c3217c8a03ef0f3477c04bfef32d038e8a9d02`

### P2

- 작품: `이 요리사는 계속 회귀합니다`
- 작가: 인기영
- Drive file id: `1Xkm2J2Biy9Kd5XZyRUdcSXlOM7zSBVkV`
- 로컬 캐시:
  `/Users/a2501/Desktop/v3_firefly_studio/.hermes/source-cache/drive/이 요리사는 계속 회귀합니다_인기영_합본.txt`
- SHA-256:
  `f639372363f86072b9c68c8a334523ddbd983e504d684361c39556835f8b42cc`

### P3

- 작품: `식사하고 가세요!`
- 작가: 인기영
- Drive file id: `1DjSSll3uL-0Bf99ibGUPnY6NSwd-PDSJ`
- 로컬 Drive 미러:
  `/Users/a2501/Documents/Codex/2026-05-22/drive/실물원고_레퍼/02_작가별/인기영/식사하고 가세요!_인기영_합본.txt`
- SHA-256:
  `d85ba55bdcdb6e85c04416f9394149840ab439dff7397541356e9309819e6eec`

## 크로스 장르 대조 원문

### C1

- 작품: `공감의 요리사`
- 작가: 진시월
- 로컬 캐시:
  `/Users/a2501/Desktop/v3_firefly_studio/.hermes/source-cache/drive/공감의 요리사_진시월_합본.txt`
- SHA-256:
  `f182ef11c875443ef43b2bc906cd326de2a7af732aba8132efe1353f791a2044`
- 비교 역할: 요리 × 공감·관계

### C2

- 작품: `가리봉 마왕족발`
- 작가: 디케이
- 로컬 캐시:
  `/Users/a2501/Desktop/v3_firefly_studio/.hermes/source-cache/drive/가리봉 마왕족발_디케이_합본.txt`
- SHA-256:
  `bb17a0f969d5759649f2cdf5cf94a8fa4feba202ed11b9bfe1d822bc2cf1890e`
- 비교 역할: 요리·장사 × 초자연·마왕 소재

## 읽기 전략

합본 전체를 무차별로 한 프롬프트에 싣지 않는다. 셸 도구로 회차 경계를 확인하고 작품별로 다음 표본을 직접 읽는다.

1. 프롤로그와 1~5화
2. 첫 조리·서비스·손님 반응·물질 보상이 닫히는 첫 완결 구간
3. 초반 반복 엔진이 자리 잡은 구간에서 연속 3~5화
4. 중반부 대표 에피소드에서 연속 3~5화
5. 후반부 또는 종결부에서 연속 2~3화

작품당 최소 15화 상당을 읽되, 실제 회차 제목과 범위를 `corpus_source_ledger.tsv`에 기록한다. 회차 경계가 불명확하면 줄 번호 범위와 주변 회차 제목을 함께 남긴다.

인기영 3작품에는 전체 분석 비중의 최소 70%를 쓴다. 크로스 장르 2작품은 차이를 확인하는 대조군이지 인기영 작품을 밀어내는 기준작이 아니다.

## 출력 범위

다음 폴더 안에서만 생성·수정한다.

`/Users/a2501/Desktop/v3_firefly_studio/edge_repos/v3_ff_foundry/20_model_runs/hermes/popular_author_cooking_corpus_study_20260728`

필수 산출물:

1. `corpus_source_ledger.tsv`
2. `cooking_corpus_study_and_reflection.md`
3. `receipt.md`

이 `instruction.md`는 수정하지 않는다.

## corpus_source_ledger.tsv

작품별 읽기 구간마다 한 행으로 다음 열을 포함한다.

- `source_code`
- `work_title`
- `creator`
- `source_path`
- `source_sha256`
- `episode_or_line_scope`
- `sample_role`: `opening | first_payoff | repeat_engine | midseries | late_or_close`
- `observed_functions`
- `texture_notes`
- `limitations`

장문 인용을 넣지 않는다. TSV 셀에 탭이나 줄바꿈을 넣지 않는다.

## cooking_corpus_study_and_reflection.md

한국어로 작성한다.

### 1. 실제 독서 범위

- 다섯 작품의 정확한 읽기 범위
- SHA-256 검증 결과
- 표본이 전체 작품을 대표하지 못하는 한계

### 2. 인기영 작가의 반복 상업 엔진

세 작품에서 공통으로 반복되는 것과 작품별 차이를 분리한다.

- 초반 결핍과 첫 클릭
- 주인공의 직업적 반복 동사
- 능력 증명과 첫 환전
- 음식·조리 과정의 분량과 위치
- 손님 반응을 쾌감으로 바꾸는 순서
- 돈·재료·공간·관계·명성 등 물질 보상
- 실패·비용·제약
- 에피소드 결산과 장기 성장의 연결
- 시스템·회귀·게임 요소가 요리를 밀어내는 순간

### 3. 문장과 장면 질감

실제 원문에서 다음을 관찰한다.

- 문장 길이와 문단 호흡
- 대화와 서술 비중
- 냄새·온도·소리·손동작·식감의 감각 carrier
- 조리 과정에서 생략하는 부분과 확대하는 부분
- 손님 감탄, 주변 증인, 가격·매출·빈 그릇·재방문의 배치
- 장면 전환과 회차 말미의 다음 클릭
- 설명이 길어지는 구간과 속도가 살아나는 구간

문체를 복제하기 위한 문장 패턴집은 만들지 않는다. 기능과 독서 효과를 자신의 말로 정리한다.

### 4. 작품별 감상

다섯 작품 각각에 대해:

- 가장 잘 작동한 구간
- 상업적으로 강한 선택
- 정서적으로 남는 물성
- 반복 피로 또는 약점
- 다른 장르에 옮길 수 있는 기능
- 옮기면 안 되는 고유 표면

### 5. 크로스 장르 비교

- 요리 × 공감·관계
- 요리·장사 × 초자연
- 요리 × 회귀·시스템·게임
- 요리 × 성장·경영

요리가 중심 엔진인지, 다른 장르 장치의 보상 연출로 밀려나는지 판정한다.

### 6. 저승 요리물에 유효한 질문

현재 `afterlife_restaurant`의 캐논·미래 사건을 만들거나 수정하지 않는다. 다음 작동 질문만 원문 관찰에 근거해 정리한다.

- 망자의 마지막 주문에서 요리가 실제 선택을 어떻게 만들 수 있는가
- 손님이 떠난 뒤 가게에 남는 물질·운영·관계 잔여물은 무엇이어야 하는가
- 감동을 초기화하지 않으면서 다음 손님으로 넘어가는 리듬은 무엇인가
- 저승 규칙 설명이 조리와 사람을 밀어내지 않게 하는 방법은 무엇인가
- 돈 대신 어떤 비용과 보상이 독자에게 손에 잡히게 보일 수 있는가

### 7. 추후 뱅크 설계 제안

카드는 만들지 않는다. 다음만 제안한다.

- 후보 `function_axis`
- `cross_genre | genre_pack | work_local` 분기 기준
- 오염·금지 태그
- 카드당 필요한 source coordinate
- 라우터가 한 회차에 허용할 카드 수
- 추가 표본이 필요한 빈 칸

### 8. 자유 감상문

인기영의 요리 작품 세 편을 실제로 읽고 느낀 장르의 맛, 작가가 독자를 붙잡는 방식, 조리와 성공의 결합, 잘되는 순간과 반복의 피로를 자연스러운 비평·감상문으로 쓴다.

표나 체크리스트를 반복하지 않는다. 실제 읽은 장면 구조와 질감에서 출발하되, 장문 인용이나 문체 모사는 하지 않는다.

## 절대 금지

- 원문 수정·이동·삭제·재업로드
- 원문 전문 또는 장문 발췌를 출력 폴더에 복사
- 뱅크 카드, stable ID, genre profile, router 구현
- `30_materials`, `40_works`, 캐논, 원고 수정
- `afterlife_restaurant` 미래 사건·음식·손님·설정 신설
- Notion, Google Drive 파일, Storyyard 수정
- 외부 전송·게시
- Git stage, commit, push, branch 생성
- 읽지 않은 회차를 읽었다고 기록

## 검증

`receipt.md`에 다음을 기록한다.

- 시작·종료 시각
- 입력 파일 경로·크기·SHA-256
- 실제 읽은 구간
- 생성 산출물과 SHA-256
- 허용 폴더 밖 변경 0건
- 시작·종료 Git HEAD와 상태
- 출력 폴더 `git diff --check`
- 남은 불확실성과 owner 검토 지점

완료 후 owner Review로 멈춘다.
