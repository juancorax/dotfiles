nm-applet &
setxkbmap -option "caps:ctrl_modifier" &
xrandr --output HDMI-1 --primary --mode 1600x900 --pos 0x0 --rotate normal --output HDMI-2 --off --output DP-1 --mode 1024x768 --pos 1600x0 --rotate normal &
feh --recursive --bg-fill --randomize ~/wallpapers &
exec awesome
