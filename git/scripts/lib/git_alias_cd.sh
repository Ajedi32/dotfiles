# git alias shell commands are normally executed from the top directory of the repository they are run in rather than
# in the current directory. This script prevents that behvior.
test -n "$GIT_PREFIX" && cd "$GIT_PREFIX" || true
