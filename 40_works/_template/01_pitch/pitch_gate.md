# <작품명> pitch gate

> 운반/감리 레인 전용. 이 파일의 항목을 생산자에게 피치 본문으로 쓰게 하지 않는다.
> 사람-facing 피치 페이지에는 이 체크표와 상태값을 노출하지 않는다. Notion에서는 속성, receipt, 또는 별도 운영 메모로만 둔다.
> 기본 생산자는 Web GPT Pro, 기본 감리자는 Codex Desktop `gpt-5.6-terra`다. GPT/Codex가 producer인 후보는 Codex 계열이 아닌 감리 레인 또는 owner가 최종 판정한다.

## 원천/운반

- raw/model_run:
- prompt:
- producer:
- operator:
- created_at:
- source_or_reference_packet:
- assembly_recipe:
- base_source:
- story_block_ids: []
- new_story_blocks: []

## 묶음 판정 전제(시장 evidence 1회 갱신)

여러 후보를 한 번에 상업성으로 추리는 피치 묶음 판정 직전 marketIntel 정본 evidence를 1회 갱신해 그 날짜를 근거로 쓴다(평소 갱신 안 함). 명령·정본 위치·freshness 기준은 ff_marketIntel SSOT(AGENTS.md 운영 기준) 따름.

## 합격선

전부 "예"여야 채택 후보. 하나라도 "아니오"면 누락 항목만 producer에게 보강 재발주한다. GPT/Codex가 producer인 후보는 다른 레인 또는 owner가 최종 판정한다.

- [ ] 훅: 로그라인 한 문장에 "나 혼자만 ___"의 격차 + 파는 쾌감이 다 들었나?
- [ ] 엔진: 결핍, 정보격차 장치(+한계), 단기/장기 목적성이 비지 않았나?
- [ ] 오프닝: 1~3화 안의 강한 증명 또는 장면 오디션이 보이나?
- [ ] 조립: 기준 원작 하나가 배경→결핍→장치→첫 사용→첫 환전→첫 무대를 끝까지 책임지나?
- [ ] 출처: 초반 주요 beat가 stable Story Block ID 또는 드러난 `new_story_blocks`로 추적되나?
- [ ] 연결: 블록 사이 행동 가능성·능력 규칙·보상 시점이 Recipe compile gate를 통과했나?
- [ ] 초반: 5~10화가 추상 약속이 아니라 실제 장면 사슬로 보이나?
- [ ] 지속: 쾌감 사이클 2~4개 + 라우팅 + 확장 계단이 있나?
- [ ] 캐스트: 이름 있는 주요 인물 5명 이상, 각자 욕망과 주인공과의 충돌이 있나?
- [ ] 클로저: 왜 지금 독자가 이걸 눌러야 하는지 한 문단으로 못박았나?
- [ ] 표면: 사람 투고 기획안처럼 읽히고, YAML/status/self-check 냄새가 본문에 묻지 않았나?

## 판정

```yaml
pitch_status: draft | revise | accepted_frozen | archived
accepted_at:
owner_decision:
notes:
```
