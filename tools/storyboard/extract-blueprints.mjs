import fs from 'node:fs';
import path from 'node:path';

function usage() {
  console.error('Usage: node extract-blueprints.mjs --blueprints <dir> --output <storyboard.md> [--from 1] [--to 10] [--title <title>]');
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

function field(block, name) {
  const match = block.match(new RegExp(`^\\s*- ${name}:\\s*(.*)$`, 'm'));
  return match ? match[1].trim() : '';
}

function cleanScalar(value) {
  return value
    .replace(/^['"]|['"]$/g, '')
    .replace(/\r?\n/g, ' ')
    .trim();
}

function cleanList(value) {
  if (!value) return '';
  const bracketed = value.match(/^\[(.*)\]$/);
  if (!bracketed) return cleanScalar(value);
  return bracketed[1]
    .split(',')
    .map((item) => cleanScalar(item.trim()))
    .filter(Boolean)
    .join(', ');
}

function section(text, label, nextLabel) {
  const next = nextLabel ? `(?=\\n\\[${nextLabel})` : '$';
  const match = text.match(new RegExp(`\\[${label}[^\\]]*\\]\\s*\\n-+\\s*\\n([\\s\\S]*?)${next}`, 'm'));
  return match ? match[1].trim().replace(/\s+/g, ' ') : '';
}

function parseBlueprint(filePath, episode) {
  const text = fs.readFileSync(filePath, 'utf8');
  const sceneRegion = text.match(/\[씬 분해[^\]]*\][\s\S]*?(?=\n\[핵심 긴장|$)/);
  const scenes = [];
  if (sceneRegion) {
    const regex = /^## scene_(\d+)\s*\n([\s\S]*?)(?=^## scene_\d+|(?![\s\S]))/gm;
    for (const match of sceneRegion[0].matchAll(regex)) {
      const block = match[2];
      scenes.push({
        id: `EP${String(episode).padStart(3, '0')}-S${String(Number(match[1])).padStart(2, '0')}`,
        type: cleanScalar(field(block, 'type')),
        title: cleanScalar(field(block, 'title')),
        goal: cleanScalar(field(block, 'goal')),
        summary: cleanScalar(field(block, 'summary')),
        characters: cleanList(field(block, 'characters')),
        location: cleanScalar(field(block, 'location')),
        tension: Number(field(block, 'tension_level')) || 0,
      });
    }
  }

  return {
    episode,
    scenes,
    coreTension: section(text, '핵심 긴장', '예상 결말'),
    expectedEnding: section(text, '예상 결말'),
  };
}

function q(value) {
  return JSON.stringify(String(value ?? ''));
}

function toMarkdown(title, episodes, sourceDir) {
  const lines = [
    '# Storyboard source',
    '',
    '<!--',
    '이 파일은 LLM과 보드 생성기가 함께 읽는 의미 원본이다.',
    '카드의 위치와 손그림 수정은 .excalidraw에서 하고, 인과/내용 수정은 이 파일에서 한다.',
    '-->',
    '',
    `- title: ${q(title)}`,
    `- source_blueprints: ${q(sourceDir.replaceAll('\\', '/'))}`,
    `- episode_range: ${q(`${episodes[0]?.episode ?? ''}-${episodes.at(-1)?.episode ?? ''}`)}`,
    '',
  ];

  for (const episode of episodes) {
    const epId = `EP${String(episode.episode).padStart(3, '0')}`;
    lines.push(
      `# ${epId}`,
      `- core_tension: ${q(episode.coreTension)}`,
      `- expected_ending: ${q(episode.expectedEnding)}`,
      '',
    );
    for (const scene of episode.scenes) {
      lines.push(
        `## ${scene.id}`,
        `- type: ${q(scene.type)}`,
        `- title: ${q(scene.title)}`,
        `- goal: ${q(scene.goal)}`,
        `- summary: ${q(scene.summary)}`,
        `- characters: ${q(scene.characters)}`,
        `- location: ${q(scene.location)}`,
        `- tension: ${scene.tension}`,
        '',
      );
    }
  }
  return `${lines.join('\n').trim()}\n`;
}

const args = argsOf(process.argv.slice(2));
if (!args.blueprints || !args.output) usage();

const from = Number(args.from ?? 1);
const to = Number(args.to ?? 10);
const blueprintDir = path.resolve(args.blueprints);
const output = path.resolve(args.output);
const episodes = [];

for (let episode = from; episode <= to; episode += 1) {
  const file = path.join(blueprintDir, `ep${String(episode).padStart(3, '0')}_blueprint.md`);
  if (!fs.existsSync(file)) throw new Error(`Missing blueprint: ${file}`);
  episodes.push(parseBlueprint(file, episode));
}

fs.mkdirSync(path.dirname(output), { recursive: true });
fs.writeFileSync(output, toMarkdown(args.title ?? 'Untitled storyboard', episodes, blueprintDir), 'utf8');
console.log(`Wrote ${output} (${episodes.length} episodes, ${episodes.reduce((sum, ep) => sum + ep.scenes.length, 0)} scenes)`);
