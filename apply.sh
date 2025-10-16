
echo "Patching game files"
patch -p1 tmp/asar-extract/dist/main/main.js ./patches/titlebar.patch
patch -p1 tmp/app-image/metro-maker4.desktop ./patches/wayland.patch