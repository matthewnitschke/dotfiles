#!/bin/sh

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

if [[ ! -x "$(command -v pandoc)" ]] || [[ ! -x "$(command -v pdflatex)" ]]; then
    echo "Pandoc is not installed. Run '$SCRIPT_DIR/install.sh' to install"
    exit 0
fi

# if there is only one param and its "help", display help
if [[ "$#" = 1 ]] && [[ "$1" == "-h" ]]; then
    # read all of the template files from the templates folder and remove their extensions
    TEMPLATES=($(ls -1 $SCRIPT_DIR/templates | sed -e 's/\..*$//' | sort))

    echo "API"
    echo "  pdoc [source]"
    echo "  pdoc [source] [-t template name] [-w watch]"
    echo "  pdoc gen [filename]"
    echo
    echo "Availible Templates:"
    for template in ${TEMPLATES[@]}; do
        echo "  $template"
    done
    exit 0
fi

# if running with the gen command, run the generation and exit
if [[ "$#" = 2 ]] && [[ "$1" = "gen" ]]; then
    cat $SCRIPT_DIR/scaffold.md > $2
    exit 0
fi


src_filename="$1"
shift

template=""
watch="false"
while getopts ":wt:" opt; do
  case ${opt} in
    t)
        template="--template $OPTARG.latex"
        ;;
    w)
        watch=true
        ;;
  esac
done

outputName="${src_filename%.*}.pdf"
pdocArgs="$src_filename -o $outputName --from markdown $template --filter $SCRIPT_DIR/filters/plantuml.py --data-dir=$SCRIPT_DIR"

# run the arguments
pandoc $pdocArgs

if [[ $watch = true ]]; then
    echo "Watching for changes in $src_filename"

    # setup the entr to watch for changes, and rerun when changes occur
    # echos "Running pdoc" on each call, also filters out text "zsh returned exit code 0"
    echo $src_filename | entr -s "echo \"Running pdoc\" && pandoc $pdocArgs" | grep -v "zsh returned exit code 0"
fi
