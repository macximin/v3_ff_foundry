# BLOCK — 매크로 페이싱 (사이클 + 라우팅)

```yaml
role: 쾌감 사이클을 어떤 단위로 반복해 장편을 안 질리게 끄나   # A=사이클 catalog, B=라우팅
canonical_bank: block_bank.md

raw_observations:                              # 근거 확인 때만
  cl_evidence:                                 # 도메인-순수 분할본 (Claude 라인)
    seooh: evidence/seooh/*.md
    kdh:   evidence/kdh/*.md
  gemini_runs: 없음                            # ⚠ block은 Gemini 미채굴 (CL 라인만)
source_slices: ../qrp/seooh/_campaign/slices/*.txt

id_convention: "BLOCK-NNN — 신규부터. 기존 backfill 보류."
read_order: [block_bank.md, cl_evidence(근거 시), source_slices(원문 시)]
gemini_feed: "README.md §Gemini 핸드오프 — seooh: block_bank + evidence/seooh / kdh: + _synthesis/kdh + evidence/kdh (block은 GEM run 없음)"
```
