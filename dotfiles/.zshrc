export ZSH="{{ DOTFILES_HOME_DIRECTORY }}/.oh-my-zsh"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

ZSH_THEME="gnzh"

plugins = (
    git
)

source $ZSH/oh-my-zsh.sh

setopt extendedglob nobeep

# Use modern completion system
autoload -Uz compinit
compinit

alias grep="grep --color=auto"

#keybinds for x terminals
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

#for tmux
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[OC' forward-word
bindkey '^[OD' backward-word

#for urxvt
bindkey '\eOc' forward-word
bindkey '\eOd' backward-word
bindkey	'^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line

#for both
bindkey '^[[3~' delete-char
bindkey '^[[Z' undo

eval $(dircolors {{ DOTFILES_HOME_DIRECTORY }}/.dircolors-solarized/dircolors.256dark)
