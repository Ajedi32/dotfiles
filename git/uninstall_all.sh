#!/bin/sh

script_dir="$(dirname $0)"
"$script_dir"/unalias_all_scripts.sh
"$script_dir"/uninstall_all_configs.sh