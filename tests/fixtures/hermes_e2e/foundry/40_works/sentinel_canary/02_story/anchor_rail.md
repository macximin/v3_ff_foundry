# Sentinel Canary A-Rail

상태: fixture_only

이 레일은 A-Rail 존재 gate를 검증하기 위한 합성 데이터다. 실제 이야기
도착점이 아니다.

| anchor | 상태 | 진입 | trigger | 비가역 환전 | 인간 후폭풍 | 독자 부채/상환 | 다음 압력 |
|---|---|---|---|---|---|---|---|
| A01 | compound | fixture start | local canary | artifact exists | none | verifier pass | stop |
| A02 | compound | verifier pass | receipt readback | local hash | none | no production | stop |
| A03 | sparse | synthetic | synthetic | synthetic | none | none | stop |
| A04 | sparse | synthetic | synthetic | synthetic | none | none | stop |
| A05 | sparse | synthetic | synthetic | synthetic | none | none | stop |
| A06 | sparse | synthetic | synthetic | synthetic | none | none | stop |
