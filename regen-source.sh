echo "Reconstructing source files"
mkdir -p tmp/rebuild/deobfuscate/
find tmp/asar-extract/dist -name '*.js' | \
sed 's/tmp\/asar-extract\///g' | \
xargs -P 24 -I '%' npx obfuscator-io-deobfuscator tmp/asar-extract/'%' -o tmp/rebuild/deobfuscate/'%'