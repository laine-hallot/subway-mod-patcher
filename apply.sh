patchDir () {
  echo $1
  ROOT_DIR=$(pwd)
  NAME=$(cat $1/patch-manifest.json | jq  '.patchName' --raw-output)
  if [[ !$? -eq 0 ]]; then
    echo "$1/patch-manifest.json patchName is undefined"
  fi
    VERSION=$(cat $1/patch-manifest.json | jq  '.gameVersion' --raw-output)
  if [[ !$? -eq 0 ]]; then
    echo "$1/patch-manifest.json patchName is undefined"
  fi
  COMMAND=$(cat $1/patch-manifest.json | jq '.applyPatch' --raw-output)
  if [[ !$? -eq 0 ]]; then
    echo "$1/patch-manifest.json patchName is undefined"
  fi
  DIR=$(cat $1/patch-manifest.json | jq '.workingDir' --raw-output)
  if [ -z $DIR ]; then
    echo "Installing patch: $NAME using working directory: $DIR"
    cd $DIR
    $COMMAND
  else
    cd $1
    echo "Installing patch: $NAME"
    $COMMAND
  fi
  cd $ROOT_DIR
} 


echo "Patching game files"
export -f patchDir
PATCH_DIRECTORIES=$(find ./patches/ -maxdepth 1 -type d -exec sh -c '[ -f "$0"/patch-manifest.json ]' '{}' \; -print)
echo "$PATCH_DIRECTORIES" | xargs -P 24 -I '{}' bash -c 'patchDir "$@"' _ {}
