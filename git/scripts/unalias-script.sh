#!/bin/sh
set -e

script_dir="$(dirname $0)"
print_help() {
  echo "Remove git aliases created with alias-script."
  echo ""
  echo "Usage: "
  echo "$0 [--system|--global|--local|--worktree|--file <filename>] [--] <file>..."
}

. "$script_dir/lib/git_alias_cd.sh"
. "$script_dir/lib/parse_git_config_file_options.sh"

for script in "$@"; do
  script="$(realpath --no-symlinks $script)"
  alias_name="$(basename $script | cut --fields=1 --delimiter=.)"
  # TODO: Use --fixed-value option for git config once supported by mainstream distros
  git config "$file_option" --unset "alias.$alias_name" "\!$script"
done