# Anchored Story Loop — workflow authority

상태: **ADOPTED · 2026-07-11**

활성 용어는 [Firefly Terminology](terminology.md)를 따른다. `ff_foundry`의 제작 흐름은 아래다.

```text
[재사용·빌드 레인 — 이야기 권위 없음]
Source Map / Story Block -> 조립표 -> Pitch Candidate -> owner 채택
Frozen Pitch -> Protagonist Operating Identity -> PASS receipt
고위험 전제 -> Premise Transaction + Character Court -> PASS receipt

[작품 제작 레인]
Frozen Pitch -> Story Plan -> 화별 약속 -> 원고 후보 -> BR0/BR1 -> owner 승인 -> 승인 원고
                   |                                                   |
                   +-- 작품 척추 + 장기 앵커 + 근접 3화                 +-> 상태 스냅샷 재생성

[조건부 장르 계약 — stage/이야기 권위 아님]
00_feedback_profile -> 선택 Genre Profile -> 생산 excerpt / 전체 감리

충돌 또는 owner retcon이 있을 때만 -> 충돌 판정 메모
```

## 권위 순서

1. **사람이 승인한 정확한 원고 revision**이 이미 일어난 이야기의 최고 권위다.
2. **충돌 판정 메모(Canon Note)**는 원고 내부 충돌의 의미 판정 또는 owner retcon만 기록한다. 사실 장부나 미래 계획을 대신하지 않는다.
3. **상태 스냅샷(Narrative State)**은 승인 원고의 해시와 좌표에서 다시 만들 수 있는 투영/cache다. 원고와 충돌하면 폐기하고 재생성한다.
4. **Story Plan**은 작품 척추·장기 앵커·근접 3화의 묶음이며 수정 가능한 미래 전략이다. 이미 승인된 원고를 소급해서 지휘하지 않는다.
5. **Source Map / Story Block**은 성공작에서 작동 순서를 찾고 다시 호출하는 provenance 재료다. Story Block은 출처 좌표와 `entry -> sequence -> exit` 계약을 가진다. 실제 사건 좌표에서 가져온 블록은 같은 좌표에 보이는 무대·목격자, 물건, 주인공 행동, 타인의 반응, 관계 전환, 물질 보상, 끝 이미지를 `carrier_surfaces`에 함께 남긴다. 승인 원고나 작품의 미래 전략이 아니다.

Genre Profile은 이 이야기 권위 순서에 끼지 않는다. 선택한 장르 가족의 정적 acceptance contract이며, 작품의 `00_feedback_profile.md`가 opt-in selector다. Story Plan은 아크 변수, 화별 약속은 이번 화 인스턴스, 상태 스냅샷은 승인 원고에서 실제 발생한 이력만 소유한다.

## 조건부 Genre Profile

- 정본 위치: `30_materials/craft/genre_profiles/`.
- 작품 선택 위치: `40_works/<work_slug>/00_feedback_profile.md`의 `genre_profiles`.
- profile이 허용한 조건부 계약은 같은 작품 파일의 `genre_profile_options`에서 값 하나를 선택한다. 선택하지 않으면 추가 계약이 없다.
- 생산자와 BR1 감리자는 선택 profile의 짧은 `Shared Acceptance Core`와 선택된 조건부 계약을 같은 문장으로 받는다.
- BR1 감리자는 같은 core를 포함한 profile 전문과 같은 화별 약속을 추가로 보되, 전문의 진단 질문이 숨은 합격선을 만들지 않는다.
- profile 전문을 Living Spine, Corridor, Episode Bet에 복붙하지 않는다.
- profile은 정식 stage, 이야기 사실, 작품별 미래 전략이 아니다.

## 피치 전 조립 — 조립표

조립표(`assembly_recipe.md`)는 Story Block을 새 Pitch Candidate로 컴파일하는 **build evidence**다. 실제 실행본은 `20_model_runs/<producer>/<run>/`에 두며 이야기 권위를 갖지 않는다.

- **기준 원작(`base_source`) 하나**가 `주인공 배경 -> 결핍 -> 정보격차 장치 -> 첫 사용 -> 첫 환전 -> 첫 무대`를 끝까지 책임진다.
- 다른 작품은 `pacing / payoff / human texture / long route`처럼 지정된 역할의 보강 블록(`supporting_blocks`)으로만 붙는다.
- 초반 주요 beat는 `donor / transform / new` 중 하나로 표시한다. `transform`은 순서·압축·이름·규모·표면 변형을 적고, `new`는 조용히 접착제로 숨기지 않는다.
- 실제 사건 좌표에 보이는 carrier 값은 누락 없이 채굴하고, 조립표에서 값마다 `retain / transform / intentional_omit` 중 하나를 밝힌다. `intentional_omit`은 현재 작품의 구체적인 캐논·인과 충돌과 출처 있는 구체 대체물을 함께 적을 때만 유효하다.
- `use: new`는 추가 재료나 donor가 없는 빈칸에만 쓴다. donor의 물건·행동·관계·보상을 대신하거나 처분한 것처럼 세탁할 수 없다.
- source-backed 조립의 기본값은 `new_story_blocks: []`다. 새 블록이 필요하면 조립표와 pitch gate에 드러내 사람이 무엇이 새로 생겼는지 한눈에 본다.
- 블록이 작동하기 전에 독자가 알아야 할 주인공 가치·욕망·관계·받아야 할 보상은 `required_story_facts`로 잡는다. 출처 블록으로 해소하고, 없으면 작품 안에서 구체적으로 발명한다. 판매 약속·주인공 도덕성·장기 목표·핵심 능력·대형 앵커를 바꾸는 발명만 추천안과 함께 owner fork로 올린다.
- 연결 검사는 일곱 가지를 한다: 앞 블록의 exit가 다음 entry를 만족하는가, 나이·지위·자본·권한으로 행동 가능한가, 능력 규칙이 몰래 바뀌지 않는가, 약속한 화 안에 보상과 인간 환전이 도착하는가, 인용 근거에 보이는 carrier가 빠짐없이 채굴되고 조립 처분을 가졌는가, 각 주요 블록의 선행 정보가 해소됐는가, 미해결 owner fork가 없는가.
- 주인공은 `30_materials/character/protagonist_operating_archetypes.md`에서 기준 작동 원형 하나를 고른다. 기준 원형이 현실 직업·반복 경제행동·돈 버는 방식·축적물·최종 거물상을 끝까지 책임지고, 보강 원형은 최대 두 개의 지정 역할만 맡는다.

양식은 `30_materials/source_maps/assembly_recipe_template.md`를 쓴다. Frozen Pitch는 조립표를 노출하지 않고 사람말 기획서로 읽혀야 한다.

### 주인공 작동 정체성

Frozen Pitch가 채택되면 Living Spine을 닫기 전에 `protagonist_operating_identity_template.md`를 `20_model_runs/<producer>/<run>/protagonist_operating_identity.md`로 실행한다. 새 stage나 이야기 권위가 아니라 원문 기반 조형 build evidence다.

- 성격·목소리보다 먼저 세상에서 부르는 현실 직업, 반복 동사, 회사가 실제로 파는 것, 고객의 지급 이유, 능력 밖 실력, 복리 축적물, 다음 산업 인과, 최종 거물상을 한 사람으로 합성한다.
- 작품 제목의 핵심어를 지워도 사업이 설명되고, 이능력을 지워도 직업적 유능함이 남아야 한다.
- `인재를 찾는다`, `미래를 안다`, `가치를 본다`는 정보우위다. 현실 반복 행동은 투자·제조·구조조정·인수·판매·운영처럼 세계가 돈을 지급하는 동사로 내린다.
- 메타 엔진을 회사명·업종으로 직역하지 않는다. 인재 선점은 투자회사·계열사·공장·사업을 더 잘 움직이는 비밀 우위일 수 있지만 그 자체가 고객 상품이라는 뜻은 아니다.
- 실행본이 `status: pass`이고 owner fork가 닫힌 경우에만 receipt를 Living Spine에 연결한다. 현실 직업이나 장기 축적물을 바꾸면 이 receipt부터 다시 연다.

## Story Plan과 화별 약속

### 정본화 전 고위험 논리 게이트

1화, 주인공 대표 성과·대형 보상·배신·몰락·가까운 Anchor를 새로 만들거나 바꿀 때는 Living Spine에 넣기 전에 두 비권위 build evidence를 통과한다.

- **Premise Transaction:** 보상의 실제 자산·현금흐름·통제권·다음 선택, 주인공만의 비가역 기여, 주인공이 준비한 방어, 적대자가 치르는 비용과 방어를 뚫는 행동 순서를 검증한다.
- **Character Court:** 주인공·적대자·핵심 조연·제도가 당시 가진 정보·수단·대안으로 자기 이익에 맞게 행동하는지, 주인공 제거·거절·조연 이탈 반사실까지 재생한다.

실행본은 `20_model_runs/<producer>/<run>/{premise_transaction,character_court}.md`에 두며 이야기 권위가 아니다. 두 파일의 최종 `status: pass`와 닫힌 owner fork를 확인한 경로만 Living Spine과 해당 Episode Bet에 receipt로 남긴다. ep001은 항상 `required`다. 이후 화는 이미 통과한 전제를 그대로 쓰면 `inherited`, 대형 보상·패배·Anchor를 새로 만들거나 바꾸면 다시 `required`, 해당 고위험 전제를 쓰지 않으면 `not_applicable`이다.

대안 탐색은 모든 산문에 퍼뜨리지 않는다. 작품을 좌우하는 보상 가치·배신 메커니즘·대표 성과 하나에만 기본 `Best-of-5 -> 상위 2개 actor replay -> 1개 채택`을 쓴다. 긴 사고과정 자체가 아니라 후보·근거·반사실·판정을 산출물로 남긴다.

### 고위험 장면 준비 (Scene Forge)

Scene Forge는 1화, 가까운 Anchor, 실제 사건·원문 Story Block이 합리성의 중심인 장면에만 쓰는 비권위 build evidence다. 양식은 `30_materials/source_maps/scene_forge_template.md`, 실행본은 `20_model_runs/<producer>/<run>/scene_forge.md`에 둔다.

- 주안 하나를 깊게 만들고 감리 실패 때만 대안을 만든다.
- 원문/실제 사건의 좌표, 작동 순서, carrier의 유지·변형 결과, 인물 손익, CSU 인과 다리를 기록한다.
- 1화·가까운 Anchor·실제 사건 중심 장면은 전체 원고 전에 짧은 장면 하나로 먼저 실행한다. 별도 stage·상태·재시도 체계를 만들지 않고, 길이 상한도 두지 않는다.
- 전체 메모를 Story Plan이나 Episode Bet에 편입하지 않는다.
- 감리를 통과한 source receipt, 원고로 보낼 구체 물건·행동·반응·관계/보상, 이번 화 결정값만 Episode Bet으로 컴파일한다.

### 작품 척추 (Living Spine)

작품의 판매 약속, 주인공 엔진, 대리만족 구조, 종결 방향을 한눈에 붙든다. 문제를 발견하면 여기부터 고칠 수 있지만, 이미 승인된 원고의 사실은 덮어쓰지 않는다.

Living Spine은 supporting talent·아이템·산업보다 먼저 독자가 살 `주인공 구매 계약`을 둔다. 주인공 정의, 대표 유능함 receipt, 노골적인 야망, 받아야 했던 구체 보상, 부당한 손실, 이번 생 장기 목적이 그 계약이다.

주인공 구매 계약은 PASS한 `Protagonist Operating Identity`를 이어받는다. 현실 직업·반복 동사·극중 사업·능력 밖 실력·이능력의 역할·복리 축적물·최종 거물상이 서로 같은 사람을 가리켜야 한다. 작품 제목이나 능력명을 회사명으로 옮긴 것만으로 작동 정체성을 대신하지 않는다.

`받아야 했던 구체 보상`은 이름·직함·퍼센트만으로 닫지 않는다. 독자가 돈·현금흐름·통제권·관계·다음 선택 중 무엇이 생기는지 한 문장으로 설명할 수 있어야 한다. `대표 유능함 receipt`는 조연의 정답을 채택한 사실과 주인공만 내린 판단·감수한 비용·바꾼 판을 분리하고, 주인공을 삭제한 반사실에서도 결과가 달라져야 한다. `부당한 손실`은 주인공이 합리적인 방어를 했는데도 적대자가 준비된 자원과 비용으로 뚫은 사건이어야 한다.

### 장기 앵커 (Braided Anchor Rail)

시작부터 엔딩까지 **6~12개의 희소한 tentpole**을 박는다. 각 앵커는 `사전 진입 -> 외부/내부 트리거 -> 비가역 환전 -> 1~3화 인간 후폭풍 -> 독자 부채 상환 -> 다음 압력`의 묶음이다. 현대 금융물에서는 숫자 상승만이 아니라 지위·관계·가문·시장에 남는 표면을 함께 박는다.

- 전체 rail은 처음부터 끝까지 희소하게 보인다.
- 가장 가까운 두 앵커만 compound/detailed 상태다.
- 먼 앵커는 방향과 독자 부채만 남긴다.
- 변경은 허용하되 reason과 영향 범위를 남긴다.

### 근접 3화 (Rolling Corridor)

현재 앵커에서 다음 앵커까지의 가변 구간이다. 보통 `현재 1화 committed + 다음 2화 provisional`만 보며, 화수는 목적이 아니라 압력에 맞춰 늘고 줄 수 있다. corridor가 anchor를 바꾸지는 않는다.

### 화별 약속 (Episode Bet)

한 화를 쓰기 직전의 얇은 약속이다. 장면 목록이 아니라 다음을 고정한다.

- 독자가 이 화를 누르는 질문과 이 화 안에 지급받는 효용
- 지급을 증명하는 물건·숫자·문서·호칭과 바뀌는 사회적 상태
- 이번 화에서 독자가 받는 즉시 보상
- 주인공이 거는 선택과 대가
- 현재 상태에서 바뀌는 수치·지위·관계
- 장면 뒤에 남는 인간 후폭풍
- 다음 클릭 압력
- 필요한 Story Block/JIT material receipt
- 조연·아이템·산업·사이다의 선행 정보 의존성과 source/invention/owner-fork 해소 결과
- 독자가 값을 사는 정보 공개 순서와 미해결 owner fork 0건
- 이번 화가 의존하는 Premise Transaction·Character Court의 적용 모드와 실제 PASS receipt

자본·권한·관계 delta는 계획 내부의 변화 좌표다. 원고 발주에는 Story Block에서 통과한 구체 물건·행동·반응·관계/보상을 함께 넘기며, 추상 delta 자체가 장면 해결책이 될 수 없다. `use: new`는 장면을 풍부하게 할 수 있지만 donor의 유지·변형 축을 독자의 주된 인지·행동·보상 축에서 밀어내지 않는다.

화별 약속은 `skip test`를 통과해야 한다. **이 화를 건너뛰어도 다음 화의 쾌감·관계 변화·소유 과정이 그대로라면**, 서사상 필요한 설명이 있어도 reader-facing 화로는 미완성이다. 합치거나 그 화만의 환전·영수증을 만든다. 이 계약은 분석표를 원고에 노출하기 위한 것이 아니라 dispatch 전에 건너뛸 수 있는 화를 잡는 얇은 gate다.

`modern_fantasy` profile을 선택한 작품은 화별 약속에 정적 규칙을 다시 쓰지 않고 이번 화의 CSU 인스턴스만 둔다. CSU는 주인공의 판단·선택·실행 또는 이전 선택의 결과가 돈·사람·권한·관계·적의 비용·시장 반응·실제 관문 통과로 환전되는 한 묶음이다. 고평가는 칭찬 대사가 아니라 가격·호칭·위임·신뢰·경계·대응의 변화로 증명할 수 있다. 화별 약속은 이번 화의 주 시점/화자 거리와, 전문 인과가 실제 행동을 거쳐 독자가 보는 돈·시간·위험·관계 변화로 이어지는 의미 다리를 명시한다. 장면·POV 횟수는 고정하지 않고, 일반 회차의 독립 타인 POV는 기본 0~1개이며 더 쓰면 화별 기능을 밝힌다.

장면은 현재 압력·선택·환전/반응이 닫히거나 다음 장면으로 인계된 뒤 전환한다. 다음 장면은 새 정보·외부 평가·관계 후폭풍·적의 압박·규모 파급·다음 행동 중 하나를 새로 지급해야 하며, 시간·장소 이동이나 재설명만으로는 부족하다. same-POV 전환은 압축과 다음 행동에, 독립 타인 POV는 주인공이 볼 수 없는 값에 쓴다. 장면 수는 고정하지 않는다.

첫 3화의 화별 약속은 시작 전에 committed로 둔다. 이후에는 다음 1화 committed, 뒤 2화 provisional이 기본이다.

여기서 두 `committed`는 층이 다르다. 첫 문장의 committed는 `ep001~003 Episode Bet 파일 각각의 상태`이고, Rolling Corridor control block의 `committed` 목록은 언제나 현재 제작 커서 1화만 둔다. 따라서 신작 시작점에도 Corridor는 `committed: [ep001] / provisional: [ep002, ep003]`이고, ep001~003 Episode Bet 파일 자체는 모두 `상태: committed`다.

## 역방향 재활용

완성된 성공작이나 우리 원고를 역으로 읽을 때 별도 reverse stage를 만들지 않는다.

1. 결과 원고에서 `promise -> pressure -> choice -> conversion -> aftershock -> next pressure` 좌표를 읽는다.
2. 좌표와 출처는 `30_materials/source_maps/`의 stable `block_id`를 가진 Story Block으로 남긴다.
3. 새 피치에서는 조립표가 Story Block을 조립하고, 집필 중에는 화별 약속의 `story_block_receipt`로 필요한 instance만 다시 호출한다.
4. 재사용의 중심은 작동 순서와 물성이다. 고유명·금액·물건·장면 표면은 evidence anchor로 보존하고, 새 작품에서 유지·이름 변경·규모 변경·재배치한 내용을 조립표의 variation으로 밝힌다.
5. 예측 실험은 `20_model_runs/` receipt에만 둔다. 맞혔다는 사실이 정본 권위를 만들지 않는다.

## 감리 — plan contamination 방지

리뷰는 항상 두 번 읽는다.

- **BR0 blind readback:** 현재 원고 + 직전 승인 원고만 읽고 실제로 무슨 일이 일어났는지, 첫 기억 물건·행동·관계와 주인공의 승리가 행동 및 타인의 반응으로 어떻게 보였는지 복원한다.
- **BR1 plan court + compare:** 그 뒤 Premise Transaction·Character Court를 먼저 열어 보상 실질가치·주인공 불가결성·합리적 방어·적대자 비용·행위자 선택을 재판정한다. 이 plan court가 실패하면 원고가 Episode Bet을 정확히 이행했어도 `pass`할 수 없다. 그 뒤 화별 약속, dispatch, Source/Story Block receipt, 근접 3화, 장기 앵커, 상태 스냅샷을 열어 약속과 실제를 비교한다. 유지·변형하기로 한 carrier 기능이 사라졌거나, 출처와 무관한 범용 대체물이 주된 기억·행동 축을 차지하면 surface drift다.

BR0는 1화에서 추가로 네 값을 계획 없이 복원한다: 보상이 왜 탐나는지, 주인공이 정상적인 방어를 했는지, 적대자가 어떤 비용과 수단으로 이겼는지, 주인공을 삭제하면 같은 결과가 나는지. 복원되지 않으면 `FATAL_FLAW 없음`으로 닫지 않는다.

surface drift가 Source Map·조립표·Scene Forge·dispatch 중간에서 이미 생겼다면 가장 먼저 끊긴 build evidence로 돌아간다. dispatch까지 살아 있고 원고에서만 사라졌다면 원고 후보만 다시 만든다. 문서·계약이라는 명사를 금지하지 않는다. 출처 있는 구체 행동·반응·보상 연쇄에 참여하면 재료이고, 그 연쇄를 대신하는 범용 마스터키가 되면 실패다.

BR0와 BR1이 갈리면 계획에 맞춰 원고를 자동 수정하지 않는다. owner HIL에서 `원고 채택 / 계획 수정 / 명시적 retcon` 중 하나를 고른다. 생산자 self-review는 최종 승격이 아니다.

## 재료 정책

ESM, QRP, CHARACTER, **페이싱 패턴**(`30_materials/block/`), howlib는 **JIT side material**이다. 조립표 또는 화별 약속에 필요할 때만 조회한다. 출처 없이 계속 불어나는 generic 장면 bank·캐릭터 bank·움직임 bank를 더 만들지 않는다. 재활용 단위는 stable ID와 입출력 계약을 가진, 출처가 보이는 작은 Story Block이다.

## 마이그레이션 경계

- 새 작품과 재개된 작품은 이 루프를 쓴다.
- 2026-07-11 활성작 `chaebol_heir_futures_regression`은 `imported_legacy_bridge`로 전진 전환한다.
- 이 활성작은 legacy 호환성을 검증하는 fixture일 뿐이다. 작품별 작품 척추·장기 앵커·화별 약속 내용은 공통 규칙이 아니며, portfolio focus를 다른 작품으로 바꿔도 template·schema·relay를 다시 설계하지 않는다.
- parked/archive 작품의 기존 `north_star / blueprint / draft`는 역사 증거로 동결한다. 재개 시점에만 v2 표면을 만든다.
- 기존 파일을 새 이름으로 복사해 권위를 세탁하지 않는다. manuscript manifest에 실제 경로·해시·권위 수준을 명시한다.
