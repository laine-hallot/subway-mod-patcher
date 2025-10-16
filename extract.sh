echo "Extracting game files"
7z x ~/AppImages/subway_builder.appimage -o./tmp/app-image
asar extract tmp/app-image/resources/app.asar tmp/asar-extract/
