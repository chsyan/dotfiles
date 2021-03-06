export FPATH=$FPATH:$HOME/.config/zsh/plugins:$HOME/.config/zsh/plugins/zsh-completions/src
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'

# export PF_INFO="ascii title os kernel wm pkgs editor shell"
# pfetch
"$HOME"/src/ufetch/ufetch-gentoo

autoload -U colors && colors
stty stop undef

# command history
HISTFILE=~/.cache/shell_history
HISTISZE=100000
SAVEHIST=100000

unsetopt beep
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=*' 'l:|=* r:|=*'
zstyle ':completion:*' gain privileges 1
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

PS1=" > "
precmd () {print -Pn "\e]0;%n@%m: %~\a"}

source "$HOME/.config/zsh/plugins/fsh/fast-syntax-highlighting.plugin.zsh"
source "$HOME/.config/aliasrc"
