# 로판식당 B001 closeout review

```yaml
schema_version: firefly_arc_closeout_v1
work_slug: romance_fantasy_restaurant
b_id: B001
anchor_contribution: A01
start_episode: ep001
end_episode: ep003
episode_count: 3
episode_cap: 5
manifest_revision_set_sha256: 23d513fa4eef9796228b6b4d3822767ca21007957010338e8c3ab5d2b5f912b4
state_through: ep003
verdict: pass
reviewed_at: "2026-07-26"
```

## 실제 결산

- 시작 상태: 클로에는 서른두 살 황궁 수석 요리사로 죽고, 몰락 석 달 전의 여섯 살 공녀로 돌아온다.
- 중심 질문: 클로에는 가족에게 보호받는 아이를 넘어, 자기 요리로 가족의 오늘과 가문의 첫 현금흐름을 만들 수 있는가.
- 실제 선택과 비용: 회복 중인 몸으로 조리하되 가족의 감시와 분업을 받아들이고, 1금화 투자와 8은화 재료비를 건다.
- 비가역 결산: 가족 완식, 점포 사용, 52개 완판, 투자금 상환, 18은화 이익, 42개 선주문, 황궁과 채권자의 유료 주문.
- 인간 잔여물: 가족은 클로에를 지켜야 할 아이이자 사업 결정을 내리는 사람으로 보기 시작하고, 테오도르는 네 번째 번호표와 개인 약속을 지킨다.
- B를 지워도 다음 상태가 같은가: 아니다. B001 없이는 점포·현금·수요·가족 역할·황궁 주문이 없다.

## 독자 부채

- 지급 완료: 회귀 직후 첫 가족 식사, 첫 상품의 판매 가능성, 금화 1닢 투자 회수, 황태자에게도 적용되는 순서 원칙.
- 다음 B로 이동: 현장분 40개와 100명 대기열, 82개 품질 이행, 30일 안의 실제 채무 감축.
- 폐기: 없음.
- 새로 발생: 테오도르의 어머니와 주문 목적, 로엔 상단주의 도주, 클로에의 회귀 정체.

## Anchor 영향

- 기여한 Anchor: A01.
- 유지할 방향: 가족 구원과 식당 성장을 같은 장부에 남긴다.
- 수정할 예상 band: A01의 최초 증명은 ep003에서 닫혔고, 반복 영업 정착은 A02로 넘긴다.
- owner fork가 필요한 변화: 없음.

## B-Rail Reflow 판정

- 기존 next B: `revise`
- 근거: 승인 원고가 42개 선주문·40개 현장분·100명 대기열이라는 더 구체적인 진입 상태를 만들었다.
- 새 current B의 진입 상태: ep003 승인 상태의 82개 준비와 수요 초과.
- 남은 hypothesis B의 내구 필드 판정: A02~A08 방향은 keep, B002·B003의 기능은 승인 상태에 맞춰 revise.
- 무효화할 변동 필드: B002 이후의 정확한 음식·손님·화수·해결책.
- 보존할 Living Spine/Anchor 제약: 5화 상한, 가족 독립 행동, 음식 찬사의 물질 보상, 로맨스의 약속 기반 성장.

## 다음 작업

Narrative State와 B-Rail, Rolling Corridor를 ep003 기준으로 갱신했다. 다음은 ep004 Episode Bet 작성과 BR0/BR1이다.
