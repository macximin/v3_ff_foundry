# 저승식당 Rolling Corridor

현재 A01에서 A02로 넘어가는 가변 구간이다.

```yaml
from_anchor: A01
to_anchor: A02
current_episode: ep004
starts_from_state_through: v1_rc3_2_ep003_candidate
committed: []
provisional:
  - ep004
  - ep005
  - ep006
reader_debt_due:
  - tongue_less_guest_identity_and_need
  - first_actual_failure_cost
  - variable_funeral_coin_rule
  - princess_name_and_reason_to_stay
arc_cadence: guest_omnibus_1_to_3_episodes
current_status_floor:
  return_time: 1_of_1095_days
  cash: 18_coins
  inventory: 8_basic_ingredient_types
  supply_contract: 30_bakmyeongjo_wings_plus_12_broken_hoehonmae_for_10_coins
receipt_axes:
  - guest_departure
  - return_day
  - irreversible_loss
  - relationship_trust
appraisal_axes:
  - guest_reseating_or_departure
  - princess_responsible_action
default_external_pov_budget: 0
last_replanned_at: 2026-07-25
```

owner Adopt 전이므로 미래 회차는 `committed`가 아니다.

## 압력선

- 현재 압력: 두 번째 손님은 혀가 없고 말 대신 목패를 쓴다. 김문성의 기억 냄새와 국물 구조를 되풀이해서는 주문을 해결할 수 없다.
- 이번 corridor가 환전할 것: ‘맛은 혀에만 있는가’라는 새 감각 문제, 첫 실제 조리 손실, 손님 신뢰 회복, 두 번째 귀환 하루, 노잣돈 변동 결제 규칙.
- 사람 관계에 남길 후폭풍: 공주는 시식·계산 보조를 넘어 실패한 손님을 다시 앉히기 위해 자기 체면이나 신분 안전 중 하나를 실제로 건다. 해결책은 도윤에게 남긴다.
- 다음 anchor가 당겨지는 조건: 혀 없는 손님을 완결하고도 네 탁자·한 명의 종업원·불안한 재고로는 다음 대기열을 받을 수 없다는 운영 병목이 현재 장면에 남을 때.
- 늘리거나 줄일 수 있는 구간: 혀 없는 손님은 기본 2화, 최대 3화. 감정 사연이 한 화에 닫히면 운영 후폭풍을 별도 1화로 늘리지 않고 ep006 안에 합친다.

## ep004~006 잠정 진행

### ep004 — 혀가 없는 사람이 원하는 맛

- 손님의 목패와 몸·상처·삼키는 습관에서 첫 단서를 읽는다.
- 도윤은 업화고추의 ‘혀가 아니라 삼킨 뒤 몸에 남는 열’을 이용한 첫 가설을 세운다.
- 감각을 너무 직접 밀어붙여 손님의 상처 기억을 건드리고, 온도 균형을 잡으려던 한빙과 1개를 잃는다.
- 손님은 그릇을 밀고 자리에서 일어난다. 귀환 시간은 `1일` 그대로이며 해당 화에 대체 보상창이나 더 좋은 힌트를 주지 않는다.
- 절단은 손님이 식당 밖 안개에서 다시 목패를 뒤집는 행동. 뒷면에는 ‘맛이 아니라 씹을 때 들리던 소리를 잃었다’는 방향의 새 단서가 아니라, 도윤이 이미 본 행동을 다르게 읽게 하는 구체 흔적만 둔다.

### ep005 — 혀 밖의 한 끼

- 도윤은 실패 장면을 다시 보고 맛을 온도 하나로 환원한 자기 과신을 인정한다.
- 향, 치아·턱의 진동, 식감, 삼킨 뒤 열처럼 여러 감각을 조리 구조로 묶는다.
- 공주는 손님을 왕명으로 붙잡지 않고, 식당 안에서 지켜질 대기·선택 규칙을 설명해 재착석을 얻는다.
- 손님은 자기 결핍에 맞는 방식으로 먹고 떠난다. 두 번째 귀환 하루가 적립된다.
- 한빙과 손실은 복구하지 않는다. 노잣돈은 김문성과 다른 액수 또는 0닢으로 남아 개인별 변동 대가임을 보여 준다.

### ep006 — 하루와 식대는 다르다

- 도윤은 귀환 누계, 현금, 재고를 따로 장부화한다. 검은 장부가 새 UI를 띄우는 것이 아니라 도윤이 종이 운영장부를 만든다.
- 곽진복의 첫 정기 납품에서 품질·수량·지급 시점을 검수해 계약이 장식이 아님을 증명한다.
- 공주는 `연화`라는 권장 이름과 궁을 나온 이유의 첫 절반을 자기 선택으로 공개한다. 공개 신분은 계속 숨긴다.
- 하진은 생환 계약 위반 비용 또는 손님을 망령으로 만든 경우의 책임을 한 문장 규칙과 실제 흔적으로 제시한다.
- 다음 압력은 손님 수 증가가 아니라, 같은 시간에 서로 다른 주문을 가진 두 망자가 문을 보는 운영 병목이다.

## 회차 가치 순환

- 이번 corridor의 주 receipt 축: irreversible_loss → guest_trust_recovery → second_return_day.
- 이번 corridor의 평가자 / 평가 차원: 혀 없는 손님의 재착석·완식·퇴장 / 공주의 비권력적 책임 행동.
- 직전 corridor와 다른 점: 김문성은 기억의 방향을 교정했고 황천장은 시장 가격을 증명했다. 이번에는 감각의 경계와 실패 뒤 신뢰를 증명한다.
- 구조 상승은 어느 anchor에서 닫히는가: A02에서 실패 비용, 변동 노잣돈, 공주의 자기 욕망이 함께 닫힐 때.
- 2개 이상 외부 POV를 허용할 결산/확장 화: 없음. 1인칭 강도윤 현장 시점을 유지한다.

## 후속 발주 결정

- 혀 없는 손님의 구체 결핍과 최종 음식은 Episode Bet 발주 전에 Web GPT Pro가 후보를 만들고 owner 또는 비-Codex 감리 레인이 고른다.
- `연화`, `곽진복` 이름과 개인별 변동 노잣돈 규칙은 이 후보 안에서 닫혔고, 전체 패킷의 owner Adopt 전까지 비정본이다.
