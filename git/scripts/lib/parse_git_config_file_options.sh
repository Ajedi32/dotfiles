# Parse options
file_option="${file_option:=--global}"
while :; do
  case "$1" in
    -h|-\?|--help)
      print_help
      exit
      ;;
		--system|--global|--local|--worktree|--file=*)
      file_option="$1"
      ;;
    --file)
      if [ -n "$2" ]; then
        file_option="--file=$2"
        shift
      else
        echo 'ERROR: "--file" requires that you specify a path.' >&2
        exit 1
      fi
      ;;
    --)
      # Start of positional arguments
      shift
      break
      ;;
    -*)
      printf 'ERROR: Unknown option %s\n' "$1" >&2
			exit 1
      ;;
    *)
      # No more options
      break
    esac

    shift
done
