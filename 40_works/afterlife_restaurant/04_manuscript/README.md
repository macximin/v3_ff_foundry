# Manuscript

사람이 승인한 **정확한 원고 revision**이 이미 일어난 이야기의 최고 권위다.

- 새 원고: `epNNN_manuscript.md`
- revision·승인·해시는 `manifest.yaml`에 기록한다. owner 승인 entry는 `{ episode, repo_snapshot: epNNN_manuscript.md, sha256, authority: owner_approved }`를 기본으로 쓴다.
- `repo_snapshot`은 manifest 파일 기준 상대경로다. relay는 폴더에서 최신 파일을 추측하지 않고 이 경로와 해시만 직전 endpoint로 고른다.
- entry의 `published: true`는 그 화가 게시되었다는 사실만 뜻하며, 그 entry 파일이 게시 revision과 동일하다는 뜻이 아니다.
- review pass만으로 승인되지 않는다. owner approval이 있어야 `approved`다.
- 파일이 다른 시스템이나 레거시 경로에 있으면 복사해 정본인 척하지 않고 manifest가 그 경로와 권위 수준을 가리킨다.
- Narrative State는 manifest의 승인 해시를 기준으로 재생성한다.
- `ep001_manuscript.md`~`ep003_manuscript.md`는 `2026-07-25` 승인 history다. 현재 정본은 manifest가 가리키는 `ep001_v2_manuscript.md`, `ep002_v2_manuscript.md`, 장면전환만 보완한 `ep003_v3_manuscript.md`, `ep004_manuscript.md`다.
