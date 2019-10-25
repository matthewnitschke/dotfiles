if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="blue"; fi

PROMPT='%{$fg[blue]%}λ%{$reset_color%} '

# RPROMPT='%{$fg[$NCOLOR]%}%p $(git_prompt_info) %{$reset_color%}'
RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX=" ["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_DIRTY="•"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="^"
ZSH_THEME_GIT_PROMPT_CLEAN=""
