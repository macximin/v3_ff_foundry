# 저승식당 v1-rc3.2 수신대장

- 기준 버전: `v1-rc3.1`
- 생산자: Web GPT Pro
- 감리자: Codex Desktop `gpt-5.6-terra`
- authority: `noncanonical_manuscript_candidate`
- canonical: false
- 생산 대화: https://chatgpt.com/c/6a63fee8-4edc-83ee-bc44-cee6f263b694
- 수신 완료 시각: `2026-07-25T10:19:06+09:00`
- 패치 명세: `patch_spec.md`
- 패치 명세 SHA-256: `14c451741e0448333595e68aaea70547e47bae033d65eee337e9132faaae7f2f`

## ep001

- 기준 첨부: `v1-rc3.1/ep001.txt`
- 기준 SHA-256: `b1b53827ac44c87006f3fefc58e3c94801b7a8a25b048f907422270978d1e5df`
- 대화 첨부 칩: `ep001(7).txt`, `patch_spec(7).md`
- 사용자 메시지 ID: `250a37f3-4c02-47c3-996f-8a78fe4205a2`
- 응답 메시지 ID: `46555b15-fb9f-4e71-847e-e4c00b8d113a`
- DOM 응답 문자 수: 10,060자
- 로컬 저장 문자 수: 10,061자
- 원문 일치: DOM 응답과 정확히 일치하며 파일 종결 LF만 추가
- 기준본 대비 차이: `18:37` 뒤 시간축 설명 한 문단 추가
- 저장 SHA-256: `2b8d1bca981c1c7b0731c918e581b36ce7d4d1dc169bec4571311eab72eb241a`

## ep002

- 처리: `v1-rc3.1/ep002.txt` 바이트 동일 승계
- 문자 수: 12,531자
- SHA-256: `6baec3ac49cc771f6e9be445347bfda6faa5dea0de9281d6e1dbf33b8aebb94c`

## ep003

- 기준 첨부: `v1-rc3.1/ep003.txt`
- 기준 SHA-256: `0b2c2a4207ecd905197d37ba0e5b5070d90fbbb7f08a8434be5832de9612c78f`
- 대화 첨부 칩: `ep003(8).txt`, `patch_spec(8).md`
- 사용자 메시지 ID: `a460a0d0-0262-43d5-8ab8-870c599359e7`
- 응답 메시지 ID: `73c12523-8c2c-4032-902a-b258d427ac59`
- DOM 응답 문자 수: 13,579자
- 로컬 저장 문자 수: 13,580자
- 원문 일치: DOM 응답과 정확히 일치하며 파일 종결 LF만 추가
- 기준본 대비 차이:
  - 시식 대사에서 공개 신분 호칭 제거
  - 계산원 배치 대사에서 공개 신분 호칭 제거
  - `정체는 숨기고` 앞에 낮은 목소리 명시 한 문단 추가
- 저장 SHA-256: `65ab2508218b7dfb1b462f2daa37d96712e307d9cc4ce554575675eca320d6ad`

## 저장·승격 경계

- `v1-rc3.2`는 캐노니컬 직전 후보일 뿐 승인 원고가 아니다.
- Web GPT Pro 생산 응답을 회차별로 동결했다.
- Codex 차분 감리 `GO`, BR0 `complete`, BR1 `pass`를 완료했다.
- 사용자 명시적 Adopt 전에는 `v1.0-canon`, `40_works`, 승인 manifest 또는 Narrative State를 만들지 않는다.

## 캐노니컬 후보 패킷

- 작성 완료: `2026-07-25T10:43:13+09:00`
- 경로: `canonical_candidate/`
- compiler / reviewer: Codex Desktop `gpt-5.6-terra`
- manuscript producer: Web GPT Pro
- Pitch Candidate 문자 수: `7,282자`
- Pitch gate: reviewer checks pass / owner decision pending
- Protagonist Operating Identity: pass
- Premise Transaction: pass
- Character Court: pass
- retrospective Episode Bet: ep001~ep003 작성
- BR1: `PASS — OWNER ADOPT DECISION READY`
- owner packet: `canonical_candidate/adopt_packet.md`
- packet manifest: `canonical_candidate/SHA256SUMS`
- packet manifest SHA-256: `375438a7b46c93f14c58426eb58a5c023f951c2cdfcf9578c16e321772f459ac`

후보 문서 안에서 `연화`, `곽진복`, 개인별 변동 노잣돈, 도윤의 대회 과몰입에 따른 식당 운영 공백을 work-local 값으로 닫았다. 이 값과 미래 계획은 owner가 작품을 Adopt하기 전까지 캐노니컬 사실이 아니다.
