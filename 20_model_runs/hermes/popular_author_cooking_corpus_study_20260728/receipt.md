# 인기영 요리물 코퍼스 학습 영수증

## 실행 범위와 시각

- task_id: `popular-author-cooking-corpus-study-20260728`
- execution_runtime: Hermes
- profile: `author_grape`
- mode: `research_only`
- 시작: `2026-07-28T12:08:31Z`
- 종료: `2026-07-28T12:16:55Z`
- 허용된 출력 폴더: `20_model_runs/hermes/popular_author_cooking_corpus_study_20260728`
- 원문은 읽기 전용으로만 열람했으며 수정·이동·복제·재업로드하지 않았다.
- Notion, Google Drive 수정, Storyyard, 외부 전송, Git stage/commit/push/branch 작업을 수행하지 않았다.

## 입력 검증

| code | 입력 경로 | 크기(bytes) | SHA-256 | 결과 |
|---|---|---:|---|---|
| P1 | `/Users/a2501/Desktop/v3_firefly_studio/.hermes/source-cache/drive/레벨 업! 하는 식당(1~266화)_인기영_합본.txt` | 4,645,321 | `de47eee671a7e631193289d860c3217c8a03ef0f3477c04bfef32d038e8a9d02` | instruction 값과 일치 |
| P2 | `/Users/a2501/Desktop/v3_firefly_studio/.hermes/source-cache/drive/이 요리사는 계속 회귀합니다_인기영_합본.txt` | 3,123,430 | `f639372363f86072b9c68c8a334523ddbd983e504d684361c39556835f8b42cc` | instruction 값과 일치 |
| P3 | `/Users/a2501/Documents/Codex/2026-05-22/drive/실물원고_레퍼/02_작가별/인기영/식사하고 가세요!_인기영_합본.txt` | 9,767,602 | `d85ba55bdcdb6e85c04416f9394149840ab439dff7397541356e9309819e6eec` | instruction 값과 일치 |
| C1 | `/Users/a2501/Desktop/v3_firefly_studio/.hermes/source-cache/drive/공감의 요리사_진시월_합본.txt` | 2,696,307 | `f182ef11c875443ef43b2bc906cd326de2a7af732aba8132efe1353f791a2044` | instruction 값과 일치 |
| C2 | `/Users/a2501/Desktop/v3_firefly_studio/.hermes/source-cache/drive/가리봉 마왕족발_디케이_합본.txt` | 2,794,373 | `bb17a0f969d5759649f2cdf5cf94a8fa4feba202ed11b9bfe1d822bc2cf1890e` | instruction 값과 일치 |

## 실제 읽기 범위

정확한 제목·줄 좌표·각 구간의 역할은 `corpus_source_ledger.tsv`의 25개 행에 보존했다. 모든 작품에서 `opening`, `first_payoff`, `repeat_engine`, `midseries`, `late_or_close` 다섯 창을 넘겼다.

- P1 《레벨 업! 하는 식당》: 62회차 상당. 프롤로그와 Restaurant 1-2, 8-9·16-22, 31-33·54·67-68, 128-130·150-160, 243-250·261-266·298-320.
- P2 《이 요리사는 계속 회귀합니다》: 16회차 상당. 프롤로그·Dish 1·3, Dish 13·15, Dish 55·65·94, Dish 110·127·169·181, Dish 200·215·223·에필로그.
- P3 《식사하고 가세요!》: 19회차 상당. Board 000·001·004, 013·020, 055·081·123·175, 220·293·400·500, 600·623·638-639·665·667.
- C1 《공감의 요리사》: 15회차 상당. 프롤로그, 1장·4장·6장·9장 표본, 중후반의 국밥·대회·가족 맛·백반집·피날레 표본.
- C2 《가리봉 마왕족발》: 16회차 상당. 프롤로그·제1-2화, 제5·10·22화, 제40·60·80화, 제100·120·140·160화, 제180·200·203화.

인기영 P1-P3에 분석 본문의 주된 비중을 배정했고, C1-C2는 대조군으로만 사용했다. 장문 원문 발췌는 어느 산출물에도 넣지 않았다.

## 생성 산출물

| 파일 | 크기(bytes) | SHA-256 |
|---|---:|---|
| `corpus_source_ledger.tsv` | 14,798 | `0631e61ce28f38d55d995fe6d6954122c04254dd73f01a399713df2dbac41dec` |
| `cooking_corpus_study_and_reflection.md` | 17,638 | `d0111eb84cbb18a1c280768153500b0153887bad35ff703c8d3bdd123000b05d` |
| `receipt.md` | final closeout command에서 별도 SHA-256 검증 | 이 파일은 자기 자신의 해시를 본문에 고정할 수 없으므로 최종 검증 출력으로 확인 |

## 좌표·출력 검증

- TSV 헤더: 요구된 10개 열을 모두 포함.
- TSV 행: 표본 구간 25개, 작품당 5개 역할 행.
- TSV 셀: 탭·줄바꿈을 넣지 않음.
- 작품별 표본 역할: 다섯 작품 모두 `opening | first_payoff | repeat_engine | midseries | late_or_close` 확인.
- `git diff --check -- 20_model_runs/hermes/popular_author_cooking_corpus_study_20260728`: 통과.
- 허용 출력 폴더 밖의 tracked diff: 0건.
- 작업 시작과 종료의 Git HEAD: 모두 `061c50c5246412b2afd9b6e58c067453d99bc636`.
- 시작과 종료의 Git short status: 출력 없음. 기존 출력 폴더에는 `instruction.md`와 `usage.json`이 있었고, 이 작업은 둘을 수정하지 않았다.

## 남은 불확실성과 owner 검토 지점

- 표본은 다섯 창을 충족하지만 각 장편 전체의 모든 회차를 대체하지 않는다. 후반 장기 복선과 누적 설정의 전체 대표성은 제한적이다.
- P1-P3의 시스템·회귀·게임 장치는 음식의 결과를 확장하는 데 강하지만, 후반에도 음식이 실제 갈등 해결을 움직이는지 owner가 별도 표본으로 확인할 필요가 있다.
- 이 결과는 관찰·질문·추후 분류 제안일 뿐, `afterlife_restaurant`의 캐논·미래 사건·음식·손님·설정을 만들거나 수정하지 않는다.

완료 후 owner Review를 기다린다.
