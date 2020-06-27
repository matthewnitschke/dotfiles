alias sudo='sudo ' # fixes the issue of running aliases with sudo

alias desk="cd ~/Desktop"
alias mic="micro"
alias lg="lazygit"
alias c="code --extensions-dir $HOME/dotfiles/extensions --user-data-dir $HOME/dotfiles/user_data"

sb() {
  local branches branch
  branches=$(git --no-pager branch) &&
  branch=$(echo "$branches" | fzf +m -i) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}