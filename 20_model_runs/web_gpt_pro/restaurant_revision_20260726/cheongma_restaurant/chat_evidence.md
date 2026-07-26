# 천마식당 Web GPT Pro chat evidence

- chat_url: `https://chatgpt.com/c/6a6588b8-3db4-83e8-8422-5742efa78fc3`
- visible_chat_title: `천마식당 감리 요청`
- visible_account_lane: `Pro`
- selected_response_lane: `Pro`
- work_only_chat: `true`
- created_as_new_tab_for_this_work: `true`
- other_existing_chat_opened_or_modified: `false`
- duplicate_prompt_sent: `false`
- answer_now_used: `false`
- response_stop_used: `false`

## Step evidence

| Step | Uploaded source | UI chip after send | Completion evidence | Saved output | SHA-256 |
|---|---|---|---|---|---|
| Integrated audit | exact original 1~3 | `1화(7).txt`, `2화(6).txt`, `3화(5).txt` | stop button absent; concrete three-file readback; 17,198 response chars | `integrated_audit/raw.md` | `afdfb46383abf5115bf5e185af4c37a5eca7e6e5950bc93bb8099deb6eb232cc` |
| Episode 1 revision | exact original `1화.txt` | `1화(11).txt` | stop button absent; 11,497 response chars; title-to-final-order full manuscript | `ep001_revision/ep001.txt` | `4305abcf8dcb3d6573966c22e8e476f46c5aec5a308da98c5917dca55db1149b` |
| Episode 2 revision | exact original `2화.txt` | `2화(10).txt` | stop button absent; 9,533 response chars; title-to-second-fire full manuscript | `ep002_revision/ep002.txt` | `41150f58031faeb615f3585da4cbac3e3eccdf7b4e299f6e02a029aba75661f1` |
| Episode 3 revision | exact original `3화.txt` | `3화(8).txt` | stop button absent; 15,896 response chars; title-to-black-wok question full manuscript | `ep003_revision/ep003.txt` | `f1f20cda7e994073644bb891ae6f076f054d64497d2e063b6d28571d6aa49f03` |
| Episode 3 revision v2 | saved current `ep003_revision/ep003.txt` | `ep003(11).txt` | exactly one prompt; stop button absent after completion; 16,128 response chars; title-to-black-wok question full manuscript | `ep003_revision_v2/ep003_v2.txt` | `80de3e38842d0ccd1efadc5ad9802e750f1270619f427fb5a25916c4893f0a75` |
| Commerciality and promotion audit | revised `ep001`, `ep002`, `ep003_v2` | `ep001(8).txt`, `ep002(10).txt`, `ep003_v2.txt` | exactly one prompt; stop button absent; concrete three-file readback; 11,038 response chars | `promotion_audit/raw.md` | `7b45648ee69959a035c978f223ba849013b90650afa1a7a7a455edf6e0057dce` |

The UI appended duplicate-safe number suffixes to uploaded filenames. The
dispatch and step receipts bind every chip to its exact local source path and
SHA-256.

## Concrete initial readback

- Episode 1: submerged-car opening; first current-life cooking; 3:17 PM taxi
  customer ending; injury, stake, and loss figures identified.
- Episode 2: Kang Gwang-su's spicy order; 9,000 won payment; menu reduction
  from 48 to 3; taxi queue identified.
- Episode 3: orders increase from 5 to 19; 80 g pork and 120 g vegetables;
  527,000 won/46-customer report; Kang In-ho recognizes the black wok.

This evidence records visible browser state and saved-response identity. It is
not a canonical approval or a promotion receipt.
# Promotion re-audit v2

- completed_at_utc: 2026-07-26T06:56:33Z
- chat_url: https://chatgpt.com/c/6a6588b8-3db4-83e8-8422-5742efa78fc3
- attachment_chips: `ep001(9).txt`, `ep002(11).txt`, `ep003_v3.txt`
- completion_signal: completed response visible; no active response-stop control
- verdict: Korean commercial webnovel PASS; promotion manuscript-fit estimate 72–83%, editorial only
- evidence: `promotion_audit_v2/raw.md`, `promotion_audit_v2/receipt.md`
