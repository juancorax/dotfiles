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

# path
path=(
  "$HOME/.fzf/bin"
  $path
)
export PATH

# aliases
alias ls='exa -al --color=always --group-directories-first'
alias grep='grep --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias cat='bat'
alias vi='nvim'
alias vim='nvim'

# vi mode
bindkey -v
export KEYTIMEOUT=25
bindkey -M viins "kj" vi-cmd-mode
bindkey -v '^?' backward-delete-char

# change cursor shape for different vi modes
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;
        viins|main) echo -ne '\e[5 q';;
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

# autocompletion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# autosuggestions
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^ ' autosuggest-accept

# fzf key bindings & fuzzy completion
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

# automatically load mise tools & environment variables
eval "$(mise activate zsh)"

# syntax highlighting
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
