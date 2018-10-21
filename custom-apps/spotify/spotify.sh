#!/bin/bash

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

playlistNames=$(jq -r keys[] $SCRIPT_DIR/playlists.json)

for playlistName in $playlistNames; do
    echo $playlistName
done