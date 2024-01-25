#!/bin/sh

# zap
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
HISTSIZE=100
SAVEHIST=100
HISTFILE="$HOME/.zsh_history"

# default apps
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

# aliases
alias ls='exa -al --color=always --group-directories-first'
alias grep='grep --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias cat='bat --theme=OneHalfDark'
alias vi='nvim'
alias vim='nvim'

# plugins
plug "zsh-users/zsh-autosuggestions"
export VI_MODE_ESC_INSERT="kj" && plug "zap-zsh/vim"
plug "zsh-users/zsh-syntax-highlighting"

# keybinds
bindkey '^ ' autosuggest-accept

# path
export PATH="$HOME/.local/bin:$HOME/.local/share/fnm:$HOME/.pyenv/bin:$HOME/.rbenv/bin:$PATH"
eval "$(fnm env --shell zsh)"
eval "$(pyenv init - zsh)"
eval "$(rbenv init - zsh)"

# prompt
PS1=$'\n%F{#0087ff}%~%f\n%F{#00ffff}$%f '
