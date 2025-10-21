echo "Extracting game files"
cd ./tmp
./Subway%20Builder-* --appimage-extract
mv squashfs-root app-image
cd ../
npx asar extract tmp/app-image/resources/app.asar tmp/asar-extract/
