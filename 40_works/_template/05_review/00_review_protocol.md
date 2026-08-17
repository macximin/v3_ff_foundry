# Review Protocol — BR0 / BR1

감리는 원고를 계획에 끼워 맞추는 일이 아니라, 실제 읽힌 이야기와 약속의 차이를 드러내는 일이다.

기본 원고 생산자는 Web GPT Pro, 기본 BR0/BR1 감리자는 Codex Desktop `gpt-5.6-terra`다. producer identity와 reviewer lane을 receipt에 기록한다. GPT/Codex가 생산한 원고는 Codex 계열이 아닌 감리 레인 또는 owner가 최종 판정한다.

## BR0 — blind readback

입력은 현재 원고와 직전 승인 원고뿐이다. Episode Bet, Corridor, Anchor Rail, Narrative State는 닫는다.

- 실제로 벌어진 선택과 결과
- 독자가 받은 보상
- 실제로 읽힌 CSU 입력·receipt·외부 가치 신호
- 첫 번째로 기억나는 물건·행동·관계
- 주인공의 승리가 어떤 행동과 타인의 어떤 반응으로 보였는가
- 실제 독립 타인 POV 수와 각 장면 전환의 새 값. 앞 장면을 반복·재설명했는지도 함께 기록
- 1화라면 계획 없이 복원한 정체·위치·능력/욕망·주요 관계·몰락 인과·후회·새 목적
- 이번 화에서 새로 이해한 판, 그 이해가 가능하게 한 주인공의 선택과 즉시 보상. 새 설명인지 이미 아는 정보의 상태 변화 없는 반복인지 함께 기록
- 바뀐 수치·지위·관계
- 인물의 욕망과 반응
- 보상이 왜 탐나는지 원고만으로 설명 가능한가
- 주인공이 정상적인 방어를 했는가, 패배가 강점에서 나온 blind spot과 적대자의 준비된 비용으로 읽히는가
- 주인공을 삭제해도 같은 결과가 나는가. 조연의 기여와 주인공만의 결정적 기여는 무엇인가
- 적대자의 승리가 무제한 작가 권한이 아니라 인물의 자원·행동·비용으로 읽히는가
- 다음화 압력
- 원고 내부 모순 좌표

## BR1 — plan court + plan-aware compare

BR0를 고정한 뒤 Premise Transaction과 Character Court를 먼저 열어 계획 자체를 판정한다. 보상 실질가치·주인공 불가결성·합리적인 방어·적대자 비용·각 행위자의 최선 선택 중 하나라도 성립하지 않으면, 원고가 Episode Bet과 일치해도 `pass`하지 않는다. 그 뒤 Episode Bet, Corridor, Anchor Rail, Narrative State를 연다.

- 약속대로 산 부분
- 선택 Genre Profile과 이번 화 인스턴스가 만나는 부분
- 입력 행동·상대 이해관계·receipt 크기의 비례성
- 이름·직함·퍼센트를 지워도 남는 보상 가치와 상대의 지급 비용
- 주인공 삭제 반사실과 조연/주인공 성과 귀속
- 주인공의 사전 방어, 적대자의 공격 자원·행동 순서·비용, 패배 뒤 남는 주인공 자산
- actor ledger의 정보·대안·선택과 실제 원고 행동의 일치
- 고평가가 가격·호칭·위임·경계·대응으로 남은 부분
- 독립 타인 POV의 새 값이 인지 재정렬·속도 냉각 비용보다 컸는가
- Source/Story Block receipt의 `retain / transform` carrier 기능이 실제 원고에서 식별되는가. source-present 무대·목격자와 끝 이미지도 해당할 때 함께 본다.
- `use: new`가 donor 축을 풍부하게 했는가, 범용 대체물로서 첫 기억·주요 행동 축을 빼앗았는가
- 원고가 계획보다 좋아서 계획을 고칠 부분
- 원고가 빚을 만들고 갚지 않은 부분
- state projection에 반영할 변화
- owner가 판정해야 할 divergence

## 판정

`pass | revise | restart`만 사용한다. HIL은 별도 판정이 아니라 owner에게 올릴 좌표다. pass는 승격 후보일 뿐 owner approval을 대신하지 않는다.

계획과 원고가 서로 정확히 맞더라도 Premise Transaction 또는 Character Court가 실패하면 이는 `plan_closed_loop`다. 가장 먼저 잘못 정본화된 보상·대표 성과·배신·몰락 전제로 돌아가며, 문장 폴리싱으로 우회하지 않는다.

유지·변형하기로 한 source-present carrier 기능이 식별되지 않거나, 출처와 무관한 범용 대체물이 그 자리를 차지해 첫 기억·주요 행동 축이 되면 `surface drift`로 fail한다. 명사 복사를 요구하지 않으며 문서·계약 자체를 금지하지 않는다. 구체 행동·반응·보상 연쇄에 참여하면 재료이고 그 연쇄를 대신하는 마스터키면 실패다.

- Source Map에서 이미 누락: cited evidence를 다시 열고 가장 먼저 끊긴 carrier 채굴부터 수정
- 조립표·Scene Forge·dispatch에서 소실: 가장 먼저 끊긴 build evidence로 복귀
- dispatch까지 생존, 원고에서만 소실: 원고 후보만 재시도

## 원고 최소 계약

- 공백 포함 4,000자 이상, 상한 없음.
- payoff는 설명이 아니라 현재형 사건·물성·반응으로 보인다.
- 선택 profile이 `modern_fantasy`면 setup-only 화를 통과시키지 않는다. CSU는 별도 세 장면이 아니라 한 인과 연쇄로 읽힐 수 있다.
- 생산자 self-review는 최종 pass가 아니다.

## B 종결 감리

현재 B의 마지막 회차가 owner 승인된 뒤 `arc_closeout_template.md`를 실제 `arc_<b_id>_closeout.md`로 복사해 작성한다.

- 승인 원고 기준 B 길이가 이 신작 profile의 1~3화인지 확인한다.
- 시작 상태와 실제 endpoint를 비교한다.
- 중심 질문이 행동·상태 변화로 결산됐는지 확인한다.
- 지급·이동·폐기할 독자 부채와 유용한 emergence를 기록한다.
- 현재 A-Anchor의 방향과 예상 band에 미치는 영향을 판정한다.
- 기존 next B를 자동 승격하지 않는다. Narrative State에서 재검증해 유지·수정·retire한다.
- 나머지 B-Rail의 내구 필드는 재판정하고 구체 사건·인물·해결책·화수는 무효화해 다시 쓴다.

B closeout은 새 제작 stage가 아니라 승인 원고 뒤 Story Plan reflow를 위한 review receipt다.
