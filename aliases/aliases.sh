SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

alias sudo='sudo ' # fixes the issue of running aliases with sudo

alias desk="cd ~/Desktop"
alias mic="micro"
alias lg="lazygit"
alias p="pet exec"

alias gh="cd ~/Programming/GitHub"
alias gl="cd ~/Programming/GitLab"

sb() {
  local branches branch
  branches=$(git --no-pager branch) &&
  branch=$(echo "$branches" | fzf +m -i) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

sbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m -i) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

if [[ $OSTYPE == darwin* ]]; then
    source $SCRIPT_DIR/osx.sh
else
    source $SCRIPT_DIR/linux.sh
fi
