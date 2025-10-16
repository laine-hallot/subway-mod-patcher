const {readFileSync, writeFileSync} = require('fs');
const {fromJs} = require('esast-util-from-js');
const code = readFileSync("./tmp/rebuild/split/dist/renderer/GameMain-C00NYk0t.js").toString();

/* const parsed = require("@babel/parser").parse(code, {
  // parse in strict mode and allow module declarations
  sourceType: "unambiguous",
}); */
const tree = fromJs(code, {module: true})


writeFileSync('./parsed.json', 
  JSON.stringify(tree)
)


