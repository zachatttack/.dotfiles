feh --bg-scale $HOME/Pictures/wallpaper.png
xrdb $HOME/.Xresources
setxkbmap -option 'ctrl:nocaps'
dwmblocks &
sxhkd &

exec dwm 
