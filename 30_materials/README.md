# 30_materials — JIT 재료 + Story Block provenance

창작 재료의 **정제된 색인과 근거**. 작품별 이야기 권위가 아니라 조립표 또는 화별 약속이 필요할 때 꺼내 쓰는 JIT side material이다.

## 도메인 (각 폴더 README 참조)

| 도메인 | 역할(한 줄) | 정본 |
|---|---|---|
| `pitch/` | 진입설계 — 왜 읽나/왜 팔리나 (최상류) | `pitch/pitch_bank.md` 🚧 |
| `qrp/` | 보상 — 무엇으로 쾌감 발생 | `qrp/seooh/qrp_bank.md` |
| `esm/` | 연출 — 그 장면을 어떻게 무대화 | `esm/esm_bank.md` |
| `block/` | 페이싱 패턴 — 어떤 단위로 반복(사이클+라우팅) | `block/block_bank.md` |
| `character/` | 인물 — 주조연 원형·목소리 | `character/character_bank.md` |
| `source_maps/` | Story Block Library — 성공작의 작동 순서·입출력 계약·출처 지도 | `source_maps/README.md` |
| `presets/` | 선택 장르 발주문 — 범용 template에 덧붙이는 opt-in preset | `presets/README.md` |

## 3층 모델 (정본 ≠ 근거 ≠ 원문)

1. **bank (정본·색인, read model)** — `*_bank.md`. 기본 작업은 이것만 읽는다.
2. **evidence (근거 관찰층)** — 근거 확인 때만. **도메인-순수로 분리됨:**
   - 공통(CL 라인): `<domain>/evidence/{seooh,kdh}/*.md` — digest를 도메인별로 분할한 것
   - `esm`·`character`: 추가로 `20_model_runs/gemini/seooh50_{esm,character}_*` (GEM 라인)
   - `block`: CL evidence만 (Gemini 미채굴)
   - `qrp`: `qrp/seooh/raw/` (qrp 전용 멀티레인) — **다른 evidence와 층이 다름**
   - cross-domain 감리·골격·대조 → `_synthesis/{seooh,kdh}/` (정본 아님 — 단 **kdh 핸드오프엔 골격용으로 동봉**, §Gemini 핸드오프)
3. **source (원문)** — `qrp/seooh/_campaign/slices/*.txt`. 원문 앵커 필요할 때만.

## 재료채굴 방법론 (항법 — 정본은 분산, 여기는 색인)

단계가 요구하는 카드를 *승격*하는 일(원문 다먹이기 아님). 8축 정본은 각자 사는 곳에 있다 — 이 표는 색인일 뿐, 규칙 복붙 금지(drift 방지).

| 축 | 정본 위치 |
|---|---|
| (1) 단계별 소스범위 | `_seooh50_mining_brief.md` §1-2 + audit §Step 1 |
| (2) 도메인 추출축·카드 스키마 | 각 `*_bank.md` 머리말 `## 스키마`·`## LLM READ ORDER`(역할 경계) |
| (3) 3층(bank/evidence/source) | 위 §3층 모델 + 각 bank `> 3층:` 줄 |
| (4) chunk 사이즈(ESM 5화·block 10화) | `_seooh50_mining_brief.md` §2 |
| (5) 승격 조건 | audit §Step 4 + 각 도메인 "승격 조건" |
| (6) 쓰기직전 scene_retrieval_pack | `40_works/_template/03_episode_bet/ep000_episode_bet.md` §donor receipt + audit §Step 6 |
| (7) 무브 lookup((K·P·W)→casebook) | `howlib/README.md` §2 — retrieval_pack과 구분되는 별개 레이어 |
| (8) no-fear·모델레인 | `AGENTS.md`→헌장 Core Philosophy·Model Lanes + 위 §범례 |

※ `20_model_runs/codex/material_collection_methodology_audit_20260613` = 위 정본들이 이미 흡수한 근거 사료. SSOT 권위 아님 — 새 METHODOLOGY.md 만들지 않는다.

## 도메인 아닌 것 (헷갈림 방지)

- `<domain>/evidence/{seooh,kdh}/` = 도메인-순수 근거(CL digest 분할). `_synthesis/{seooh,kdh}/` = cross-domain 감리·골격·대조(정본피드 X — **단 kdh 핸드오프엔 골격용 동봉**, §Gemini 핸드오프). 둘 다 통짜 digest(`_seooh50_raw`·`_kdh_raw`)를 분해한 결과 — 원본 통짜는 git history.
- `20_model_runs/` = 채굴 실행 로그와 조립표 실행본(도메인 아님, 이야기 권위 없음). `source_maps/` = 출처 기반 Story Block provenance view.
- `craft/craft_doctrine.md` = ESM/CHARACTER 횡단 **R-code(R1~R30)** 풀 정본(감리·CLI용) · `craft/craft_doctrine_inject.md` = 생산(Web Gemini) 주입본(슬림). evidence가 `R13` 식 인용(§범례). `comparisons/` = 모델간 비교(도메인 아님).
- `_seooh50_mining_brief.md` = Codex 작업지시서(채굴 캠페인).

## 범례 (codes & tags)

evidence·뱅크 전반에서 쓰는 태그·코드 — **단일 정본**. (evidence 각 파일 `> 범례` 줄이 여기를 가리킴)

| 코드 | 뜻 |
|---|---|
| `[CL]` / `[GEM]` | 채굴 라인 Claude / Gemini (합의정제 시 강한 프레이밍+상보 병기, 평균 X) |
| `[장르공통]` | 서오·강동호 양쪽에 있는 장르 공통 문법 |
| `[강동호]` | 강동호 고유(서오엔 없거나 약함) — cross-author 시그니처 |
| `▶직수혈` / `✂분기` | 우리 작품(서도윤·1997 IMF) 적용: 그대로 이식 / 갈라냄 |
| `ⓚN` | 원작 N화 앵커(=인용+화수, 원문 복붙 아님) |
| `R1`~`R30` | 집필 독트린 → 정의=`craft/craft_doctrine.md`(풀본·감리) / 생산주입=`craft_doctrine_inject.md` |
| qrp `A1`·`E4`·`L2`… | QRP 메커니즘 키 (A~L 패밀리: A 베팅·B 인재·C 공작·D 응징·E 거래·…·L 연봉) → `qrp/seooh/qrp_bank.md` |

## Gemini 핸드오프 — 피드 레시피

"이 도메인 재료 Gemini에 줘"의 **최소 클린 첨부셋**. 핵심 비대칭: **seooh=evidence 자기완결도 높음 / kdh=골격·범례 의존 → 더 묶어야 함.**

| 작업 의도 | 첨부 (이 순서) | 비고 |
|---|---|---|
| seooh ESM/CHAR/BLOCK | `<dom>_bank.md` + `<dom>/evidence/seooh/<arc>.md` | 뱅크가 스키마·`[CL]/[GEM]`·우리작 가중치 보유 |
| **kdh(강동호) 도메인** | `<dom>_bank.md` + **`_synthesis/kdh/<arc>.md`** + `<dom>/evidence/kdh/<arc>.md` | synthesis **필수 동봉**(작품 골격·서오 대조축). "피드 X"는 *정본 제외*지 *핸드오프 제외* 아님 |
| QRP | `qrp/seooh/qrp_bank.md` + `qrp/seooh/raw/<arc>_*.md` | raw는 다른 도메인과 다른 층 |
| R-code 나오면 | 생산(Gemini): `craft/craft_doctrine_inject.md` / 감리(Claude): `craft/craft_doctrine.md` 풀본 | 풀본은 감리용, 생산자에게는 슬림 주입본이 더 잘 맞음(체크리스트티 산문 — EP002 2회 검증) |
| 원문 앵커 필요 | + `qrp/seooh/_campaign/slices/<해당>.txt` | 보통 생략 |
| **보통 동봉하지 않는 것** | `_seooh50_mining_brief.md`·`comparisons/`·`_synthesis/_campaign/`·dry_ledger | 실행 로그·작업지시서라 기본 첨부셋 밖 |

> **전 첨부셋 공통:** `README.md`(§범례+§피드레시피) 1장도 함께 동봉 — evidence·뱅크의 태그·R/E코드 정의가 여기 있다(evidence `> 범례` 줄이 이걸 가리킴).
> kdh evidence는 `> 작품 골격` 줄로 빙의/회귀·시드·동력을 인라인 보유(단독 투척 시 안전판).

## 규약

- **ID:** 도메인 접두어 `ESM-/CHAR-/BLOCK-/PITCH-NNN` — 신규 항목부터 부여. qrp는 메커니즘 키(`A1`·`A2`…)가 이미 고정키. 기존 backfill은 보류(다음 정제 때).
- **합의 정제:** 같은 항목 평균 X — 강한 프레이밍 채택 + 상보 각도 병기(`[CL]`/`[GEM]`).
- **evidence reorg 완료(2026-06-12):** 작가단위 통짜 digest → 도메인-순수 `<domain>/evidence/{seooh,kdh}/` 분할, cross-domain 추론은 `_synthesis/`로. `banks/` 물리 통합은 안 함(상대경로 백링크 보존).
