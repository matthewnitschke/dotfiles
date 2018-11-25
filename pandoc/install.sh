#!/bin/sh

# pandocs installation takes awhile, and I dont need it on every computer, so the installation is separate

brew install "pandoc"
brew cask install "mactex"
brew install "plantuml" # for uml diagrams in pandoc
brew install "entr" # for pdoc file changed watching and rebuilding
