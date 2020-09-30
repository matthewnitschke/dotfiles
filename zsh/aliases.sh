alias sudo='sudo ' # fixes the issue of running aliases with sudo

alias desk="cd ~/Desktop"
alias mic="micro"
alias lg="lazygit"
alias p="pet exec"
alias c="code ./"

sb() {
  local branches branch
  branches=$(git --no-pager branch) &&
  branch=$(echo "$branches" | fzf +m -i) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

stripcolor() {
  sed $'s,\x1b\\[[0-9;]*[a-zA-Z],,g'
}

gop() {
  if ! command -v gh &> /dev/null
  then
      echo "GitHub cli not found. Please install gh and run again"
      exit
  fi

  CURRENT_BRANCH=$(git branch --show-current)
  if [[ $CURRENT_BRANCH == "master" ]]; then
    gh repo view --web
  else
    gh pr view --web
  fi
}