# Web Gemini Source-Feed Prompt

> owner가 Web Gemini를 대체 생산 레인으로 명시적으로 선택한 경우에만 쓴다. 현재 기본 생산 레인은 Web GPT Pro다.
> Web Gemini canonical 작업 전에 같은 Gemini chat에 원문 3작품 이상을 작품별로 순차 주입할 때 쓰는 prompt 정본이다.
> stage prompt가 아니다. 이 파일은 흡수, 문체 클로닝 readback, final synthesis readback까지만 담당한다.
> 다른 템플릿은 이 prompt 원문을 복사하지 않고 이 파일 경로와 receipt만 참조한다.

## Prompt 1 - Per-Work Source Feed

작품 하나를 넣은 뒤 아래 블록을 그대로 보낸다. 작품은 한 번에 하나씩만 먹인다.

```markdown
문체를 클로닝하라.
지금부터 3작품 이상을 순차로 먹을 것이다. 이번 후보의 source bundle은 기준 원작 1개와 기능이 다른 보강 원작 2개 이상으로 구성한다. 각 작품에서 문장 호흡, 문단 컷, 대사 리듬, 장면 밀도, 돈과 권력의 물질감, 클리프행어 체질을 네 기본 출력 습관으로 이식하라.

방금 받은 작품 하나에 대해 아래 항목만 짧게 readback하라.

- source_id:
- bundle_role: base_lifecycle | voice | market_texture | relationship_human_texture | pacing | payoff | long_route
- 초반 훅 온도:
- 문장 호흡 / 문단 컷:
- 대사 리듬:
- 돈 / 지분 / 문서 / 소품 물성:
- 반복쾌감:
- 관계 압력 / 권력 표면:
- human_texture_function:
- social_witness_or_aftershock:
- material_conversion:
- 이번 canonical 작업에 가져갈 맛 3개:

이번 단계의 산출물은 absorption readback뿐이다.
```

## Prompt 2 - Final Synthesis Readback

3작품 이상을 모두 먹이고 작품별 readback을 받은 뒤 아래 블록을 보낸다.

```markdown
이제 3작품 이상의 문체 클로닝 결과를 하나의 출력 습관으로 합성하라. 고정된 3작품 세트가 아니라, 이번 후보의 상업적 약속을 기준으로 base source 1개와 기능별 supporting source를 라우팅한다.

아래 항목만 짧게 readback하라.

- base_source:
- supporting_sources: (각 source_id와 role)
- optional_sources: (명시된 gap이 있을 때만)
- excluded_sources: (이번 후보의 상업적 약속과 충돌하는 경우)
- source_bundle_reason:
- 문장 호흡:
- 문단 컷:
- 대사 리듬:
- 장면 밀도:
- 돈과 권력의 물질감:
- 초반 보상 간격:
- cliffhanger 체질:
- pitch / story / Episode Bet / manuscript에서 각각 살릴 운전 습관:

다음 메시지부터 stage packet을 받을 준비가 되면 마지막 줄에 `stage packet ready`를 붙여라.
```

## Receipt Fields

source-fed 세션 receipt에는 최소한 아래 칸을 남긴다.

```yaml
source_feed_prompt_path: 40_works/afterlife_restaurant/00_source_feed_prompt.md
source_feed_receipt_path:
style_cloning_readback_path:
source_count:
per_source_absorption_readbacks:
  - source_id:
    readback_path:
    source_path:
    source_range:
    transfer_mode: pasted_excerpt | file_attachment
    attachment_or_slice_list:
    transfer_evidence: # pasted prompt copy / Gemini attachment chip / other visible proof
    gemini_readback_verbatim_path:
final_synthesis: stage packet ready
works:
source_bundle:
  base_source:
  supporting_sources: []
  optional_sources: []
  excluded_sources: []
  source_bundle_reason:
gemini_chat:
subscription_lane:
  profile: balanced
  provider_surface: gemini_web
  billing_assumption: subscription
  auth_preflight:
  api_key_present: no
  context_budget: thick
  escalation_reason: new_source_feed
```

`file_attachment`는 Gemini UI에 실제 파일 attachment chip 또는 동등한 visible evidence가
남은 경우에만 쓴다. 로컬 `corpus_path`의 내용을 채팅 prompt에 복사한 경우에는 반드시
`transfer_mode: pasted_excerpt`로 기록한다. 로컬 경로가 receipt에 있다는 사실만으로
Gemini가 파일을 직접 열어 본 것으로 주장하면 안 된다.
