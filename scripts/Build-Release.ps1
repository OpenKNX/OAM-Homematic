# This script is just a template and has to be copied and modified per project
# This script should be called from .vscode/tasks.json with
#
#   scripts/Build-Release.ps1            - for Beta builds
#   scripts/Build-Release.ps1 Release    - for Release builds
#
# {
#     "label": "Build-Release",
#     "type": "shell",
#     "command": "scripts/Build-Release.ps1 Release",
#     "args": [],
#     "problemMatcher": [],
#     "group": "test"
# },
# {
#     "label": "Build-Beta",
#     "type": "shell",
#     "command": "scripts/Build-Release.ps1 ",
#     "args": [],
#     "problemMatcher": [],
#     "group": "test"
# }

# set product names, allows mapping of (devel) name in Project to a more consistent name in release
# $settings = scripts/OpenKNX-Build-Settings.ps1

# execute generic pre-build steps
../OGM-Common/scripts/setup/reusable/Build-Release-Preprocess.ps1 $args[0]
if (!$?) { exit 1 }

# build firmware for REG1_ETH_V1
lib/OGM-Common/scripts/setup/reusable/Build-Step.ps1 release_REG1_ETH_V1 firmware-REG1_ETH_V1 uf2
if (!$?) { exit 1 }

# Quick-Fix: Remove unwanted files from release folder:
Remove-Item -Path "release/data/Upload-Firmware-Generic-SAMD.ps1" -ErrorAction SilentlyContinue -Force

# execute generic post-build steps
../OGM-Common/scripts/setup/reusable/Build-Release-Postprocess.ps1 $args[0]
if (!$?) { exit 1 }
