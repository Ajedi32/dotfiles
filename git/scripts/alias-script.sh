#!/bin/sh
set -e

script_dir="$(dirname $0)"
print_help() {
  echo "Quickly create git aliases for one or more scripts based on their name."
  echo ""
  echo "Usage: "
  echo "$0 [--system|--global|--local|--worktree|--file <filename>] [--] <file>..."
}

. "$script_dir/lib/git_alias_cd.sh"
. "$script_dir/lib/parse_git_config_file_options.sh"

for script in "$@"; do
  script="$(realpath --no-symlinks $script)"
  alias_name="$(basename $script | cut --fields=1 --delimiter=.)"
  git config "$file_option" "alias.$alias_name" "!$script"
done
