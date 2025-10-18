echo "Extracting game files"
cd ./tmp
~/AppImages/subway_builder.appimage --appimage-extract
mv squashfs-root app-image
cd ../
asar extract tmp/app-image/resources/app.asar tmp/asar-extract/
