# Allow easily going up multiple directories, even when the current directory
# is deleted on an NTFS share.
function up() {
  local dir=`pwd`
  local n=${1:-1};
  for ((; n>0; n--)) {
    dir=`dirname "$dir"`
  }
  cd "$dir"
}
