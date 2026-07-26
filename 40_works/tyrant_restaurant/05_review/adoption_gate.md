# Candidate manuscript adoption gate

Phase A에서 생성한 원고 후보는 아래의 오너 결정을 받기 전까지 production receipt일 뿐 canonical manuscript가 아니다.

## Candidate set

| episode | file | SHA-256 | current review |
|---|---|---|---|
| ep001 | `ep001_revised.txt` | `127efdd4a70bdfbca0e313b05fe9a642ebcb9c40c5cfa4fb7384b87d11fd54ac` | candidate review only |
| ep002 | `ep002_revised.txt` | `a86b7fa75219f9356d0155594aa4b4d8c0ddeccdabe4cda388540e4b0393e60d` | candidate review only |
| ep003 | `ep003_v2_revised.txt` | `4968744ccb5ec55ac472efa48b9c2bfa07fe93da0c6bf21d27cc688ecb47a39d` | BR0 PASS / BR1 PASS |

## Required owner instruction

`ADOPT tyrant_restaurant ep001 <sha> ep002 <sha> ep003 <sha>`처럼 대상과 해시를 지정하거나, 회차별 수정 지시를 낸다.

## After adoption only

1. `03_episode_bet/ep001`–`ep003`을 채택 사실에 맞춰 기록한다.
2. `04_manuscript/manifest.yaml`과 `08_state/narrative_state.yaml`을 만든다.
3. `00_status.md`의 manuscript/approved/reviewed/state cursor를 검증 가능한 범위에서만 전진시킨다.
4. 다음 B001 회차의 bet → manuscript → BR0/BR1 순서를 시작한다.
