#!/bin/sh

# pandocs installation takes awhile, and I dont need it on every computer, so the installation is separate

if [[ ! -x "$(command -v brew)" ]]; then
    brew install "pandoc"
    brew cask install "mactex"
    brew install "plantuml" # for uml diagrams in pandoc
    brew install "entr" # for pdoc file changed watching and rebuilding
else
    echo "Pandoc installation currently only supported for systems with homebrew installed"
    exit 1
fi
