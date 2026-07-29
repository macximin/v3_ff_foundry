# v2 material bank Phase 0 classification report

- Scope: read-only comparison of the two instruction-defined `30_materials` roots.
- Method: one inventory row per file; content was inspected for curated-card families. Raw source slices and large model artifacts were classified from metadata/path with only minimal necessary inspection. `unclear` is used where a pointer or operating premise was not demonstrated.
- This report makes no transfer, adoption, canon, manuscript, or material-bank decision.

## 1. Inventory and Git summary

| system | files | total bytes | tracked | ignored | local_only | Git HEAD |
|---|---:|---:|---:|---:|---:|---|
| v2 | 332 | 14988821 | 332 | 0 | 0 | `a4cbcb57d85da16dc86a645ae286f65a577b963b` |
| v3 | 83 | 500589 | 83 | 0 | 0 | `2c7adbfeb822e026d40ac88e41fd600dadcb9338` |

Classification counts are in `inventory.tsv`; v2 authority classes: {'superseded': 81, 'methodology': 5, 'model_run': 74, 'evidence': 22, 'bank_card': 24, 'raw_source': 126}. v3 authority classes: {'methodology': 20, 'bank_card': 14, 'evidence': 49}.

## 2. Material-family gap

| family | v2 files | v2 bytes | v3 files | v3 bytes |
|---|---:|---:|---:|---:|
| (root) | 2 | 14686 | 1 | 7159 |
| _synthesis | 24 | 171292 | 0 | 0 |
| block | 19 | 73104 | 19 | 73104 |
| character | 20 | 110757 | 20 | 110757 |
| comparisons | 2 | 10633 | 2 | 10633 |
| craft | 7 | 85101 | 7 | 85101 |
| esm | 19 | 142659 | 19 | 142659 |
| howlib | 7 | 167723 | 0 | 0 |
| opening | 1 | 33764 | 0 | 0 |
| pitch | 15 | 291073 | 0 | 0 |
| presets | 2 | 5613 | 2 | 5613 |
| qrp | 200 | 13814009 | 0 | 0 |
| render | 3 | 12432 | 0 | 0 |
| screen_craft | 0 | 0 | 2 | 9588 |
| source_maps | 11 | 55975 | 11 | 55975 |

v3 retains the 79-file core of BLOCK, CHARACTER, ESM, SOURCE MAP, CRAFT, comparison, and preset material (plus two screen-craft files). v2 alone contains the PITCH, QRP, HOWLIB, RENDER, OPENING, and `_synthesis` families; this is an inventory fact, not a recommendation to copy them.

## 3. Duplicate candidates

- Exact SHA-256 matches from v2 to v3: 81.
- Same relative-path candidates from v2 to v3: 81.
- Additional normalized-filename candidates: 71.

The row-level `v3_overlap` field names every detected candidate. Exact v2 matches are classified `superseded`/`ineligible` because an equivalent current v3 material file already exists; no duplicate was moved or altered.

## 4. v3-absent cross-genre candidates requiring owner review

- `render/item_bank.md` — abstract payoff rendered through a concrete object; finance examples are illustrative rather than an operating premise.
- `render/waste_rhythm_bank.md` — human afterbeat/rhythm catalogue; finance examples are illustrative rather than an operating premise.
- `render/voice_dna/seooh.md` — author-specific voice card; review only, never an automatic transferable voice prescription.
- `opening/opening_pattern_canon.md` — source-grounded opening structure; requires Phase 1 provenance and v3-role review.

These are only candidates with a demonstrated curated-card role and no demonstrated modern-finance operating premise. Phase 1 must still resolve provenance, v3 role overlap, and owner selection before any adoption.

## 5. Modern-finance / chaebol bias

v2 rows marked `modern_finance_contamination=yes` by family: {'_synthesis': 11, 'block': 8, 'character': 8, 'comparisons': 1, 'craft': 1, 'esm': 10, 'pitch': 15, 'presets': 1, 'qrp': 193, 'source_maps': 2}. The concentrated families are QRP and PITCH, with finance-specific source maps and modern-finance craft/profile files. Their working engines depend on investment, corporate succession, equity, contracts, banking, or financial-crisis leverage; universal injection risks forcing those premises into unrelated genres. A finance term alone did not set this field: the classification requires an operating finance premise. The four rendering/opening cards listed above were manually re-read and marked `no` because their finance examples do not supply that premise.

## 6. Provenance and rights uncertainty

- `source_rights_status=unclear`: 73 rows across both inventories.
- `raw_or_excerpt`: 188 rows, including source slices and QRP raw/model-output layers; these are not Phase 1 adoption candidates.
- `clear_pointer`: 154 rows where an actual source/provenance pointer was observed.

`unclear` does not assert an absence of rights. It means this Phase 0 inspection did not establish a pointer in the file/path evidence and owner/Phase 1 review is required.

## 7. Current v3 role overlap

The current v3 surface already provides Story Block/Source Map (`source_maps`), Character (`character`), ESM (`esm`), and Craft (`craft`) roles. The exact duplicate rows confirm that v2/v3 overlap in the retained core. v2 QRP, PITCH, HOWLIB, RENDER, OPENING, and synthesis artifacts have no corresponding physical family in v3; their future role must be evaluated against existing Story Block, Source Map, Character, ESM, Craft, and episode-level JIT contracts rather than recreated as a new canonical bank.

## 8. Phase 1 boundary

Potentially hand forward: the 4 conservative v2 `cross_genre_candidate` rows listed in section 4, subject to owner approval and per-item provenance/role review.

Do not hand forward: 304 v2 `ineligible` rows, including raw source slices, raw/model outputs, campaign logs, templates/methodology, and exact v3 duplicates. Finance-dependent `genre_pack` rows also require a separate owner decision; they are not cross-genre candidates.

## 9. Plan gaps / ambiguous criteria

1. The reconciliation plan calls QRP a priority but Phase 0 correctly leaves its finance-dependent cards as `genre_pack`, not an automatic transferable bank.
2. The plan describes source pointers as a Phase 1 requirement but does not name the exact minimum pointer schema or a rights-status authority; Phase 0 therefore preserves `unclear` rather than inferring one.
3. “Similar name” has no prescribed algorithm. This inventory uses normalized filename equality only and labels it as a candidate, not a duplicate finding.
4. The plan identifies current v3 role families but does not prescribe a one-to-one destination for absent v2 families; no destination was invented.
5. Empty placeholders and README/index files are inventory files but not material candidates; they are retained as `methodology` or `superseded` where appropriate.
