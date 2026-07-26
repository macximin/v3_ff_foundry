# 흑곰작가 Source Intake Manifest

```yaml
source_author: 흑곰작가
status: intake_pending
bundle_role: derive_from_source_feed
selection_rule: >
  Select one or more works only when the candidate's commercial promise has a
  named gap. The Gemini source-feed receipt assigns base or supporting roles;
  this manifest does not preassign a voice, pacing, or texture role.
source_truths:
  - ../../../ff_sources/합본들/티끌 모아 대박_흑곰작가_합본.txt
  - ../../../ff_sources/합본들/졸부집 망나니(개정판)_흑곰작가_합본.txt
  - ../../../ff_sources/합본들/재벌이 회귀했는데 뭔들 못하겠어_흑곰작가_합본.txt
  - ../../../ff_sources/합본들/재벌가 막둥이는 만능 천재(개정판)_흑곰작가_합본.txt
  - ../../../ff_sources/합본들/이혼 후 재벌 각성!_흑곰작가_합본.txt
  - ../../../ff_sources/합본들/역대급 빌런이 되었다_흑곰작가_합본.txt
  - ../../../ff_sources/합본들/법보다 주먹(개정판)_흑곰작가_합본.txt
  - ../../../ff_sources/합본들/리턴 에이스_흑곰작가_합본.txt
  - ../../../ff_sources/합본들/검은 머리 미국 대재벌!_흑곰작가_합본.txt
required_receipt_fields:
  - selected_source_paths
  - source_bundle.base_source
  - source_bundle.supporting_sources
  - source_bundle_reason
  - per_work_absorption_readback
  - functional_extraction_path
```

## Intake contract

1. A chosen 흑곰작가 work is sent to the same Gemini source-feed session one work at a time.
2. The receipt records why it is base or supporting material for this candidate.
3. Its functional extraction is stored before it is reused as a routing source.
4. No work is treated as a permanent fixed member of every source bundle.
