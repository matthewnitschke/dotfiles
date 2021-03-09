# Installed by $home/dotfiles/zsh/install.sh

export ZSH="$HOME/.oh-my-zsh"

source ~/dotfiles/zsh/zshrc.sh

ZSH_THEME="vladimir"

plugins=(
    {{plugins}}
)

source $ZSH/oh-my-zsh.sh

source ~/dotfiles/zsh/aliases.sh