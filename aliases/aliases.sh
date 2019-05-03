SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

alias sudo='sudo ' # fixes the issue of running aliases with sudo

alias copy="clipcopy"
alias desk="cd ~/Desktop"

# cd's to the root of the git repo
alias gr='cd $(git rev-parse --show-toplevel)'

alias checkoff="node ~/scripts/custom-apps/checkoff/checkoff.js"

alias gh="cd ~/Programming/GitHub"
alias gl="cd ~/Programming/GitLab"

alias pdoc="~/scripts/pandoc/pandoc.sh"

git-fzf-switch-branch() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m -i --layout=reverse) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

git-fzf-switch-branch-remote() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m -i --layout=reverse) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}


if [[ $OSTYPE == darwin* ]]; then
    source $SCRIPT_DIR/osx.sh
else
    source $SCRIPT_DIR/linux.sh
fi
