# Web GPT Pro readback validation — 로판식당 B-Arc pacing proposal

상태: `passed_with_non_authoritative_model_hash_mismatch`

## Authority rule

이 검증의 원본 식별자는 로컬 shared cache 파일의 filename·Drive ID·`shasum -a 256` 결과다. Web GPT Pro가 응답 안에서 말한 SHA-256 및 바이트 수는 모델의 readback 관찰일 뿐, 정본도 차단 조건도 아니다.

## Exact local source identity

| original | Drive ID | local cache SHA-256 (`shasum -a 256`) | model-readback title/Drive ID match |
| --- | --- | --- | --- |
| `레벨 업! 하는 식당(1~266화)_인기영_합본.txt` | `1PHIg_wweQ47KaG-kk29oSjGgJOTtXSyf` | `de47eee671a7e631193289d860c3217c8a03ef0f3477c04bfef32d038e8a9d02` | yes |
| `이 요리사는 계속 회귀합니다_인기영_합본.txt` | `1Xkm2J2Biy9Kd5XZyRUdcSXlOM7zSBVkV` | `f639372363f86072b9c68c8a334523ddbd983e504d684361c39556835f8b42cc` | yes |
| `공감의 요리사_진시월_합본.txt` | `1DuLsd_Xe1BT_PSZseRixPnMpUmr6kj-e` | `f182ef11c875443ef43b2bc906cd326de2a7af732aba8132efe1353f791a2044` | yes |

## Success-original content comparison

| Web GPT readback fact used in proposal | local-cache evidence | result |
| --- | --- | --- |
| `레벨 업! 하는 식당`: 1포인트=1,000원, 274포인트=27만4천원; 목표 100/100 | local text lines 1167, 5439 contain those exact values | match |
| `이 요리사는 계속 회귀합니다`: 실패 15포인트/성공 150포인트, 신비석 150kg 노동량 | local text lines 887–910 contain the exact stakes and quantity | match |
| `이 요리사는 계속 회귀합니다`: 음식 보상이 생존 의지·공동체 행동으로 환전됨 | local text lines 912, 1062, 1124, 1156 connect 통닭·맥주와 삶의 애착 회복 | match |
| `공감의 요리사`: 같은 재료·요리법이어도 숙련/방식에 따라 맛이 달라진다는 한계 | local text lines 5590 and 8196 contain those exact comparisons | match |
| `공감의 요리사`: 영업·재료 한계가 계속 노출됨 | local text lines 16195 and 19922 confirm 재료 분류·당일 소진·유통기한 제약 | match |

모델 원응답의 외부작품 해석은 위처럼 실제 원문의 확인 가능한 사실을 출발점으로 한다. 다만 문체, 전체 플롯, 상업적 성과나 완결 분량을 이 검증에서 새로 확정하지 않는다.

## Work-packet content comparison

| packet surface | local SHA-256 (`shasum -a 256`) | readback / proposal fact | result |
| --- | --- | --- | --- |
| `ep001_manuscript.md` | `d9c9ac96f92fd88628fd6b73296c6786357d578cac3839cda7ca20c86484970e` | ep001~ep003 approved-only baseline | match |
| `ep002_manuscript.md` | `36dffade38e4828d6003901cc529aab8aad0c32c3ff95db78d00c23de3b3a38d` | 30일/2,300금화 pressure and later role conflict analysis | match; source-of-truth is approved manuscript where conflicts arise |
| `ep003_manuscript.md` | `22e4fab16e2ff172edff2fcc01d71f15761b12f130589595e9aa39367d2c9632` | 테오도르 번호표·예약 재고 separation | match |
| `narrative_state.yaml` | `3c1814e58731ee7dfa89116b9dc53944a53e84c7e75d28ff38cabe7cb8c54a9a` | reserved 42, walk-in 40, planned 82; 오스발트 role record | match; role conflict is correctly surfaced, not resolved canonically |
| `rolling_corridor.md` | `b0116030de6bca8d83eca43e01d5c35b716dc41a9399db4512a2ad0d175c788a` | B002 at ep004; 42+40=82; 100+ demand; B003 only after B002 close | match |
| `living_spine.md` | `96f9c7d72c7ac05ed9801144709388fa19127d458bbe2c75c535927f9d5f8d38` | family rescue, cooking management, fair dealing basis | match |
| `anchor_rail.md` | `bdb31fdd1d1f34b55973851c7760ec967548603a850fa02ddcc3b50290be965a` | A01~A08 capacity framing | match |
| `arc_route_rail.md` | `4b7dfea7606ae05a9e644332bf59fa72411533bd2b015e51e5940102ed488566` | B001 closed, B002 active, route/ID policy caution | match |

## Decision

The model-reported SHA-256 mismatch is a non-authoritative observation only. Title, Drive ID, local hash authority, and the readback facts used by the proposal all pass comparison. Therefore the mismatch is **not a blocker**; no recovery chat or duplicate dispatch is authorized or needed.

Canon, Git history, Storyyard, approval state, and all Story Plan surfaces remain unchanged.
