export ZSH="{{ DOTFILES_HOME_DIRECTORY }}/git/oh-my-zsh"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export TERM="rxvt-unicode"
export EDITOR="/usr/bin/vim"
export GPG_TTY=$(tty)
export FONTCONFIG_PATH=/etc/fonts
export PATH="$PATH:{{ DOTFILES_HOME_DIRECTORY }}/.pyenv/bin:{{ DOTFILES_HOME_DIRECTORY }}/bin"

ZSH_THEME="gnzh"

plugins=(git zsh-dircolors-solarized vi-mode)

source $ZSH/oh-my-zsh.sh

setopt extendedglob nobeep

# Use modern completion system
autoload -Uz compinit
compinit

alias grep="grep --color=auto"

#keybinds for x terminals
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line

#for tmux
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

#for urxvt
bindkey	'^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line

#for both
bindkey '^[[3~' delete-char
bindkey '^[[Z' undo

alias hgrep="history | grep "
alias vim="nvim"

setupsolarized

source ~/.fzf.zsh
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
