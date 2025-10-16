const {writeFileSync} = require('fs');
const {toJs, jsx} = require('estree-util-to-js');

/**
 * @type { import('estree-jsx').Program};
 */
const tree = require('./parsed.json')

const entryPoint = tree.body.filter((value) => value.type === 'ExportNamedDeclaration');
const identifiers = tree.body[5754]
const stuff = toJs((identifiers))
writeFileSync('./processed.json', 
  JSON.stringify(stuff)
)
