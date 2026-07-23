import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';

function usage() {
  console.error('Usage: node build-excalidraw.mjs --source <storyboard.md> --output <board.excalidraw> [--preview <board.svg>] [--force true]');
  process.exit(2);
}

function argsOf(argv) {
  const args = {};
  for (let i = 0; i < argv.length; i += 1) {
    const key = argv[i];
    if (!key.startsWith('--')) usage();
    args[key.slice(2)] = argv[i + 1];
    i += 1;
  }
  return args;
}

function unquote(value) {
  const trimmed = value.trim();
  if (trimmed.startsWith('"')) return JSON.parse(trimmed);
  return trimmed;
}

function fields(block) {
  const out = {};
  for (const line of block.split(/\r?\n/)) {
    const match = line.match(/^- ([a-z_]+):\s*(.*)$/);
    if (match) out[match[1]] = unquote(match[2]);
  }
  return out;
}

function parseSource(text) {
  const metaRegion = text.split(/^# EP\d+/m)[0];
  const meta = fields(metaRegion);
  const episodes = [];
  const epRegex = /^# (EP\d+)\s*\n([\s\S]*?)(?=^# EP\d+|(?![\s\S]))/gm;
  for (const epMatch of text.matchAll(epRegex)) {
    const id = epMatch[1];
    const body = epMatch[2];
    const beforeScenes = body.split(/^## /m)[0];
    const episode = { id, ...fields(beforeScenes), scenes: [] };
    const sceneRegex = /^## (EP\d+-S\d+)\s*\n([\s\S]*?)(?=^## EP\d+-S\d+|(?![\s\S]))/gm;
    for (const sceneMatch of body.matchAll(sceneRegex)) {
      episode.scenes.push({ id: sceneMatch[1], ...fields(sceneMatch[2]) });
    }
    episodes.push(episode);
  }
  return { meta, episodes };
}

function stableId(key) {
  return crypto.createHash('sha1').update(key).digest('hex').slice(0, 20);
}

function baseElement(type, key, x, y, width, height, extra = {}) {
  return {
    id: stableId(key),
    type,
    x,
    y,
    width,
    height,
    angle: 0,
    strokeColor: '#1e1e1e',
    backgroundColor: 'transparent',
    fillStyle: 'solid',
    strokeWidth: 2,
    strokeStyle: 'solid',
    roughness: 1,
    opacity: 100,
    groupIds: [],
    frameId: null,
    index: null,
    roundness: type === 'rectangle' ? { type: 3 } : null,
    seed: Number.parseInt(stableId(`${key}:seed`).slice(0, 8), 16),
    version: 1,
    versionNonce: Number.parseInt(stableId(`${key}:nonce`).slice(0, 8), 16),
    isDeleted: false,
    boundElements: [],
    updated: Date.now(),
    link: null,
    locked: false,
    customData: { storyboard: { key, generated: true } },
    ...extra,
  };
}

function rectangle(key, x, y, width, height, color, stroke = '#1e1e1e') {
  return baseElement('rectangle', key, x, y, width, height, {
    strokeColor: stroke,
    backgroundColor: color,
  });
}

function wrap(text, max = 32) {
  const words = String(text ?? '').split(/\s+/).filter(Boolean);
  const lines = [];
  let line = '';
  for (const word of words) {
    if (!line) line = word;
    else if ([...`${line} ${word}`].length <= max) line += ` ${word}`;
    else {
      lines.push(line);
      line = word;
    }
  }
  if (line) lines.push(line);
  return lines.join('\n');
}

function textElement(key, text, x, y, width, height, size = 20, color = '#1e1e1e', align = 'left') {
  const wrapped = wrap(text, Math.max(10, Math.floor(width / (size * 0.58))));
  return baseElement('text', key, x, y, width, height, {
    strokeColor: color,
    backgroundColor: 'transparent',
    strokeWidth: 1,
    roughness: 0,
    fontSize: size,
    fontFamily: 5,
    text: wrapped,
    originalText: wrapped,
    autoResize: false,
    lineHeight: 1.25,
    textAlign: align,
    verticalAlign: 'top',
    containerId: null,
  });
}

function arrow(key, x1, y1, x2, y2, color = '#868e96') {
  return baseElement('arrow', key, x1, y1, x2 - x1, y2 - y1, {
    strokeColor: color,
    backgroundColor: 'transparent',
    points: [[0, 0], [x2 - x1, y2 - y1]],
    lastCommittedPoint: null,
    startBinding: null,
    endBinding: null,
    startArrowhead: null,
    endArrowhead: 'arrow',
    elbowed: false,
  });
}

const colors = {
  opening_hook: '#d0ebff',
  tension_build: '#fff3bf',
  dialogue_duel: '#ffe3e3',
  emotional_reveal: '#e5dbff',
  cliffhanger: '#d3f9d8',
  default: '#f1f3f5',
};

function buildBoard(data) {
  const elements = [];
  const columnWidth = 430;
  const gap = 50;
  const left = 180;
  const headerY = 160;
  const summaryY = 285;
  const scenesY = 550;
  const sceneHeight = 195;
  const sceneGap = 32;
  const bottomY = scenesY + 5 * (sceneHeight + sceneGap) + 40;

  elements.push(textElement('board:title', data.meta.title || 'Storyboard', left, 40, 1500, 70, 36, '#212529'));
  elements.push(textElement('board:legend', '파랑=도입  노랑=긴장  빨강=대결  보라=내면/정보  초록=절단', left, 100, 1000, 40, 18, '#495057'));

  data.episodes.forEach((episode, epIndex) => {
    const x = left + epIndex * (columnWidth + gap);
    elements.push(rectangle(`${episode.id}:column`, x - 18, headerY - 18, columnWidth + 36, bottomY - headerY + 70, '#ffffff', '#ced4da'));
    elements.push(rectangle(`${episode.id}:header`, x, headerY, columnWidth, 90, '#212529', '#212529'));
    elements.push(textElement(`${episode.id}:header-text`, `${Number(episode.id.slice(2))}화`, x + 22, headerY + 18, 160, 48, 28, '#ffffff'));

    elements.push(rectangle(`${episode.id}:summary`, x, summaryY, columnWidth, 210, '#f8f9fa', '#868e96'));
    elements.push(textElement(`${episode.id}:summary-title`, '핵심 긴장', x + 20, summaryY + 18, 150, 30, 17, '#e03131'));
    elements.push(textElement(`${episode.id}:summary-body`, episode.core_tension, x + 20, summaryY + 52, columnWidth - 40, 75, 18));
    elements.push(textElement(`${episode.id}:ending-title`, '회차 착지', x + 20, summaryY + 132, 150, 28, 17, '#2b8a3e'));
    elements.push(textElement(`${episode.id}:ending-body`, episode.expected_ending, x + 20, summaryY + 162, columnWidth - 40, 42, 17));

    episode.scenes.forEach((scene, sceneIndex) => {
      const y = scenesY + sceneIndex * (sceneHeight + sceneGap);
      const color = colors[scene.type] || colors.default;
      elements.push(rectangle(`${scene.id}:card`, x, y, columnWidth, sceneHeight, color));
      elements.push(textElement(`${scene.id}:id`, `${scene.id}  긴장 ${scene.tension}/10`, x + 18, y + 14, columnWidth - 36, 26, 15, '#495057'));
      elements.push(textElement(`${scene.id}:title`, scene.title, x + 18, y + 44, columnWidth - 36, 38, 23, '#212529'));
      elements.push(textElement(`${scene.id}:summary`, scene.summary, x + 18, y + 88, columnWidth - 36, 72, 17, '#343a40'));
      elements.push(textElement(`${scene.id}:characters`, scene.characters, x + 18, y + 164, columnWidth - 36, 23, 14, '#495057'));
      if (sceneIndex > 0) {
        const prevY = scenesY + (sceneIndex - 1) * (sceneHeight + sceneGap);
        elements.push(arrow(`${scene.id}:from-prev`, x + columnWidth / 2, prevY + sceneHeight, x + columnWidth / 2, y - 6));
      }
    });

    if (epIndex > 0) {
      const prevX = left + (epIndex - 1) * (columnWidth + gap);
      elements.push(arrow(`${episode.id}:from-prev-episode`, prevX + columnWidth, headerY + 45, x - 8, headerY + 45, '#1971c2'));
    }
  });

  return elements;
}

function esc(value) {
  return String(value).replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;').replaceAll('"', '&quot;');
}

function svgPreview(data) {
  const colW = 430;
  const gap = 50;
  const left = 60;
  const width = left * 2 + data.episodes.length * colW + Math.max(0, data.episodes.length - 1) * gap;
  const height = 1510;
  const chunks = [`<svg xmlns="http://www.w3.org/2000/svg" width="${width}" height="${height}" viewBox="0 0 ${width} ${height}">`, '<rect width="100%" height="100%" fill="#f8f9fa"/>', `<text x="${left}" y="55" font-family="sans-serif" font-size="34" font-weight="700" fill="#212529">${esc(data.meta.title)}</text>`];
  data.episodes.forEach((ep, i) => {
    const x = left + i * (colW + gap);
    chunks.push(`<rect x="${x}" y="90" width="${colW}" height="1360" rx="14" fill="#fff" stroke="#ced4da" stroke-width="2"/>`);
    chunks.push(`<rect x="${x}" y="90" width="${colW}" height="74" rx="12" fill="#212529"/>`);
    chunks.push(`<text x="${x + 20}" y="138" font-family="sans-serif" font-size="26" font-weight="700" fill="#fff">${Number(ep.id.slice(2))}화</text>`);
    chunks.push(`<text x="${x + 18}" y="197" font-family="sans-serif" font-size="15" font-weight="700" fill="#e03131">핵심 긴장</text>`);
    const summary = wrap(ep.core_tension, 27).split('\n').slice(0, 4);
    summary.forEach((line, n) => chunks.push(`<text x="${x + 18}" y="${225 + n * 21}" font-family="sans-serif" font-size="15" fill="#343a40">${esc(line)}</text>`));
    ep.scenes.forEach((scene, s) => {
      const y = 335 + s * 205;
      const fill = colors[scene.type] || colors.default;
      chunks.push(`<rect x="${x + 14}" y="${y}" width="${colW - 28}" height="176" rx="12" fill="${fill}" stroke="#495057" stroke-width="1.5"/>`);
      chunks.push(`<text x="${x + 30}" y="${y + 27}" font-family="sans-serif" font-size="13" fill="#495057">${esc(scene.id)} · 긴장 ${esc(scene.tension)}/10</text>`);
      chunks.push(`<text x="${x + 30}" y="${y + 58}" font-family="sans-serif" font-size="20" font-weight="700" fill="#212529">${esc(scene.title)}</text>`);
      wrap(scene.summary, 30).split('\n').slice(0, 4).forEach((line, n) => chunks.push(`<text x="${x + 30}" y="${y + 88 + n * 20}" font-family="sans-serif" font-size="14" fill="#343a40">${esc(line)}</text>`));
    });
  });
  chunks.push('</svg>');
  return chunks.join('\n');
}

const args = argsOf(process.argv.slice(2));
if (!args.source || !args.output) usage();
const source = path.resolve(args.source);
const output = path.resolve(args.output);
const force = args.force === 'true';
if (fs.existsSync(output) && !force) {
  throw new Error(`Refusing to overwrite editable board: ${output}\nPass --force true only when you intend to rebuild it.`);
}
const data = parseSource(fs.readFileSync(source, 'utf8'));
if (!data.episodes.length) throw new Error('No episodes found in source.');
const board = {
  type: 'excalidraw',
  version: 2,
  source: 'https://excalidraw.com',
  elements: buildBoard(data),
  appState: { gridSize: 20, gridStep: 5, gridModeEnabled: false, viewBackgroundColor: '#f8f9fa' },
  files: {},
};
fs.mkdirSync(path.dirname(output), { recursive: true });
fs.writeFileSync(output, `${JSON.stringify(board, null, 2)}\n`, 'utf8');
if (args.preview) {
  const preview = path.resolve(args.preview);
  fs.mkdirSync(path.dirname(preview), { recursive: true });
  fs.writeFileSync(preview, svgPreview(data), 'utf8');
  console.log(`Wrote ${preview}`);
}
console.log(`Wrote ${output} (${data.episodes.length} episodes, ${board.elements.length} elements)`);
