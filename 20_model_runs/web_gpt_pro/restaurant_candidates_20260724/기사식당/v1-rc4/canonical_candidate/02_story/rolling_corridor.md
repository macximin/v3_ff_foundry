# Rolling Corridor — 기사식당

```yaml
schema_version: firefly_rolling_corridor_v2
arc_route_rail_ref: arc_route_rail.md
from_anchor: A00
toward_anchor: A01
starts_from_state_through: ep000
arc_episode_cap: 5
current_b_arc:
  b_id: B001
  status: active
  start_episode: ep001
  planned_end_episode: ep003
  hard_end_episode: ep005
  central_question: "카일은 황실의 소유물에서 벗어나 자기 식당과 거래의 주인이 될 수 있는가"
  close_condition: "법적 토지권·식당 판단권·상호 책임 계약을 모두 행동과 문서로 확보"
  anchor_contribution: A01
next_b_arc:
  b_id: B002
  status: provisional
  starts_after: B001_close
  episode_span: 1_to_5
  function: "첫 군납을 위해 생산·고용·조달·검수를 실제로 닫는다"
  entry_dependency: "v1-rc4 ep003 owner approval"
episode_cursor:
  current_episode: ep003
  committed: []
  candidate_ready:
    - ep001
    - ep002
    - ep003
reader_debt_due:
  - "30일 안에 첫 1,500그릇"
  - "작업자 8명과 취사병 10명 교육"
  - "물·달걀 현지 조달과 건조 꾸러미 공급"
  - "첫 무작위 검수와 인수"
  - "황실에서 오는 다음 손님"
current_status_floor: "토지·식당·1년 공급계약을 가진 독립 사업자 후보"
receipt_axes:
  - ownership
  - judgment
  - contract
  - production
appraisal_axes:
  - guest
  - medical
  - logistics
  - worker
```

## 현재 B 압력선

- 중심 질문: 카일이 총애와 고용을 거절하고도 자기 삶을 물질적으로 성립시킬 수 있는가.
- 환전: 토지권, 첫 매출, 공개 판단권, 공급계약, 도로, 창고, 선금.
- 인간 후폭풍: 아델린은 소유자가 아니라 손님·거래 상대가 되고, 북부 기사들은 카일의 식탁 규칙을 따른다.
- 종결 조건: ep003 계약의 산술·인수·귀책 조건이 모순 없이 닫히고 owner가 원고를 승인한다.

## 다음 B 가설

- ep004: 선금을 장부상 부채로 분리하고 작업자·재료·설비를 확보한다.
- ep005: 표준 꾸러미와 취사병 교육에서 카일 혼자 잘하는 것과 조직이 재현하는 것의 차이를 낸다.
- ep006 또는 조기 종결: 첫 1,500그릇 인수와 실제 대금 상계로 군납 약속을 결산한다.

위 화수와 사건은 제안이다. owner Adopt 뒤 ep004 Episode Bet에서 다시 판단한다.

