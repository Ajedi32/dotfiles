# Source this to get a ton of useful functions for generating escape sequences that do useful things
#
# A good reference guide: https://en.wikipedia.org/wiki/ANSI_escape_code

export ESC='\033'
export BEL='\007'

# From http://stackoverflow.com/a/17841619/1157054
function join_string_with_delim() {
	local d=$1
	shift
	echo -n "$1"
	shift
	printf "%s" "${@/#/$d}"
}

function esc_non_printing_sequence() {
	echo '\['"$1"'\]'
}

# Probably not very robust. I don't fully understand how this works yet.
function esc_operating_system_control_command() {
	local opcode="$1";
	shift;
	esc_non_printing_sequence "$ESC]$opcode;$(join_string_with_delim ';' "$@")$BEL"
}

function esc_set_window_title() {
	local title="$1"
	esc_operating_system_control_command 0 "$title"
}

# Takes a list of SGR parameters
# See https://en.wikipedia.org/wiki/ANSI_escape_code#graphics
function esc_select_graphic_rendition() {
	esc_non_printing_sequence "$ESC[$(join_string_with_delim ';' "$@")m"
}

export sgr_code_color_black="30"
export sgr_code_color_red="31"
export sgr_code_color_green="32"
export sgr_code_color_yellow="33"
export sgr_code_color_blue="34"
export sgr_code_color_magenta="35"
export sgr_code_color_cyan="36"
export sgr_code_color_white="37"
export sgr_code_bold="1"
export sgr_code_bright="$sgr_code_bold"
export sgr_code_reset="0"

export esc_text_color_black=$(esc_select_graphic_rendition "$sgr_code_color_black")
export esc_text_color_red=$(esc_select_graphic_rendition "$sgr_code_color_red")
export esc_text_color_green=$(esc_select_graphic_rendition "$sgr_code_color_green")
export esc_text_color_yellow=$(esc_select_graphic_rendition "$sgr_code_color_yellow")
export esc_text_color_blue=$(esc_select_graphic_rendition "$sgr_code_color_blue")
export esc_text_color_magenta=$(esc_select_graphic_rendition "$sgr_code_color_magenta")
export esc_text_color_cyan=$(esc_select_graphic_rendition "$sgr_code_color_cyan")
export esc_text_color_light_gray=$(esc_select_graphic_rendition "$sgr_code_color_white")

export esc_text_color_dark_gray=$(esc_select_graphic_rendition "$sgr_code_bright" "$sgr_code_color_black")
export esc_text_color_light_red=$(esc_select_graphic_rendition "$sgr_code_bright" "$sgr_code_color_red")
export esc_text_color_light_green=$(esc_select_graphic_rendition "$sgr_code_bright" "$sgr_code_color_green")
export esc_text_color_light_yellow=$(esc_select_graphic_rendition "$sgr_code_bright" "$sgr_code_color_yellow")
export esc_text_color_light_blue=$(esc_select_graphic_rendition "$sgr_code_bright" "$sgr_code_color_blue")
export esc_text_color_light_magenta=$(esc_select_graphic_rendition "$sgr_code_bright" "$sgr_code_color_magenta")
export esc_text_color_light_cyan=$(esc_select_graphic_rendition "$sgr_code_bright" "$sgr_code_color_cyan")
export esc_text_color_white=$(esc_select_graphic_rendition "$sgr_code_bright" "$sgr_code_color_white")

export esc_sgr_clear=$(esc_select_graphic_rendition "$sgr_code_reset")
