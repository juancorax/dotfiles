export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
export XMODIFIERS=@im=fcitx

picom -b &
setxkbmap -option "caps:ctrl_modifier" &
[ -f "$HOME/.screenlayout/default.sh" ] && "$HOME/.screenlayout/default.sh" &
xrdb "$HOME/.Xresources" &

exec awesome
