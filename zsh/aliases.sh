SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

alias sudo='sudo ' # fixes the issue of running aliases with sudo

alias desk="cd ~/Desktop"
alias mic="micro"
alias lg="lazygit"
alias p="pet exec"


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

typora() {
	open $1 -a 'Typora'
}

stripcolor() {
  sed $'s,\x1b\\[[0-9;]*[a-zA-Z],,g'
}

gcam() {
  git add ./
  git commit -m $1
}

# spotify aliases (uses the oh-my-zsh spotify app thing contained in the osx package)
alias sp="spotify"
alias sp:math="spotify play uri spotify:user:1242045734:playlist:5iRg1hUvSGW6jP8DW7duPy"
alias sp:rap="spotify play uri spotify:user:1242045734:playlist:3XMO2yBkB9YHVRM23gMGyL"
alias sp:alt="spotify play uri spotify:user:1242045734:playlist:0UHS0SucJrcymLmqzCzTJd"
alias sp:tech="spotify play uri spotify:user:1242045734:playlist:2XjuySZCdqT6PnBchVgwd8"
alias sp:jazz="spotify play uri spotify:user:1242045734:playlist:7N2ToGpwgpx5bGnu8xCvgE"

