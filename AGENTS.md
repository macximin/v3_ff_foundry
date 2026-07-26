# AGENTS.md — ff_foundry

ff_foundry 운영 규칙 정본은 **00_charter/ff_foundry_charter.md**다 (권위·저장 규칙).
캐노니컬 제작 루프는 [Anchored Story Loop](00_charter/anchored_story_loop.md)와 `40_works/_template/` 양식이 정본이다.
활성 제작 용어는 [Firefly Terminology](00_charter/terminology.md)가 단일 진실원천이다. `Donor Chain`, `canonical_stage`, `north_star`, `blueprint`, `draft`는 legacy 기록에서만 읽는다.
모델 레인 권한은 헌장의 **Model Lanes**를 따른다 (기본 생산자 = Web GPT Pro / 기본 BR0·BR1 감리자 = Codex Desktop `gpt-5.6-terra` / Codex 관리·운반; Web GPT Pro가 막히거나 품질 기준을 충족하지 못할 때만 owner가 대체 생산 레인을 고른다. 생산자 self-review는 최종 pass가 아니며, GPT/Codex가 직접 생산한 산출물은 다른 감리 레인으로 넘긴다. Episode Bet 조립은 생산자 또는 관리 레인이 맡을 수 있고 howlib는 JIT 조회 바닥이며 근거 있는 발명을 허용한다).
모든 모델-facing 창작·감리 문장은 헌장의 **Core Philosophy — no fear harness**를 따른다.

→ [헌장](00_charter/ff_foundry_charter.md)
→ [작품 양식](40_works/_template/)

원천 채굴(QRP 등) 재료는 ff_foundry 소관. 원문 정본 권위는 ff_sources에 둔다. 작업 사본은 헌장 경계 안에서 허용한다.
규칙 변경은 이 파일/헌장에서만(drift 방지). 작품 진행 상태와 작품별 소유권 정본은 각 `40_works/<work_slug>/00_status.md`의 YAML front matter다. 포트폴리오 전략·승인·handoff는 `genai_hq`, 제작 정본은 이 repo, 공개 투영은 Storyyard가 맡는다. Storyyard에서 이 repo로 역방향 동기화하지 않는다.
