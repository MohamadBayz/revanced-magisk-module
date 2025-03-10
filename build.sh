#!/bin/bash

set -euo pipefail

YT_PATCHER_ARGS="-e swipe-controls -e amoled -e hide-cast-button -e enable-wide-searchbar -e autorepeat-by-default -e microg-support -e enable-debugging -e hide-shorts-button -e custom-branding"
MUSIC_PATCHER_ARGS="-e microg-support"

# dont change anything after this point ↓
source utils.sh

BUILD_YT=false
BUILD_MUSIC=false

print_usage() {
	echo -e "Usage:\n${0} all|youtube|music|clean|reset-template"
}

if [ -z ${1+x} ]; then
	print_usage
	exit 0
elif [ "$1" = "clean" ]; then
	rm -rf ./temp ./revanced-cache ./*.jar ./*.apk ./*.zip ./*.keystore build.log
	reset_template
	exit 0
elif [ "$1" = "reset-template" ]; then
	reset_template
	exit 0
elif [ "$1" = "all" ]; then
	BUILD_YT=true
	BUILD_MUSIC=true
elif [ "$1" = "youtube" ]; then
	BUILD_YT=true
elif [ "$1" = "music" ]; then
	BUILD_MUSIC=true
else
	print_usage
	exit 1
fi

true >build.log
log "$(date +'%Y-%m-%d')\n"

get_prebuilts

if [ "$BUILD_YT" = true ]; then
	build_yt "$YT_PATCHER_ARGS"
fi

if [ "$BUILD_MUSIC" = true ]; then
	build_music "$MUSIC_PATCHER_ARGS" "$ARM64_V8A"
	build_music "$MUSIC_PATCHER_ARGS" "$ARM_V7A"
fi

echo "Done"
