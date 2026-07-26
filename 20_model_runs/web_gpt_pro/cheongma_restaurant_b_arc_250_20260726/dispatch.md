# 천마식당 250화 B-Arc 보강 제안 dispatch

- work_slug: `cheongma_restaurant`
- producer: Web GPT Pro
- purpose: owner 판단용 B-Arc 보강 제안 후보. 캐논 승격·원고 수정·Storyyard 전송 없음.
- sent_at: `2026-07-26T21:24:32+09:00`
- subscription_lane: `thin` interactive Web GPT Pro
- chat_url: pending response identity

## Web GPT Pro 첨부 확인

| order | attached file | SHA-256 |
|---:|---|---|
| 1 | `40_works/cheongma_restaurant/04_manuscript/ep001_manuscript.md` | `4305abcf8dcb3d6573966c22e8e476f46c5aec5a308da98c5917dca55db1149b` |
| 2 | `40_works/cheongma_restaurant/04_manuscript/ep002_manuscript.md` | `41150f58031faeb615f3585da4cbac3e3eccdf7b4e299f6e02a029aba75661f1` |
| 3 | `40_works/cheongma_restaurant/04_manuscript/ep003_manuscript.md` | `34103c8c6f567278ae2b99463374181ead884b8268b935e754a4b910772e0de8` |
| 4 | `40_works/cheongma_restaurant/08_state/narrative_state.yaml` | `e803e2ec6465f24d42b9e7dac53b0602d3b61577c885ad5c0a26689eeb4c4750` |
| 5 | `40_works/cheongma_restaurant/02_story/living_spine.md` | `a0e021706dba6744a560ddcc5bf6d0bbc3757063afc024cc85188af18d5a9fd4` |
| 6 | `40_works/cheongma_restaurant/02_story/anchor_rail.md` | `f8a4aef2190777dfd77b510b1bb6009170a15b8aca5f2121fda597aecf8cf88c` |
| 7 | `40_works/cheongma_restaurant/02_story/arc_route_rail.md` | `4989d9baa4e528a866ec880915fbbfc865ce875439655373fcba06e6b44f91ff` |
| 8 | `40_works/cheongma_restaurant/02_story/rolling_corridor.md` | `178b9578c0438dc28a2b66fb779f565bee35bc0aab6f815a0ed447f9a5943915` |

## Drive connector source set

Web GPT Pro message carried the active Google Drive connector and instructed it to read these exact accessible source files. The exact source bytes were also stored in the shared ignored runtime cache after the prompt was sent; hashes below are hashes of those downloaded cache files.

| title | Drive ID | current revision ID | cache path | SHA-256 | size bytes | modified at | selection role |
|---|---|---|---:|---|---|
| `레벨 업! 하는 식당(1~266화)_인기영_합본.txt` | `1PHIg_wweQ47KaG-kk29oSjGgJOTtXSyf` | `0B1012eYEk2B_ZitDR1pPb2JDNjV2bGpCVzZCZm8vSkNURVk4PQ` | `.hermes/source-cache/drive/레벨 업! 하는 식당(1~266화)_인기영_합본.txt` | `de47eee671a7e631193289d860c3217c8a03ef0f3477c04bfef32d038e8a9d02` | 4,707,201 | `2026-05-22T01:34:56.158Z` | 식당 성장·고객 만족 환전·266화 장기 페이싱 |
| `이 요리사는 계속 회귀합니다_인기영_합본.txt` | `1Xkm2J2Biy9Kd5XZyRUdcSXlOM7zSBVkV` | `0B1012eYEk2B_RFd3L0ZDSVp5ckM0NktwMzJxYUtBN2hxVmVJPQ` | `.hermes/source-cache/drive/이 요리사는 계속 회귀합니다_인기영_합본.txt` | `f639372363f86072b9c68c8a334523ddbd983e504d684361c39556835f8b42cc` | 3,166,618 | `2026-05-22T01:39:44.242Z` | 요리 주인공의 반복 판단·변주와 사건 속도 |
| `가리봉 마왕족발_디케이_합본.txt` | `19GAA8me1YalZURCvkIBh4ir1satPUmjr` | `0B1012eYEk2B_TWhzWmpqbWVyRi9kTG5SMVEwZ1pvMlREMkRnPQ` | `.hermes/source-cache/drive/가리봉 마왕족발_디케이_합본.txt` | `bb17a0f969d5759649f2cdf5cf94a8fa4feba202ed11b9bfe1d822bc2cf1890e` | 2,794,373 | `2026-05-22T03:01:52.510Z` | 현대 식당 운영·비현실 주인공 작동·상업 보상 |

## Requested output contract

- 250화 목표, 1~5화 가변 B-Arc, 평균 약 3화.
- B001~B005 보강과 B006~B084 가설 슬롯; B close 후 승인 원고 기준 reflow.
- 먼 슬롯은 기능·보상·부채·직전 대비·길이 band만 쓰고 미래의 구체 사건·인물·음식·수치를 잠그지 않음.
- 원응답을 그대로 보존하며, 별도 Codex 검토는 proposal만 작성.
- 조판 검수: 지문/대사 간 공백, 독립 블록, `###` 장면전환의 요청 규칙 포함.
