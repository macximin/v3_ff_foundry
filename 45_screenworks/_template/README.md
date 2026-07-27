# Screenwork 초기화

이 폴더는 `Firefly Screenplay Loop v1`의 복사 가능한 family + variant 골격이다.

1. `_template`을 `45_screenworks/<screen_family_slug>/`로 복사한다.
2. `00_family/family_manifest.yaml`의 family ID와 공통 core를 채운다.
3. `variants/_template`을 `variants/<screenwork_id>/`로 바꾸고 모든 ID를 맞춘다.
4. 원작 각색이면 `00_source_manifest.yaml`에 정확한 source revision SHA-256을 고정한다. 영상 오리지널이면 `source_kind: screen_original`을 유지한다.
5. `Screen Brief -> Format Bible -> Season Design -> Episode Promise -> Scene Cards -> Timed Script` 순서로 채운다.
6. `tools/screenplay_relay/Invoke-ScreenplayDoctor.ps1`로 읽기 전용 검사를 통과시킨다.
7. BR0가 봉인된 뒤에만 BR1을 기록한다. owner가 정확한 Fountain SHA-256을 승인한 뒤에만 approved manifest와 Planning State를 전진시킨다.

큰 binary는 개인 Google Drive의 `working/` 또는 `approved/`에 두고 Git에는 manifest만 둔다. Drive root ID는 repo가 아니라 `.env`에 둔다.

이 template은 소설 `40_works/`에 복사하거나 대본 도구의 대상으로 주지 않는다.
