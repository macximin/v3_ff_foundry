# 저승식당 v1-rc3.2 BR1 — plan-aware compare

## 판정

```yaml
route: pass
owner_approval: pending
reviewer_lane: codex_desktop_gpt_5_6_terra
manuscript_producer_lane: web_gpt_pro
plan_compiler_lane: codex_desktop_gpt_5_6_terra
feedback_harvest_scope: work_local
canon_promotion: forbidden_until_owner_adopt_and_manuscript_approval
```

`v1-rc3.2` 1~3화는 역복원한 Pitch Candidate, 주인공 작동 정체성, Premise Transaction, Character Court, Story Plan, Episode Bet과 충돌하지 않는다. 계획은 원고를 미화하기 위해 새 사건을 과거에 삽입하지 않았고, BR0에서 실제 읽힌 선택·보상·수치·관계를 먼저 받아 썼다.

`pass`는 owner에게 `Adopt` 선택을 올릴 수 있다는 뜻이다. Frozen Pitch, `40_works/afterlife_restaurant`, 승인 manuscript manifest, Narrative State, `v1.0-canon`을 자동으로 만들 권한은 아니다. 계획 compiler와 BR1 reviewer가 같은 Codex 레인이므로 owner가 최종 판정을 직접 해야 한다.

## 검토 입력과 무결성

| 입력 | SHA-256 | 역할 |
|---|---|---|
| `../ep001.txt` | `2b8d1bca981c1c7b0731c918e581b36ce7d4d1dc169bec4571311eab72eb241a` | 원고 후보 |
| `../ep002.txt` | `6baec3ac49cc771f6e9be445347bfda6faa5dea0de9281d6e1dbf33b8aebb94c` | 원고 후보 |
| `../ep003.txt` | `65ab2508218b7dfb1b462f2daa37d96712e307d9cc4ce554575675eca320d6ad` | 원고 후보 |
| `01_pitch/pitch_candidate.md` | `735bf99ba0e18c83e9b932fe68ebcf1cdc4c6f9a1487f05383a7a005d0802c75` | 판매 약속 |
| `00_feedback_profile_candidate.md` | `33c57da0b42b756802f78b78d80a93e6a4cfe1d2e4c67eac1be157ac7df39824` | 전역 profile 선택과 work-local overlay |
| `02_story/living_spine.md` | `c2505339c076029c0ee4306026fcab3cd97db179ea1c16b8ed6e0c1da46bad9c` | 작품 척추 |
| `02_story/anchor_rail.md` | `65c55686d613792da6511e400f0115d13afbfcdf9626dbbb0660b0cbc9cb13eb` | 장기 앵커 |
| `02_story/rolling_corridor.md` | `9921025fcf2a143170af3522fd8fd441bcafd2f947f3858d04323f510d9e0984` | ep004~006 근접 계획 |
| `03_episode_bet/ep001_episode_bet.md` | `f827d0c8e949f2bfc71b953afa30bbd7a36d77d593e6844c1a121e3d61706931` | 1화 약속 |
| `03_episode_bet/ep002_episode_bet.md` | `01c4170fa568730dbb8899dcef7cf5eb4ad92aa2894d2ebe1f486433c3f0641a` | 2화 약속 |
| `03_episode_bet/ep003_episode_bet.md` | `60e9eaef32ccc96b773ecb1bf4dd7c0963fda6cb12037c3b7dca187fc004ae47` | 3화 약속 |

BR0 입력은 원고와 직전 화 연결뿐이었다. BR0를 봉인한 뒤 위 계획을 열었다.

## Plan court

### Assembly Recipe

- verdict: `pass`
- 원고 한 묶음이 배경, 결핍, 정보격차, 첫 사용, 첫 환전, 첫 무대를 모두 소유한다.
- 외부 작품을 기준 원작인 것처럼 꾸미지 않았다. 여섯 블록은 모두 내부 원고의 work-local Story Block이다.
- 사건 연결은 `사고·딸 → 하진의 자격 증언 → 1,095일 계약 → 김문성 완식 → 6닢·빈 창고 → 폐재료 상품화 → 혀 없는 손님`으로 끊기지 않는다.
- 공주 본명 `연화`, 안대 노인 본명 `곽진복`, 개인별 변동 노잣돈, 식당 부진의 운영 공백은 후보 안에서 work-local 값으로 닫혔다. 현재 원고의 과거 사건을 바꾸지 않고 미래 공개 좌표만 만든다.

### Protagonist Operating Identity

- verdict: `pass`
- 현실 직업은 셰프 겸 식당주로 판독된다.
- `관찰 → 시험 → 오판 확인 → 교정 → 완식 → 원가·재고·가격·계약`이 ep002와 ep003에서 서로 다른 문제로 반복된다.
- 제목과 장부를 지워도 고객, 음식 상품, 식당 현금흐름, 공급계약이 남는다.
- 명경초와 장부를 지워도 칼·불·손질·관찰·폐기 판단·협상·동선 설계가 남는다.
- 조연은 규칙·재료명·시장·자리·계산을 제공하고, 귀항탕과 폐재료 상품화의 비가역 판단은 도윤이 소유한다.
- 장기 확장은 새 능력창이 아니라 공급 안정 → 손님 증가 → 공간·인력 병목 → 표준화·거점 운영의 현실 인과로 연결된다.

### Premise Transaction

- verdict: `pass`
- prize value: `1,095일`은 추상 포인트가 아니라 수술실 `18:31`에서 생환해 소율과 최소 3년을 사는 수명이다.
- counterparty value: 도윤은 한 끼에 미련이 묶여 다음 길로 가지 못하는 망자를 완전히 배웅한다. 저승은 값싼 부활을 허용하지 않고 한 명당 하루와 총 1,095일이라는 비싼 교환을 둔다.
- protagonist indispensability: 도윤 삭제 시 김문성의 오판 교정과 황천장 상품화가 모두 사라진다.
- defeat protection: ep002의 첫 가설 실패는 무방비가 아니라 소량 시험·관찰 뒤에도 가장 반복된 기억을 가장 소중한 기억으로 본 강점 기반 과신에서 나온다. 도윤은 전량 폐기로 비용을 낸다.
- plan_closed_loop: `no`. 보상 가치와 주인공 기여는 계획 문장끼리 증명한 것이 아니라 BR0의 빈 그릇, 퇴장, 하루, 6닢, 구매 25건, 계약 행동에서 독립 확인됐다.

### Character Court

- verdict: `pass`
- 강도윤, 서하진, 연화, 곽진복, 김문성, 명부·재료 제약의 당면 욕망·정보·통제 자원·대안이 구분된다.
- 하진은 검증한 셰프를 계약자로 얻고, 연화는 신분 밖의 역할을 얻고, 곽진복은 폐재고에서 20닢과 반복 판매처를 얻으며, 김문성은 귀항을 먹고 떠난다.
- 시장 승리는 작가가 군중의 칭찬을 선물한 것이 아니다. 시식 → 개당 2닢 → 나무패 25개 → 구매 → 6:4 → 정기 공급의 행동 사슬로 성립한다.
- 고정 적대자가 없다는 사실은 gate 누락이 아니다. 인격 적대자 대신 기억 작용, 완전 배웅 규칙, 자본, 독성, 시장 인식, 관계 비용이 실제 수단과 비용을 가진 adverse force로 작동한다.

## ep001 compare

- Premise Transaction verdict: pass.
- Character Court verdict: pass.
- plan_closed_loop risk: 없음. BR0가 계획 없이 `딸에게 귀환`, `1,095명`, `18:31`, `서하진의 독 감수`, `첫 손님`을 복원했다.
- Episode Bet kept: yes. 사고 뒤 소스 대신 휴대전화에 손을 뻗고, 하진의 제안을 가격·실패·시간까지 물은 뒤 서명하며, 고물 칼을 갈고 첫 주문을 받는다.
- Genre Profile instance kept: 전역 `modern_fantasy`의 early protagonist value proof와 ep001 reader orientation을 충족한다. 회귀가 아니므로 `regression_onboarding: null`이 맞다.
- receipt proportionality / counterparty incentive: 생환 3년을 받기 위해 최소 1,095명을 완전히 배웅해야 한다. 하진은 독을 감수하고 도윤의 음식 가치를 선행 검증했으며, 저승은 미련 망자의 체류를 해소한다.
- evaluator / appraisal dimension repetition: 하진 / 죽은 자에게도 닿는 조리 자격. ep002의 김문성/정서 정확성, ep003의 시장/상품 가격과 겹치지 않는다.
- useful emergence that should change plan: 낡은 칼을 직접 가는 행동과 공주에게 앞치마를 주는 장면이 도윤을 단순 천재가 아니라 현장 운영자로 만든다. Living Spine에 이미 반영했다.
- debt missed or displaced: 세계급 경력과 끊긴 예약의 인과는 아직 원고에 없다. A02 ep004~010 상환으로 이동했고 지워지지 않았다.
- Anchor/Corridor impact: A01의 진입과 계약을 연다.
- Narrative State patch coordinates: owner 승인 뒤에만 `protagonist`, `return_contract`, `clock`, `restaurant`, `relationships.hajin`, `relationships.princess`로 투영한다. 지금은 미등록.
- HIL divergence: 없음.

### ep001 원고 우위

Episode Bet보다 원고가 더 좋은 부분은 `세 숟갈이면 네 그램을 안다`는 하진과 도윤의 짧은 공방이다. 계약 자격을 이력서가 아니라 두 전문가의 오래된 식사 관계로 만든다. 계획은 이 표면을 보존 대상으로 받았고 더 일반적인 “저승사자가 인정했다”로 축약하지 않았다.

## ep002 compare

- Premise Transaction verdict: pass, inherited direct result.
- Character Court verdict: pass.
- plan_closed_loop risk: 없음. 계획을 보지 않은 BR0가 출항 기억 오작동, 전량 폐기, 귀항탕, 빈 그릇, 퇴장, 하루를 모두 복원했다.
- Episode Bet kept: yes. 손·청력·말투·국물 습관 → 기관실 가설 → 명경초 → 망각어 오작동 → 반복 기억/소중한 기억 분리 → 귀항탕 → 완식·퇴장 → 1일·6닢·빈 창고 순서가 일치한다.
- Genre Profile instance kept: CSU가 `오판 뒤 재선택`이라는 주인공 행동, 김문성의 완식·퇴장이라는 외부 반응, 하루·6닢이라는 receipt로 닫힌다.
- receipt proportionality / counterparty incentive: 재료를 맛보는 것만으로 보상을 받지 않는다. 손님이 망령이 될 위험을 끊고 마지막 식사를 완전히 마쳐야 하루가 지급된다. 김문성은 귀항의 온기를 얻고 떠난다.
- evaluator / appraisal dimension repetition: 김문성 / 자기 삶에 맞는 정서 정확성. 하진의 직업 자격 평가와 다르다.
- useful emergence that should change plan: 김문성이 그릇 손잡이를 주방 쪽으로 돌리는 행동은 감사 독백보다 강하다. 옴니버스 결산의 residue 기준으로 Living Spine과 Episode Bet에 반영했다.
- debt missed or displaced: 6닢의 일반 규칙은 이 화 원고만으로 확정할 수 없다. 후보는 개인별 노잣돈으로 선택했고 A02에서 다른 액수 또는 0닢을 현재형 결과로 증명하게 했다.
- Anchor/Corridor impact: A01의 감정·생환 보상을 닫고 시장 조달 압력을 연다.
- Narrative State patch coordinates: owner 승인 뒤에만 `completed_guests.kim_munseong`, `recipes.gwihangtang`, `return_days=1`, `cash=6`, `inventory=depleted`, `princess_identity_known_to_doyun=true`로 투영한다.
- HIL divergence: 없음.

### ep002 원고 우위

계획보다 원고가 더 좋은 부분은 하루를 숫자로 끝내지 않고 “학교에서 돌아온 아이의 하루, 식탁 맞은편의 저녁, 잠들기 전 인사”로 환산한 대목이다. 대리만족이 시스템 숫자로 식는 것을 막는다. 향후 장부 숫자는 같은 방식으로 매번 설명하지 않고, 다른 관계 행동이나 식당 자산으로 평가 축을 순환해야 한다.

## ep003 compare

- Premise Transaction verdict: pass. 생환 거래와 별도의 식당 현금흐름이 분리된다.
- Character Court verdict: pass.
- plan_closed_loop risk: 없음. BR0가 숫자와 구매·계약 행동을 독립 복원했다.
- Episode Bet kept: yes. 시작 6닢, 1닢 매입, 시식 5개, 판매 25개×2닢=50닢, 6:4, 도윤 수입 30닢, 총 35닢, 장보기 17닢, 잔액 18닢, 공급계약 10닢이 모두 일치한다.
- Genre Profile instance kept: market-signal route가 칭찬이 아니라 시식, 줄, 나무패, 돈, 분배, 계약으로 닫힌다.
- receipt proportionality / counterparty incentive: 도윤은 독성 손질·조리·가격·판매를 책임지고, 곽진복은 재료·자리·화로·숯·시장 접근을 제공한다. 도윤 6, 곽진복 4의 몫은 양쪽 기여와 반복 거래를 설명한다.
- evaluator / appraisal dimension repetition: 연화와 곽진복의 시식 / 실용성 → 군중 / 구매가치 → 곽진복 / 반복 공급가치. ep001~002 평가와 다르며 같은 장면 안에서도 행동 단계가 상승한다.
- useful emergence that should change plan: 연화가 계산·나무패·줄 관리·운반을 맡은 것이 장기 관계 엔진의 실제 첫 자산이다. 단순 먹방 조연으로 되돌리지 않도록 Living Spine과 A02에 잠갔다.
- debt missed or displaced: 안대 노인의 본명과 반복 역할은 원고에 없으므로 과거 원고에 소급하지 않는다. 후보에서 `곽진복`과 첫 정기 납품 검수 역할을 정하고 ep004 이후에만 공개한다.
- Anchor/Corridor impact: A01의 첫 사업 결산을 닫고, A02의 혀 없는 손님과 첫 실제 손실로 전환한다.
- Narrative State patch coordinates: owner 승인 뒤에만 `cash=18`, `inventory` 8종, `supplier_contract.bakmyeongjo`, `market_reputation.first_sale`, `princess_role` 계산·질서·운반, `next_guest.tongueless`로 투영한다.
- HIL divergence: 없음.

### ep003 원고 우위

원고는 공주를 왕실 신분으로 문제를 해결하는 조연이 아니라, 목소리를 낮추고 계산하고 나무패를 나눠 주고 바구니를 드는 사람으로 전진시킨다. 후보 계획의 `왕실 권한으로 손님 난제를 해결하지 않는다`는 규칙은 이 실제 강점을 일반화한 것이다.

## 첫 3화 묶음 판정

### 개인·작동·사회 정착

- 개인 정착: 강도윤은 소율에게 돌아가기 위해 확정 사망 대신 1,095명의 배웅을 택한다.
- 작동 정착: 손님 흔적과 위험 재료를 관찰·시험·교정해 마지막 한 끼를 만든다. 명경초는 감각 도구, 장부는 결과 기록일 뿐이다.
- 사회 정착: 빈 그릇과 하루에서 시작해 군중의 구매, 가격, 6:4 정산, 공급계약, 공주의 현장 역할로 가치가 세계에 남는다.

### 반복 엔진과 장기성

1. **감정 옴니버스**는 김문성의 퇴장으로 완결된다.
2. **전문가 조리**는 첫 가설 실패와 귀항탕 교정으로 증명된다.
3. **식당 성장**은 1닢 폐재료가 18닢 잔액·재고·계약으로 누적된다.
4. **귀환 목표**는 1/1,095일로 시작해 모든 손님 아크를 도윤 자신의 생존과 연결한다.
5. **관계 엔진**은 서하진의 계약 증언, 연화의 현장 노동, 곽진복의 거래로 서로 다른 이해관계를 가진 반복 인물을 확보한다.

옴니버스 강제, 무고정 적대자, RPG식 시스템 비확장 조건은 원고와 계획 모두에서 성립한다. 장기 긴장은 손님 난제, 재료 위험, 자본·공간·시간·신뢰, 귀환이 가까워질수록 커지는 관계 비용으로 라우팅된다.

### POV·호흡·질감

- 1~3화 실제 독립 타인 POV: `0`.
- 주 시점: 강도윤 현장 제한형 1인칭.
- 가치 신호: 하진의 독 감수 → 김문성 완식·퇴장 → 시장 구매·계약으로 순환.
- 기억 표면: 깨진 소스와 휴대전화 → 빈 그릇과 6닢 → 푸른 은근·나무패·재료 바구니·혀 없는 목패.
- 중복 위험: 현재 치명적 반복 없음. 향후 모든 망자가 눈물·어머니·집 냄새로 닫히면 즉시 work-local recurrence로 기록한다.

## 미래 계획 판정

### 통과

- A02는 4화에서 매출 확대보다 혀 없는 손님의 삶과 결핍을 먼저 둔다.
- 4~6화 사이에 한빙과 1개 소실, 귀환 0일, 손님 신뢰 하락을 실제 비용으로 남기고 같은 장면에서 전액 환급하지 않는다.
- 개인별 노잣돈 규칙은 설명 한 줄이 아니라 다른 결제 결과로 증명한다.
- 연화는 손님의 해답을 주거나 왕실 권한으로 제약을 지우지 않는다.
- 하진의 선택 이유, 계약 위반 비용, 도윤의 식당 부진 원인을 4~10화에 상환한다.
- 1,095일은 난도별 보너스가 아니라 식당 처리량 성장으로 장기 반복을 변주한다.
- A03 이후는 sparse로 남겨 아직 쓰지 않은 원고를 세부 연표로 위조하지 않는다.

### 후속 제작 전 재확인

- 혀 없는 손님의 구체 삶, 첫 오판의 물성, 최종 음식은 아직 정본 사실이 아니다. ep004 Episode Bet 전에 Web GPT Pro 후보와 독립 감리 또는 owner 선택이 필요하다.
- `연화`, `곽진복`, 개인별 변동 노잣돈, 식당 부진의 운영 공백은 이 후보의 Adopt에 포함되지만 1~3화 원고를 소급 수정하지 않는다. 미래 공개에서만 사용한다.
- 전역 Genre Profile은 `modern_fantasy`를 사용하되 회귀·재벌·복수 계약은 선택하지 않는다. 저승 요리물 고유 계약은 work-local scope에 머문다.

## 최종 BR1 결론

`PASS — OWNER ADOPT DECISION READY`

현재 후보는 좋은 웹소설을 첫째로 두고, 애니메이션 적합도를 뒤 단계로 분리한다. 1~3화의 상업성, 정합성, 대리만족, 옴니버스 완결, 경영 누적, 장기 클릭이 계획 문서에 과장 없이 복원됐다. BR0에서 읽히지 않은 사건을 과거 사실로 넣은 곳은 없다.

다음 권위 행위는 owner의 `Kill / Revise / Adopt` 중 하나다. `Adopt`라면 그 뒤에만 Frozen Pitch와 `40_works/afterlife_restaurant` 초기화를 수행한다. 원고 `v1-rc3.2`의 manifest 등록과 `v1.0-canon` 명명은 별도의 **원고 승인**을 받아야 한다.
