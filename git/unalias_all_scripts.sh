#!/bin/sh

script_dir="$(dirname $0)"
"$script_dir"/scripts/unalias-script.sh "$script_dir"/scripts/*.sh
