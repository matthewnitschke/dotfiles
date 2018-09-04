#!/bin/bash
 
if [ -f "~/.hyper.js" ];
then
    # only setup hyper if there is a ~/.hyper.js file on this computer (meaning hyper is installed)
    mkdir -p ~/.hyper_plugins/local
    ln -f ./vladimir.js ~/.hyper_plugins/local/vladimir.js # setup vladimir hard link for hyper
else
   echo "~/.hyper.js does not exist, skipping hyper installation"
fi