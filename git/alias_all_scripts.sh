#!/bin/sh

script_dir="$(dirname $0)"
. "$script_dir/lib/files_exist.sh"

if files_exist "$@"; then
    "$script_dir"/scripts/alias-script.sh "$script_dir"/scripts/*.sh
fi
