import fs from 'node:fs';
import path from 'node:path';

function usage() {
  console.error('Usage: node validate-json-canvas.mjs --canvas-dir <dir> --vault-root <vault-root>');
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

function walk(dir) {
  return fs.readdirSync(dir, { withFileTypes: true }).flatMap((entry) => {
    const full = path.join(dir, entry.name);
    return entry.isDirectory() ? walk(full) : [full];
  });
}

const args = argsOf(process.argv.slice(2));
if (!args['canvas-dir'] || !args['vault-root']) usage();
const canvasDir = path.resolve(args['canvas-dir']);
const vaultRoot = path.resolve(args['vault-root']);
const files = walk(canvasDir).filter((file) => file.endsWith('.canvas'));
const errors = [];
const warnings = [];
const strict = args.strict === 'true';
let nodeCount = 0;
let edgeCount = 0;

for (const file of files) {
  let canvas;
  try {
    canvas = JSON.parse(fs.readFileSync(file, 'utf8'));
  } catch (error) {
    errors.push(`${file}: invalid JSON (${error.message})`);
    continue;
  }
  if (!Array.isArray(canvas.nodes)) errors.push(`${file}: nodes must be an array`);
  if (!Array.isArray(canvas.edges)) errors.push(`${file}: edges must be an array`);
  const extensions = Object.keys(canvas).filter((key) => !['nodes', 'edges'].includes(key));
  if (extensions.length) {
    const message = `${file}: non-core top-level fields (${extensions.join(', ')})`;
    (strict ? errors : warnings).push(message);
  }
  const ids = new Set();
  for (const node of canvas.nodes ?? []) {
    nodeCount += 1;
    if (!node.id || ids.has(node.id)) errors.push(`${file}: missing or duplicate node id ${node.id}`);
    ids.add(node.id);
    if (!['text', 'file', 'link', 'group'].includes(node.type)) errors.push(`${file}: invalid node type ${node.type}`);
    for (const key of ['x', 'y', 'width', 'height']) {
      if (!Number.isInteger(node[key])) errors.push(`${file}: node ${node.id} has non-integer ${key}`);
    }
    if (node.type === 'text' && !String(node.text ?? '').trim()) errors.push(`${file}: blank text node ${node.id}`);
    if (node.type === 'file') {
      if (!node.file) errors.push(`${file}: file node ${node.id} has no path`);
      else if (!fs.existsSync(path.join(vaultRoot, ...node.file.split('/')))) errors.push(`${file}: missing linked file ${node.file}`);
    }
  }
  const edgeIds = new Set();
  for (const edge of canvas.edges ?? []) {
    edgeCount += 1;
    if (!edge.id || edgeIds.has(edge.id)) errors.push(`${file}: missing or duplicate edge id ${edge.id}`);
    edgeIds.add(edge.id);
    if (!ids.has(edge.fromNode)) errors.push(`${file}: edge ${edge.id} missing fromNode ${edge.fromNode}`);
    if (!ids.has(edge.toNode)) errors.push(`${file}: edge ${edge.id} missing toNode ${edge.toNode}`);
  }
}

const result = { canvasDir, files: files.length, nodes: nodeCount, edges: edgeCount, warnings, errors };
console.log(JSON.stringify(result, null, 2));
if (errors.length) process.exit(1);
