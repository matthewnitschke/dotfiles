#!/bin/bash

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

cp $SCRIPT_DIR/pre-push $SCRIPT_DIR/../.git/hooks