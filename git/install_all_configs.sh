#!/bin/sh

script_dir="$(dirname $0)"
. "$script_dir/lib/platform_detection.sh"
. "$script_dir/lib/files_exist.sh"

include_config() {
    if files_exist "$@"; then
        "$script_dir"/scripts/include-config.sh "$@"
    fi
}

include_config "$script_dir"/configs/*.gitconfig

if platform_is_wsl2; then
    include_config "$script_dir"/configs/platform_specific/wsl2/*.gitconfig
elif platform_is_mingw; then
    include_config "$script_dir"/configs/platform_specific/windows/*.gitconfig
fi
