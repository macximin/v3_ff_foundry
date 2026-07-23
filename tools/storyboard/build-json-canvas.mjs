import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { pathToFileURL } from 'node:url';

function usage() {
  console.error('Usage: node build-json-canvas.mjs --source <storyboard.md> --output-dir <canvas-dir> --vault-root <vault-root> [--block-size 5] [--master-columns 10] [--dry-run true] [--force true]');
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

function unquote(value) {
  const trimmed = value.trim();
  if (trimmed.startsWith('"')) return JSON.parse(trimmed);
  return trimmed;
}

function fields(block) {
  const result = {};
  for (const line of block.split(/\r?\n/)) {
    const match = line.match(/^- ([a-z_]+):\s*(.*)$/);
    if (match) result[match[1]] = unquote(match[2]);
  }
  return result;
}

function parseSource(text) {
  const meta = fields(text.split(/^# EP\d+/m)[0]);
  const episodes = [];
  const episodePattern = /^# (EP\d+)\s*\n([\s\S]*?)(?=^# EP\d+|(?![\s\S]))/gm;
  for (const episodeMatch of text.matchAll(episodePattern)) {
    const body = episodeMatch[2];
    const episode = {
      id: episodeMatch[1],
      ...fields(body.split(/^## /m)[0]),
      scenes: [],
    };
    const scenePattern = /^## (EP\d+-S\d+)\s*\n([\s\S]*?)(?=^## EP\d+-S\d+|(?![\s\S]))/gm;
    for (const sceneMatch of body.matchAll(scenePattern)) {
      episode.scenes.push({ id: sceneMatch[1], ...fields(sceneMatch[2]) });
    }
    episodes.push(episode);
  }
  return { meta, episodes };
}

function stableId(key) {
  return crypto.createHash('sha1').update(key).digest('hex').slice(0, 16);
}

function positiveInteger(value, name) {
  const number = Number(value);
  if (!Number.isInteger(number) || number < 1) throw new Error(`${name} must be a positive integer: ${value}`);
  return number;
}

function textNode(key, text, x, y, width, height, color) {
  return { id: stableId(key), type: 'text', text, x, y, width, height, ...(color ? { color } : {}) };
}

function fileNode(key, file, x, y, width, height, color) {
  return { id: stableId(key), type: 'file', file, x, y, width, height, ...(color ? { color } : {}) };
}

function groupNode(key, label, x, y, width, height, color) {
  return { id: stableId(key), type: 'group', label, x, y, width, height, ...(color ? { color } : {}) };
}

function edge(key, fromNode, toNode, label, color, sides = {}) {
  return {
    id: stableId(key),
    fromNode,
    fromSide: sides.from ?? 'right',
    toNode,
    toSide: sides.to ?? 'left',
    toEnd: 'arrow',
    ...(label ? { label } : {}),
    ...(color ? { color } : {}),
  };
}

function posixRelative(root, file) {
  const relative = path.relative(root, file);
  if (!relative || relative === '..' || relative.startsWith(`..${path.sep}`) || path.isAbsolute(relative)) {
    throw new Error(`Linked file must stay inside the vault: ${file}`);
  }
  return relative.split(path.sep).join('/');
}

function validateSource(data) {
  const errors = [];
  const episodeIds = new Set();
  let previousEpisodeNumber = 0;
  for (const episode of data.episodes) {
    const episodeNumber = Number(episode.id.slice(2));
    if (episodeIds.has(episode.id)) errors.push(`duplicate episode id: ${episode.id}`);
    episodeIds.add(episode.id);
    if (episodeNumber <= previousEpisodeNumber) errors.push(`episodes are not strictly increasing at ${episode.id}`);
    previousEpisodeNumber = episodeNumber;
    for (const key of ['core_tension', 'expected_ending']) {
      if (!String(episode[key] ?? '').trim()) errors.push(`${episode.id} missing ${key}`);
    }
    if (!episode.scenes.length) errors.push(`${episode.id} has no scenes`);
    const sceneIds = new Set();
    for (const scene of episode.scenes) {
      if (!scene.id.startsWith(`${episode.id}-S`)) errors.push(`${scene.id} does not belong to ${episode.id}`);
      if (sceneIds.has(scene.id)) errors.push(`duplicate scene id: ${scene.id}`);
      sceneIds.add(scene.id);
      for (const key of ['title', 'summary', 'goal', 'characters']) {
        if (!String(scene[key] ?? '').trim()) errors.push(`${scene.id} missing ${key}`);
      }
      const tension = Number(scene.tension);
      if (!Number.isFinite(tension) || tension < 0 || tension > 10) errors.push(`${scene.id} tension must be 0..10`);
    }
  }
  if (errors.length) throw new Error(`Invalid storyboard source:\n- ${errors.join('\n- ')}`);
}

function colorForType(type) {
  return {
    opening_hook: '5',
    tension_build: '3',
    dialogue_duel: '1',
    emotional_reveal: '6',
    cliffhanger: '4',
  }[type] ?? '2';
}

function buildEpisodeCanvas(episode, blueprintFile) {
  const nodes = [];
  const edges = [];
  const sceneWidth = 330;
  const sceneGap = 80;
  const left = 120;
  const titleY = 90;
  const sceneY = 310;
  const totalWidth = Math.max(920, left * 2 + episode.scenes.length * sceneWidth + Math.max(0, episode.scenes.length - 1) * sceneGap);

  nodes.push(groupNode(`${episode.id}:frame`, `${episode.id} · 씬 스트립`, 40, 40, totalWidth, 900, '5'));
  nodes.push(textNode(`${episode.id}:title`, `# ${episode.id}\n\n**핵심 긴장**  ${episode.core_tension}\n\n**회차 착지**  ${episode.expected_ending}`, left, titleY, totalWidth - 500, 170));
  nodes.push(fileNode(`${episode.id}:blueprint`, blueprintFile, totalWidth - 310, titleY, 250, 170, '6'));

  episode.scenes.forEach((scene, index) => {
    const x = left + index * (sceneWidth + sceneGap);
    const content = [
      `## ${scene.id} · 긴장 ${scene.tension}/10`,
      '',
      `### ${scene.title}`,
      '',
      scene.summary,
      '',
      `**목적**  ${scene.goal}`,
      '',
      `**인물**  ${scene.characters}`,
    ].join('\n');
    const node = textNode(`${scene.id}:scene`, content, x, sceneY, sceneWidth, 500, colorForType(scene.type));
    nodes.push(node);
    if (index > 0) {
      const previous = nodes.at(-2);
      edges.push(edge(`${scene.id}:from-prev`, previous.id, node.id));
    }
  });
  return { nodes, edges };
}

function buildBlockCanvas(blockId, episodes, episodeFiles) {
  const nodes = [];
  const edges = [];
  const cardWidth = 330;
  const gap = 90;
  const left = 150;
  const totalWidth = Math.max(1100, left * 2 + episodes.length * cardWidth + Math.max(0, episodes.length - 1) * gap);
  const range = `${episodes[0].id}~${episodes.at(-1).id}`;

  nodes.push(groupNode(`${blockId}:frame`, `${blockId} · ${range}`, 40, 40, totalWidth, 790, '5'));
  nodes.push(textNode(`${blockId}:title`, `# ${blockId} · ${range}\n\n회차 인과선 — 각 카드를 열면 씬 스트립으로 내려간다.`, left, 90, totalWidth - 300, 120));

  let previousFileId = null;
  episodes.forEach((episode, index) => {
    const x = left + index * (cardWidth + gap);
    const file = episodeFiles[index];
    const node = fileNode(`${blockId}:${episode.id}`, file, x, 280, cardWidth, 390, index === episodes.length - 1 ? '4' : '5');
    nodes.push(node);
    if (previousFileId) edges.push(edge(`${blockId}:${episode.id}:from-prev`, previousFileId, node.id));
    previousFileId = node.id;
    nodes.push(textNode(`${blockId}:${episode.id}:caption`, `**${episode.id}**\n${episode.core_tension}\n\n→ ${episode.expected_ending}`, x, 690, cardWidth, 105));
  });
  return { nodes, edges };
}

export function buildMasterCanvas(title, blocks, columns = 10) {
  const nodes = [];
  const edges = [];
  const cardWidth = 430;
  const gap = 120;
  const left = 150;
  const rowStride = 560;
  const columnCount = Math.min(columns, Math.max(1, blocks.length));
  const rowCount = Math.max(1, Math.ceil(blocks.length / columns));
  const totalWidth = Math.max(1300, left * 2 + columnCount * cardWidth + Math.max(0, columnCount - 1) * gap);
  const totalHeight = 720 + Math.max(0, rowCount - 1) * rowStride;

  nodes.push(groupNode('master:frame', '작품 전체 척추', 40, 40, totalWidth, totalHeight, '5'));
  nodes.push(textNode('master:title', `# ${title}\n\n## 작품 전체 척추\n블록 카드를 열면 회차 인과선으로 내려간다.`, left, 90, totalWidth - 300, 150));

  let previousFileId = null;
  blocks.forEach((block, index) => {
    const column = index % columns;
    const row = Math.floor(index / columns);
    const x = left + column * (cardWidth + gap);
    const y = 310 + row * rowStride;
    const node = fileNode(`master:${block.id}`, block.file, x, 310, cardWidth, 300, index === 0 ? '5' : '4');
    node.y = y;
    nodes.push(node);
    nodes.push(textNode(`master:${block.id}:caption`, `## ${block.id}\n${block.range}\n\n${block.summary}`, x, y + 315, cardWidth, 115));
    if (previousFileId) {
      const wrapped = column === 0;
      edges.push(edge(`master:${block.id}:from-prev`, previousFileId, node.id, undefined, undefined, wrapped ? { from: 'bottom', to: 'top' } : {}));
    }
    previousFileId = node.id;
  });
  return { nodes, edges };
}

function writeJson(file, value) {
  fs.mkdirSync(path.dirname(file), { recursive: true });
  fs.writeFileSync(file, `${JSON.stringify(value, null, 2)}\n`, 'utf8');
}

function preflight(planned, force) {
  const duplicates = planned.map(({ file }) => file).filter((file, index, files) => files.indexOf(file) !== index);
  if (duplicates.length) throw new Error(`Duplicate output paths:\n${duplicates.join('\n')}`);
  const existing = planned.map(({ file }) => file).filter((file) => fs.existsSync(file));
  if (existing.length && !force) {
    throw new Error(`Refusing to overwrite ${existing.length} editable canvas file(s):\n${existing.join('\n')}\nPass --force true only for an intentional rebuild.`);
  }
}

function main() {
  const args = argsOf(process.argv.slice(2));
  if (!args.source || !args['output-dir'] || !args['vault-root']) usage();
  const sourceFile = path.resolve(args.source);
  const outputDir = path.resolve(args['output-dir']);
  const vaultRoot = path.resolve(args['vault-root']);
  const blockSize = positiveInteger(args['block-size'] ?? 5, '--block-size');
  const masterColumns = positiveInteger(args['master-columns'] ?? 10, '--master-columns');
  const force = args.force === 'true';
  const dryRun = args['dry-run'] === 'true';
  const data = parseSource(fs.readFileSync(sourceFile, 'utf8'));
  if (!data.episodes.length) throw new Error('No episodes found in storyboard source.');
  validateSource(data);

  const episodeDir = path.join(outputDir, 'episodes');
  const blockDir = path.join(outputDir, 'blocks');
  const blueprintDir = path.resolve(path.dirname(sourceFile), '..', '03_blueprint');
  const episodePaths = new Map();
  const planned = [];

  for (const episode of data.episodes) {
    const number = Number(episode.id.slice(2));
    const output = path.join(episodeDir, `${episode.id}.canvas`);
    const blueprint = path.join(blueprintDir, `ep${String(number).padStart(3, '0')}_blueprint.md`);
    if (!fs.existsSync(blueprint)) throw new Error(`Missing blueprint for ${episode.id}: ${blueprint}`);
    const canvas = buildEpisodeCanvas(episode, posixRelative(vaultRoot, blueprint));
    planned.push({ file: output, value: canvas });
    episodePaths.set(episode.id, posixRelative(vaultRoot, output));
  }

  const blocks = [];
  for (let start = 0; start < data.episodes.length; start += blockSize) {
    const episodes = data.episodes.slice(start, start + blockSize);
    const index = blocks.length + 1;
    const id = `B${String(index).padStart(3, '0')}`;
    const output = path.join(blockDir, `${id}.canvas`);
    const files = episodes.map((episode) => episodePaths.get(episode.id));
    planned.push({ file: output, value: buildBlockCanvas(id, episodes, files) });
    blocks.push({
      id,
      file: posixRelative(vaultRoot, output),
      range: `${episodes[0].id}~${episodes.at(-1).id}`,
      summary: `${episodes[0].scenes[0]?.title ?? episodes[0].id} → ${episodes.at(-1).expected_ending}`,
    });
  }

  planned.push({ file: path.join(outputDir, 'master.canvas'), value: buildMasterCanvas(data.meta.title || 'Storyboard', blocks, masterColumns) });
  preflight(planned, force);
  if (!dryRun) planned.forEach(({ file, value }) => writeJson(file, value));
  console.log(`${dryRun ? 'Validated' : 'Wrote'} JSON Canvas hierarchy: 1 master, ${blocks.length} blocks, ${data.episodes.length} episodes, ${masterColumns} master columns`);
}

if (process.argv[1] && import.meta.url === pathToFileURL(path.resolve(process.argv[1])).href) main();
