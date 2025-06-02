# add ~/.local/bin to the PATH
typeset -U path PATH
path=("$HOME/.local/bin" $path)
export PATH
