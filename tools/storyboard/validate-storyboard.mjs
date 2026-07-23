import fs from 'node:fs';
import path from 'node:path';

function usage() {
  console.error('Usage: node validate-storyboard.mjs --source <storyboard.md> --board <storyboard.excalidraw>');
  process.exit(2);
}

function argsOf(argv) {
  const args = {};
  for (let i = 0; i < argv.length; i += 1) {
    if (!argv[i].startsWith('--')) usage();
    args[argv[i].slice(2)] = argv[i + 1];
    i += 1;
  }
  return args;
}

const args = argsOf(process.argv.slice(2));
if (!args.source || !args.board) usage();

const sourcePath = path.resolve(args.source);
const boardPath = path.resolve(args.board);
const source = fs.readFileSync(sourcePath, 'utf8');
const board = JSON.parse(fs.readFileSync(boardPath, 'utf8'));
const episodeIds = [...source.matchAll(/^# (EP\d+)$/gm)].map((match) => match[1]);
const sceneIds = [...source.matchAll(/^## (EP\d+-S\d+)$/gm)].map((match) => match[1]);
const errors = [];

if (board.type !== 'excalidraw') errors.push(`board.type must be excalidraw, got ${board.type}`);
if (board.version !== 2) errors.push(`board.version must be 2, got ${board.version}`);
if (!Array.isArray(board.elements)) errors.push('board.elements must be an array');

const elementIds = new Set();
const keys = new Set();
for (const element of board.elements ?? []) {
  if (!element.id) errors.push(`element without id: ${JSON.stringify(element).slice(0, 120)}`);
  if (elementIds.has(element.id)) errors.push(`duplicate element id: ${element.id}`);
  elementIds.add(element.id);
  const key = element.customData?.storyboard?.key;
  if (!key) errors.push(`element missing storyboard key: ${element.id}`);
  else if (keys.has(key)) errors.push(`duplicate storyboard key: ${key}`);
  else keys.add(key);
  if (element.type === 'text' && !String(element.text ?? '').trim()) errors.push(`blank text element: ${element.id}`);
}

for (const episodeId of episodeIds) {
  for (const suffix of ['column', 'header', 'header-text', 'summary', 'summary-title', 'summary-body', 'ending-title', 'ending-body']) {
    const key = `${episodeId}:${suffix}`;
    if (!keys.has(key)) errors.push(`missing episode element: ${key}`);
  }
}

for (const sceneId of sceneIds) {
  for (const suffix of ['card', 'id', 'title', 'summary', 'characters']) {
    const key = `${sceneId}:${suffix}`;
    if (!keys.has(key)) errors.push(`missing scene element: ${key}`);
  }
}

const result = {
  source: sourcePath,
  board: boardPath,
  episodes: episodeIds.length,
  scenes: sceneIds.length,
  elements: board.elements?.length ?? 0,
  arrows: (board.elements ?? []).filter((element) => element.type === 'arrow').length,
  errors,
};

console.log(JSON.stringify(result, null, 2));
if (errors.length) process.exit(1);
