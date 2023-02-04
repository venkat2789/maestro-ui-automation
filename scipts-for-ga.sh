echo >> printing work directory
pwd

echo >> listing project files
ls

echo >> listing avds
/Users/runner/Library/Android/sdk/emulator/emulator -list-avds

echo >> installing app
/Users/runner/Library/Android/sdk/platform-tools/adb install /Users/runner/work/maestro-ui-automation/maestro-ui-automation/WikipediaSample.apk

echo >> getting package names
/Users/runner/Library/Android/sdk/platform-tools/adb shell pm list packages -3 -f

echo >> running tests
maestro test ./folderWithTests/wiki-generalFlow.yaml
