SCRIPT_DIR=$(dirname "$0") # get the base directory for this file
TEST=$(pwd)
echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
echo "$(readlink -m ./)"

echo "SCRIPT DIR: $SCRIPT_DIR"
echo "TEST: $TEST"
# code --extensions-dir="$SCRIPT_DIR/extensions"