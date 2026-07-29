# Research-only study receipt

## Execution

- task_id: `popular-cooking-fiction-study-20260728`
- mode: `research_only`
- profile: `author_grape`
- started_at: `2026-07-28T11:46:51Z`
- ended_at: `2026-07-28T11:53:38Z`
- owner-request recheck completed_at: `2026-07-28T12:02:10Z`
- start_git_head: `020325977603e1f89e9848ccabe2b13d9239c968`
- end_git_head: `020325977603e1f89e9848ccabe2b13d9239c968`

## Created outputs and SHA-256

- `source_ledger.tsv` — `e4097d4849b02ae98686a85a352a9f6c8a0fcef1e78d43fa338c597b840dcba3` (post-recheck)
- `study_and_reflection.md` — `e97752712a73bfd7b0f6ca2b3471f1d228fe45d38b9602e2606901c83589fe5e` (post-recheck)
- `receipt.md` — self-hash is verified after this receipt is written, using `shasum -a 256 receipt.md`; it cannot be embedded in the same immutable file without changing that hash.

## Public-source method and access record

- Browsered public Naver search result pages to locate official platform metadata and the public Joara metrics shown in those results.
- Read public official pages only: Naver Series metadata, Haksan official blog introduction, Naver Webtoon title/episode pages, and the National Folk Museum of Korea encyclopedia entry.
- Actually read an official sample: **Naver Webtoon 《신과함께》 저승편 1화 entire public episode**, without login or payment.
- Owner-request recheck at `2026-07-28T11:58:22Z`: reopened the official Naver Series page for 《신화급 이세계 푸드트럭》. The public page displayed `25화 무료`, and listed episodes 1–3 — `1화 프롤로그`, `2화 폴스테드 성 앞에서의 개시 (1)`, and `3화 폴스테드 성 앞에서의 개시 (2)` — each with a `무료` button. Selected episode 1's official free button while not logged in. It did not open a readable body in this browser.
- The page's own button implementation identifies that free-button path as free-ticket ordering followed by Series viewer launch; the page also directs content reading to the Series app/viewer. This is an access-flow observation, **not** a prose observation. No login, free-ticket acquisition, app installation, payment, subscription, or access-control bypass was attempted.
- Did not read the five webnovel bodies. Their records are labelled `metadata_only` or `official_summary` in `source_ledger.tsv`; the report does not present prose/scene texture as directly read for those works.
- The free-episode listing for 《신화급 이세계 푸드트럭》 improves its metadata/access record only and does not change its `metadata_only` classification.
- No login, payment, subscription, message, comment, post, upload, source download, or non-public/unauthorized text source was used.

## Unavailable materials and limitations

- Official paid or login-gated webnovel body text was not opened.
- Naver Series publicly marks 25 episodes of 《신화급 이세계 푸드트럭》 as free, but the no-login episode-1 button attempt did not open prose. The exact observed blocker is the page's free-ticket → Series viewer/app flow; proceeding would have required a step outside the permitted anonymous browser sample path. Episodes 1–3 therefore remain unread.
- The Munpia page for 《신화급 이세계 푸드트럭》 returned a public security-check screen rather than readable text.
- For three title searches, popularity figures were public Joara values displayed in Naver result metadata at the checked time; they are recorded as time-bound discovery evidence, not live rankings.
- 《신화급 이세계 푸드트럭》 lacked independently verified popularity metrics during this run and is not called a popular work.
- 《세상을 멸망시킨 딸과 요리합니다》 had an official launch introduction but no verified large-scale popularity metric during this run; it is treated only as a new-work comparison sample.

## Recheck outputs and SHA-256

The post-recheck SHA-256 values for `source_ledger.tsv` and `study_and_reflection.md` are recorded above. Final output-folder verification and the terminal-only `receipt.md` self-hash are performed after all three scoped outputs are written; the self-hash cannot be embedded without changing it.

## Verification

- `source_ledger.tsv`: required 11-column header verified; 6 data rows; all required cells non-empty; `metadata_only`, `official_summary`, and `official_sample` access levels present.
- `study_and_reflection.md`: sections 1 through 8 verified present.
- `git diff --check -- 20_model_runs/hermes/popular_cooking_fiction_study_20260728`: no output (pass).
- Untracked-file whitespace checks using `git diff --no-index --check /dev/null` passed for both content outputs created before this receipt.
- Start `git status --short`: `?? 20_model_runs/hermes/`.
- End pre-receipt `git status --short`: `?? 20_model_runs/hermes/`.
- This task did not run stage, commit, push, or branch-creation commands. The original first-pass Git HEAD was `020325977603e1f89e9848ccabe2b13d9239c968`; the final owner-request recheck observed Git HEAD `fa1f6145852a947cd442ce94ccfe0660031d32ab`, so a repository HEAD change occurred during the session but was not made by this task. All writes made by this task were confined to the allowed output folder.
- Final `git status --short --untracked-files=all` also lists five untracked files under the sibling `20_model_runs/hermes/v2_material_bank_inventory_20260728/` folder. The start snapshot collapsed all untracked content to `?? 20_model_runs/hermes/`, so Git cannot prove whether those sibling files predated this run. This run did not read, write, or target them; the allowed-folder assertion is therefore limited to the files acted on by this run and the recorded final Git HEAD. A final post-receipt status and receipt self-hash are reported in the terminal completion verification.

Stopped for owner review.
