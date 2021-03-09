alias sudo='sudo ' # fixes the issue of running aliases with sudo

alias desk="cd ~/Desktop"
alias mic="micro"
alias lg="lazygit"
alias p="pet exec"
alias c="code ./"

# cleans the local maven cache
alias maven-local-clean="mvn dependency:purge-local-repository -DactTransitively=false -DreResolve=false --fail-at-end"

# tmp-note opens a temporary file in /var/tmp in vscode.
# Used for quick notes that will be deleted after use
tmp-note() {
  FILE=/var/tmp/tmp-note.txt
  echo "" > $FILE # clear the contents of the file
  code $FILE # open in vscode
}

sb() {
  local branches branch
  branches=$(git --no-pager branch) &&
  branch=$(echo "$branches" | fzf +m -i) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

stripcolor() {
  sed $'s,\x1b\\[[0-9;]*[a-zA-Z],,g'
}

alias docker-nuke-containers="docker kill $(docker ps -q) && docker rm $(docker ps -a -q)"
alias docker-nuke-images="docker rmi $(docker images -q)"
alias docker-nuke="docker-nuke-containers && docker-nuke-images"