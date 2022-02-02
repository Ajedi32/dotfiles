#!/bin/sh
set -e

script_dir="$(dirname $0)"
print_help() {
  echo "Easily include multiple config files in your git config."
  echo ""
  echo "Usage: "
  echo "$0 [--system|--global|--local|--worktree|--file <filename>] [--] <file>..."
}

. "$script_dir/lib/git_alias_cd.sh"
. "$script_dir/lib/parse_git_config_file_options.sh"

for config_file in "$@"; do
  config_file="$(realpath --no-symlinks "$config_file")"
  # TODO: Use --fixed-value option for git config once supported by mainstream distros
  git config "$file_option" include.path "$config_file" "$config_file"
done
