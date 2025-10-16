echo "Repackaging game"
chmod +x ./tmp/app-image/AppRun
chmod +x ./tmp/app-image/metro-maker4
asar pack tmp/asar-extract tmp/app-image/resources/app.asar
# lscpu | grep Architecture
ARCH=x86_64 appimage-tool tmp/app-image out/subway_builder.appimage