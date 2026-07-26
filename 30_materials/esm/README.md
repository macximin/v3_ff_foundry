# ESM — 장면 연출 (scene staging)

```yaml
role: 장면을 사람냄새 나게 어떻게 무대화하나   # QRP=무엇을 보상 / ESM=어떻게 연출
canonical_bank: esm_bank.md                    # 기본 작업은 이것만 읽는다

raw_observations:                              # 근거 확인 때만 연다 (두 층)
  gemini_runs: ../../20_model_runs/gemini/seooh50_esm_*/raw.md   # 5화 청크 채굴
  cl_evidence:                                 # 도메인-순수 분할본 (Claude 라인)
    seooh: evidence/seooh/*.md
    kdh:   evidence/kdh/*.md
source_slices: ../qrp/seooh/_campaign/slices/*.txt              # 원문 백링크, 앵커 필요할 때만

item_tags: "[CL]=Claude 라인 / [GEM]=Gemini 라인 (평균 X, 강한 프레이밍+상보 병기)"
id_convention: "ESM-NNN — 신규 항목부터. 기존은 다음 정제 때 backfill."
read_order: [esm_bank.md, cl_evidence·gem_runs(근거 확인 시), source_slices(원문 앵커 시)]
gemini_feed: "README.md §Gemini 핸드오프 — seooh: esm_bank + evidence/seooh / kdh: + _synthesis/kdh"
```
