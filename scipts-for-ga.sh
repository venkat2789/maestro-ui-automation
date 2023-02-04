#!/bin/bash
SDK_PATH = "/Users/runner/Library/Android/sdk"
APK_FILE_PATH = "/Users/runner/work/maestro-ui-automation/maestro-ui-automation/WikipediaSample.apk"

echo ">> printing work directory"
pwd

echo ">> listing project files"
ls

echo ">> listing avds"
$SDK_PATH/emulator/emulator -list-avds

echo ">> installing app"
$SDK_PATH/platform-tools/adb install $APK_FILE_PATH

echo ">> getting package names"
$SDK_PATH/platform-tools/adb shell pm list packages -3 -f

echo ">> installing maestro"
curl -Ls "https://get.maestro.mobile.dev" | bash
export PATH="$PATH":"$HOME/.maestro/bin"
maestro --version

echo ">> running tests"
maestro test ./folderWithTests/ --format junit
