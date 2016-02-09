#
# <username>@<pc> <architecture> ~/path/to/git/repository (branch)
# $

_DIR_=`dirname "${BASH_SOURCE[0]}"`

source $_DIR_/escape_codes.sh

function set_ps1_git_prompt() {
	local window_title='$MSYSTEM:${PWD//[^[:ascii:]]/?}'
	local username="\u"
	local system_name="\h"
	local system_architecture="$MSYSTEM"
	local current_path="\w"
	local current_user="$username@$system_name"
	local branch_name='$(__git_ps1)'

	local set_window_title=$(esc_set_window_title "$window_title")

	# <username>@<pc>
	local formatted_current_user="$esc_text_color_green$current_user"

	# MINGW64
	local formatted_system_architecture="$esc_text_color_magenta$system_architecture"

	# ~/path/to/git/repository
	local formatted_current_path="$esc_text_color_yellow$current_path"

	# (branch)
	local formatted_branch_name="$esc_text_color_cyan$branch_name"


	local prompt="\n$formatted_current_user $formatted_system_architecture $formatted_current_path$formatted_branch_name$esc_sgr_clear\n$ "

	export PS1="$set_window_title$prompt"
}
set_ps1_git_prompt
