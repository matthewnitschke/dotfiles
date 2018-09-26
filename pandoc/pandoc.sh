#!/bin/bash

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

# read all of the template files from the templates folder and remove their extensions
TEMPLATES=($(ls -1 $SCRIPT_DIR/templates | sed -e 's/\..*$//' | sort))

function pdoc(){
    # if there is only one param and its "help", display help
    if [ "$#" == 1 ] && [ "$1" == "help" ]; then
        echo "API"
        echo "  pdoc [source] [destination]"
        echo "  pdoc [template] [source] [destination]"
        echo
        echo "Availible Templates:"
        for template in ${TEMPLATES[@]}; do
                echo "  $template"
        done
    elif [ "$#" == 2 ]; then
        pandoc $1 -o $2 --from markdown --data-dir=$SCRIPT_DIR
    elif [ "$#" == 3 ]; then
        pandoc $2 -o $3 --from markdown --template $1 --data-dir=$SCRIPT_DIR
    else
        echo "Invalid input, run 'pdoc help' for api"
    fi
}