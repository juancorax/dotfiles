# zap
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
export HISTSIZE=1000
export SAVEHIST=500
export HISTFILE="$HOME/.zsh_history"
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt inc_append_history
setopt share_history

# default apps
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

# aliases
alias ls='exa -al --color=always --group-directories-first'
alias grep='grep --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias cat='bat'
alias vi='nvim'
alias vim='nvim'

# plugins
plug "zsh-users/zsh-autosuggestions"
export VI_MODE_ESC_INSERT="kj" && plug "zap-zsh/vim"
plug "zsh-users/zsh-syntax-highlighting"

# keybinds
bindkey '^ ' autosuggest-accept

# path
export PATH="$HOME/.asdf/shims:$HOME/.fzf/bin:$PATH"
source <(fzf --zsh)

# fzf config
export FZF_DEFAULT_OPTS="
  --layout='reverse' --prompt='  ' --pointer=' ' --marker='>' --separator='' --scrollbar=''
  --color=fg:#c5c9c5,bg:#181616,hl:#2D4F67,fg+:#ffffff,bg+:#0d0c0c
  --color=gutter:#181616,hl+:#7FB4CA,info:#a6a69c,marker:#7FB4CA,spinner:#a6a69c
"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude '.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --strip-cwd-prefix --exclude '.git'"

_fzf_compgen_path() {
  fd --hidden --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --exclude ".git" . "$1"
}

# prompt
PS1=$'\n%F{#0087ff}%~%f\n%F{#00ffff}$%f '
