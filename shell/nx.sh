# Execute a Node.js bin within the current project
function nx() {
  local bin=$1;
  shift;
  ./node_modules/.bin/$bin $@;
}
