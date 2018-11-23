#!/bin/sh

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

# read all of the template files from the templates folder and remove their extensions
TEMPLATES=($(ls -1 $SCRIPT_DIR/templates | sed -e 's/\..*$//' | sort))

# if there is only one param and its "help", display help
if [[ "$#" = 1 ]] && [[ "$1" = "help" ]]; then
    echo "API"
    echo "  pdoc [source]"
    echo "  pdoc [template] [source]"
    echo "  pdoc gen [filename]"
    echo
    echo "Availible Templates:"
    for template in ${TEMPLATES[@]}; do
        echo "  $template"
    done
else
    if [[ "$1" = "gen" ]] && [[ "$#" = 2 ]]; then
        cat $SCRIPT_DIR/scaffold.md > $2
    
    elif [[ "$#" = 1 ]]; then
        outputName="${1%.*}"
        pandoc $1 -o $outputName.pdf --from markdown --filter $SCRIPT_DIR/filters/plantuml.py --data-dir=$SCRIPT_DIR
    
    elif [[ "$#" = 2 ]]; then
        outputName="${2%.*}"
        pandoc $2 -o $outputName.pdf --from markdown --template $1.latex --filter $SCRIPT_DIR/filters/plantuml.py --data-dir=$SCRIPT_DIR
    else
        echo "Invalid input, run 'pdoc help' for api"
    fi

    if [[ -d "plantuml-images" ]]; then
        rm -r plantuml-images
    fi
fi
