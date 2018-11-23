SCRIPT_DIR=$(dirname "$0")

outputName="${1%.*}"

pandoc $1 -o $outputName.pdf --from markdown --filter=/Users/matthewnitschke/scripts/pandoc/filters/plantuml.py --data-dir=$SCRIPT_DIR
