# Hermes ticket-to-artifact E2E fixture

이 디렉터리는 Mac mini의 Hermes/Sentinel 연결을 검증하기 위한 **비운영
fixture**다. 실제 작품, 실제 작가 배정, Web GPT Pro 발주, owner 승인,
Storyyard 투영·발행과 아무 관계가 없다.

## 경계

- synthetic work slug는 `sentinel_canary`다.
- fixture writer registry는 `author_cheese` 한 명을 fixture 작품에만 배정한다.
- 실제 `00_charter/hermes_writer_operations.json`과 `40_works/`는 읽거나
  수정하지 않는다.
- 실행 출력은 `foundry/.runtime/ep004_candidate.md` 한 파일만 허용한다.
  `.runtime/`은 Git에서 제외된다.
- `foundry/receipts/ep004_wgp.md`는 ep005 경로·SHA와 B011 격리 검사용
  합성 영수증이며 실제 Web GPT Pro 실행 권위가 아니다.
- 생성 후보는 `authority: noncanonical_test_artifact`,
  `production_eligible: false`, `storyyard_publishable: false`를 가져야 한다.
- canary를 production `Ready` 티켓, Web GPT Pro 요청, 실제 원고 승격,
  Storyyard publish로 재사용하지 않는다.

## 정적 fixture 검증

```sh
cd /Users/a2501/Desktop/v3_firefly_studio/edge_repos/v3_ff_foundry
python3 tests/fixtures/hermes_e2e/verify_candidate.py --fixture-only
python3 -m unittest discover -s tests -p 'test_hermes_e2e_fixture.py' -v
```

## 생성 후보 검증

canary 실행자가 지시서대로 ignored runtime 파일을 만든 뒤 아래만 실행한다.

```sh
python3 tests/fixtures/hermes_e2e/verify_candidate.py \
  --candidate tests/fixtures/hermes_e2e/foundry/.runtime/ep004_candidate.md
```

검증 성공 JSON의 `sha256`은 이 synthetic 후보의 로컬 영수증일 뿐이다.
manuscript manifest나 Narrative State에 옮기지 않는다.
