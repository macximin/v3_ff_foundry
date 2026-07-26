# ep002 금화 한 닢으로 시작하는 장사 — Episode Bet

상태: committed

## 한 줄 베팅

클로에는 아버지의 금화 한 닢과 자기 체력을 걸고 감자주머니 54개를 만들어 52개를 완판하고, 투자금을 당일 상환한 뒤 은화 18닢과 내일 손님을 얻는다.

## 독자 효용·CSU 계약

- reader question / paid utility: 여섯 살 클로에가 빈 점포에서 정말 돈을 벌 수 있는가.
- 초반 주인공 매력/유능함 증명: 채권자 오스발트에게 오늘 안에 매출 금화 한 닢을 넘기겠다고 내기한다.
- 유능함 판독 다리: 자본 1금화와 빈 점포→평범한 재료는 차별화가 어려움→사과·햄·치즈를 넣은 휴대식 선택→54개 생산·52개 판매→투자금 상환과 18은화 잔액.
- 선행 정보 의존성 / 해소 경로: `work_local_invention` — 화폐 1금화=20은화=200동화, 재료비 8은화, 판매가 5동화.
- 정보 공개 순서: 채권자 압력→투자 협상→메뉴·원가→조리 분업→시식과 판매→장부 결산→황태자 훅.
- 미해결 owner fork: 없음
- 논리 게이트 적용: inherited
- Premise Transaction receipt: `05_review/ep001-003_adoption_review.md`
- Character Court receipt: `05_review/ep001-003_adoption_review.md`
- 고위험 선택 탐색: 해당 없음
- 새로 이해할 판 / 선택·보상 연결: 시장 손님이 걸으며 먹을 수 있는 따뜻한 한입을 원한다는 판을 읽고 상품·가격을 맞춘다.
- CSU 입력 행동: 재료 8은화 구매, 54개 생산, 시식 후 52개 판매.
- 주인공 고유 기여: 메뉴 조합·수율·가격·조리 순서를 결정한다.
- receipt 종류: 판매 장부·투자금 상환·재방문 줄.
- 구체 표면: 감자주머니, 동전통, 금화 한 닢, 은화 열여덟 닢.
- 외부 가치 신호: 손님 완판, 세 명의 다음 날 대기, 아버지의 투자금 수령.
- 독자 답 — 왜 대단한가: 하루 안에 1금화를 매출로 만들고 원금까지 돌려준다.
- 독자 답 — 무엇이 달라졌나: 빈 점포가 실제 매출과 반복 수요가 있는 가게가 된다.
- next-click purchase: 줄 선 손님 뒤에 황태자 테오도르가 네 번째로 선다.
- skip test: no

## 변화 계약

- 시작 상태: 점포는 비어 있고 클로에는 검증되지 않은 1금화 투자자금을 가진다.
- 끝 상태: 판매 52개, 매출 1금화 6은화, 순이익 18은화, 투자금 전액 상환, 다음 날 손님이 있다.
- 현재 제약·비용: 6세 체력, 재료비 8은화, 당일 매출 1금화 내기.
- countable change: 생산54·시식1·아버지몫1·판매52; 매출260동화; 보유18은화.
- 입력-출력 비례성: 8은화 재료와 가족 노동이 260동화 매출로 환전된다.
- 상대 이해관계: 아버지는 딸 건강과 원금 보전을, 오스발트는 채권 회수 가능성을 본다.
- 보상 실질가치: 재투자 가능한 18은화, 검증된 판매가, 반복 고객과 점포 영업권.
- 주인공 삭제 반사실: 가족 노동만으로는 메뉴·가격·판매 동선을 정하지 못한다.
- 패배 합리성 / 적대자 비용: 오스발트는 계약 권한과 시간을 걸고 내기를 수락한다.
- 비가역 표면: 판매 장부, 반환된 금화 한 닢, 줄 선 손님 세 명.
- 인간 후폭풍: 가족은 클로에의 체력을 걱정하면서도 사업 능력을 인정한다.
- 주 시점 / 화자 거리: 클로에 1인칭 현장 제한형.
- 독립 타인 POV 수 / POV 예외 기능: 0
- 전문 인과 의미 다리: 원가·수율·판매가→54개 생산→52개 유료 판매→순이익과 투자금 상환.
- next-click pressure: 황태자를 일반 손님과 같은 순서에 세울 수 있는가.

## 장면 압력

- 가치 신호 route: market-signal
- 평가자 / signal owner: 시장 손님, 라인하르트, 오스발트
- 평가 변화: 아이의 장난→팔리는 음식→당일 원금 회수가 가능한 사업

1. 압력: 오스발트의 조롱과 1금화 매출 내기.
2. 선택: 비싼 귀족 음식 대신 시장용 감자주머니를 만든다.
3. 환전: 52개 완판, 1금화 6은화 매출, 18은화 순이익.
4. 후폭풍/절단: 황태자가 네 번째 줄에 선다.

### 장면 지도

| scene | owner | pressure | choice | conversion | reaction | transition purpose / bridge |
|---|---|---|---|---|---|---|
| S1 | 클로에 | 채권자 내기 | 1금화 투자 협상 | 점포와 시드 확보 | 가족이 조건부 참여 | 장보기로 이동 |
| S2 | 클로에 | 8은화 예산과 체력 | 54개 계량·분업 | 감자주머니 완성 | 가족이 역할 수행 | 시장 검증 |
| S3 | 클로에 | 손님 불신 | 시식·5동화 가격 | 52개 완판 | 다음 날 줄 형성 | 황태자 등장 |
| S4 | 클로에 | 투자금·원가 검산 | 장부 공개·원금 상환 | 18은화 잔액 | 아버지 인정 | ep003 순서 압력 |

## Story Block receipt

```yaml
story_blocks:
  - instance_id: rfr_ep002_one_gold_market_proof
    block_id: work_local:one_gold_market_proof
    use: new
    transforms: []
jit_materials: []
reuse_target: mechanism_and_materiality_only
passed_to_dispatch:
  stage_and_witnesses: [동문_제7점포, 가족, 시장_손님, 오스발트]
  concrete_objects: [감자주머니_54개, 동전통, 장부, 금화_한_닢]
  protagonist_behavior: [원가_계산, 조리_분업, 시식_판매, 투자금_상환]
  visible_reactions: [손님_완판, 재방문_줄, 아버지의_인정]
  relationship_or_material_payoff: [은화_18닢, 반복_수요, 가족_역할]
  end_image: [세_손님_뒤_네_번째로_선_황태자]
```

## Render selection

```yaml
render_selection:
  - { function: material_conversion, source_or_work_local_basis: "8은화 재료가 54개 상품이 되는 조리", scene_slot: S2, must_make_visible: action, do_not_turn_into: abstract_procedure }
  - { function: witness_reaction, source_or_work_local_basis: "시장 손님의 시식과 완판", scene_slot: S3, must_make_visible: reaction, do_not_turn_into: explanatory_label }
  - { function: residue_beat, source_or_work_local_basis: "투자금 반환 뒤 남은 18은화와 황태자 줄", scene_slot: S4, must_make_visible: end_image, do_not_turn_into: access_right }
```

## 잠금과 여지

- 반드시 지킬 것: 화폐 환산, 재료비 8은화, 생산54·시식1·아버지몫1·판매52, 매출260동화, 순이익18은화, 1금화 상환, 황태자 네 번째.
- 생산자가 용감하게 채울 공간: 시장의 냄새·소리, 손님 반응, 가족 분업의 유머.
- Narrative State에서 확인한 사실 좌표: 승인 원고 ep001~ep002.
