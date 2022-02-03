#!/bin/sh

script_dir="$(dirname $0)"

uninclude_config() {
    "$script_dir"/scripts/uninclude-config.sh "$@"
}

uninclude_config "$script_dir"/configs/*.gitconfig
uninclude_config "$script_dir"/configs/platform_specific/wsl2/*.gitconfig
uninclude_config "$script_dir"/configs/platform_specific/windows/*.gitconfig
