# 로판식당 ep001~ep003 owner adoption review

```yaml
schema_version: firefly_owner_adoption_receipt_v1
work_slug: romance_fantasy_restaurant
decision_id: owner-adopt-romance-fantasy-restaurant-ep001-ep003-v2-20260726
promotion_decision_id: owner-promote-romance-fantasy-restaurant-20260726
decision: adopt_all_exact_revisions
decided_by: owner
decided_at: "2026-07-26"
producer: web_gpt_pro
reviewer: codex
operator: codex
review_verdict:
  br0_v2: pass
  br1_v2: pass
chat_url: "https://chatgpt.com/c/6a6588af-edb4-83e8-a203-4f5b497b210f"
run_root: 20_model_runs/web_gpt_pro/restaurant_revision_20260726/romance_fantasy_restaurant
approved_revisions:
  - { episode: ep001, source: ep001.txt, sha256: d9c9ac96f92fd88628fd6b73296c6786357d578cac3839cda7ca20c86484970e }
  - { episode: ep002, source: ep002.txt, sha256: 36dffade38e4828d6003901cc529aab8aad0c32c3ff95db78d00c23de3b3a38d }
  - { episode: ep003, source: ep003_v2.txt, sha256: 22e4fab16e2ff172edff2fcc01d71f15761b12f130589595e9aa39367d2c9632 }
historical_candidates:
  - { episode: ep003, source: ep003.txt, sha256: 0737d0eff9f500d2f5be6c0adcd3a195577cdab5a6a5d841b31d67e958376010, authority: historical_candidate_only }
manifest_revision_set_sha256: 23d513fa4eef9796228b6b4d3822767ca21007957010338e8c3ab5d2b5f912b4
```

## Premise Transaction

- 독자 입력: 가족을 잃은 후회, 2,300금화의 빚, 30일, 여섯 살 몸이라는 즉시 제약.
- 주인공 행동: 남은 재료로 가족을 먹이고, 1금화를 투자받아 상품을 만들고, 판매·가격·주문·수령 규칙을 정한다.
- 상대 비용과 지급 이유: 가족은 노동과 점포·투자금을 제공하고, 손님·채권자·황태자는 맛과 이행 가능성에 실제 동전을 선불한다.
- 구체 보상: 가족 완식, 투자금 상환, 18은화 순이익, 21은화 음식 선불, 1은화 배달비, 42개 확정 주문.
- verdict: `pass`

## Character Court

- 클로에는 가족을 살리고 싶다는 욕망을 조리·가격·분업·장부 행동으로 반복한다.
- 라인하르트는 딸의 건강과 가문 책임 때문에 투자와 노동 조건을 제한한다.
- 카시안·루시안·노아는 각각 현장 노동·장부·호객과 시식으로 결과를 바꾸며 구경꾼이 아니다.
- 오스발트는 채권 회수와 주문 이행을 함께 보고, 테오도르는 신분 특혜보다 개인 약속과 어머니를 위한 주문을 선택한다.
- 주인공을 삭제하면 메뉴·가격·공정한 수령 규칙·42개 주문 결합은 일어나지 않는다.
- verdict: `pass`

## 채택 범위

- Frozen Pitch와 Story Plan은 승인 원고 세 화에서 역복원한 미래 전략으로 채택한다.
- 승인 history는 manifest의 정확한 세 revision만 소유한다.
- 구 ep003 v1은 run root의 역사 후보이며 정본 원고·Narrative State 입력에 포함하지 않는다.
- Storyyard 전송과 공개 발행은 이 결정에 포함하지 않는다.
