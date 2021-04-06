#!/bin/bash

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

INDEX="$1"

prData=$(cat $SCRIPT_DIR/.prs-cache.json | jq --argjson i "$INDEX" '.[$i]')

echo "$prData" | jq --raw-output '
    def colors: {
        "green": "\u001b[32m",
        "red": "\u001b[31m",
        "black": "\u001b[30;1m",
        "reset": "\u001b[0m",
    };

    "\(if .state == "FAILURE" then "\(colors.red)✖\(colors.reset)" else "\(colors.green)✔\(colors.reset)" end) \(colors.black)\(.owner)/\(.repo)\(colors.reset) \(.title)"
'

echo
echo "$prData" | jq --raw-output '
    def colors: {
        "green": "\u001b[32m",
        "red": "\u001b[31m",
        "black": "\u001b[30;1m",
        "reset": "\u001b[0m",
    };

    .checks[] | "  \(if .state == "FAILURE" then "\(colors.red)✖\(colors.reset)" else "\(colors.green)✔\(colors.reset)" end) \(.context)"
'