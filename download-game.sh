source ./.env
#UPDATE_ID=$(cat ~/.config/metro-maker4/.updaterId)
# curl 'https://download.subwaybuilder.com/latest-linux.yml' \
#   -X POST \
#   -H "User-Agent: Subway Builder/0.6.1"  \
#   -H "x-user-staging-id: $UPDATE_ID"  \
#   -H "X-Machine-Id: $MACHINE_ID"  \
#   -H "X-License-Key: $GAME_KEY"
# TODO: find a way to get the latest version number
DOWNLOAD_INFO=$(curl "https://download.subwaybuilder.com/download/linux?licenseKey=$GAME_KEY&filePath=Subway%2520Builder-0.7.3.AppImage" \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0' \
  -H 'Accept-Language: en-US,en;q=0.5' \
  -H 'Referer: https://www.subwaybuilder.com/' \
  -H "X-License-Key: $GAME_KEY" \
  -H 'Origin: https://www.subwaybuilder.com')
DOWNLOAD_URL=$(echo $DOWNLOAD_INFO | jq '.downloadUrl' --raw-output)
curl --output-dir "tmp" -OJ $DOWNLOAD_URL
chmod +x ./tmp/Subway%20Builder-*