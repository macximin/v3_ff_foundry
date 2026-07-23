# Excalidraw storyboard tool

블루프린트의 의미 구조와 사람이 직접 만지는 공간 배치를 분리한다.

- `storyboard.md`: LLM이 읽고 수정하는 의미 원본
- `storyboard.excalidraw`: 사람이 위치·화살표·메모·그림을 직접 수정하는 보드
- `storyboard-preview.svg`: 빠른 검수용 정적 미리보기

## 1. 블루프린트에서 의미 원본 만들기

```powershell
node tools/storyboard/extract-blueprints.mjs `
  --blueprints 40_works/<work_slug>/03_blueprint `
  --output 40_works/<work_slug>/08_storyboard/storyboard.md `
  --from 1 `
  --to 10 `
  --title "작품명"
```

## 2. Excalidraw 보드 만들기

```powershell
node tools/storyboard/build-excalidraw.mjs `
  --source 40_works/<work_slug>/08_storyboard/storyboard.md `
  --output 40_works/<work_slug>/08_storyboard/storyboard.excalidraw `
  --preview 40_works/<work_slug>/08_storyboard/storyboard-preview.svg
```

기존 `.excalidraw`는 사람 수정본이므로 기본적으로 덮어쓰지 않는다. 의도적으로 재생성할 때만 `--force true`를 붙인다.

## 3. 의미 원본과 보드 연결 검증

```powershell
node tools/storyboard/validate-storyboard.mjs `
  --source 40_works/<work_slug>/08_storyboard/storyboard.md `
  --board 40_works/<work_slug>/08_storyboard/storyboard.excalidraw
```

## 운용 계약

1. 인과·장면 목적·요약·긴장도는 `storyboard.md`에서 고친다.
2. 위치·그룹·손그림·추가 화살표는 Excalidraw에서 고친다.
3. 보드를 재생성하면 수동 배치가 사라지므로, 재생성 전 기존 보드를 복제하거나 버전 관리한다.
4. 원고는 읽기 전용이다. 이 도구는 blueprint와 storyboard 표면만 다룬다.

## JSON Canvas 계층 만들기

Obsidian/JSON Canvas용 `master → block → episode` 계층을 만든다.

```powershell
node tools/storyboard/build-json-canvas.mjs `
  --source 40_works/<work_slug>/08_storyboard/storyboard.md `
  --output-dir 40_works/<work_slug>/08_storyboard/canvas `
  --vault-root . `
  --block-size 5 `
  --master-columns 10
```

생성 결과:

- `canvas/master.canvas` — 작품 전체 척추
- `canvas/blocks/B001.canvas` — 블록별 회차 인과선
- `canvas/episodes/EP001.canvas` — 회차별 씬 스트립

`.canvas` 역시 사람의 공간 배치를 보존하기 위해 기본적으로 덮어쓰지 않는다. 의도적인 초기화에만 `--force true`를 사용한다.

- 250화 기준: 5화 블록 50개를 마스터에서 10열 × 5행으로 배치한다.
- 출력 전 전체 경로와 기존 파일을 먼저 검사하므로 중간까지만 생성되는 반쪽 상태를 만들지 않는다.
- 쓰기 없이 입력·참조·충돌만 검사하려면 `--dry-run true`를 사용한다.

```powershell
node tools/storyboard/validate-json-canvas.mjs `
  --canvas-dir 40_works/<work_slug>/08_storyboard/canvas `
  --vault-root .
```

Advanced Canvas가 연 파일에는 최상위 `metadata`가 추가될 수 있다. 기본 검증은 이를 경고로 표시하고, 순수 JSON Canvas만 허용하려면 `--strict true`를 붙인다.
