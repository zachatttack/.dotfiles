export EDITOR=/usr/bin/nvim
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
exec feh --bg-scale ~/Pictures/wallpaper.jpg &
exec xinput --set-prop 10 'libinput Accel Profile Enabled' 0, 1 &
exec xrandr --output DP-4 --primary --mode 2560x1440 --rate 144 &
exec picom --config $HOME/.picom.conf &
exec sxhkd &
exec mopidy &
exec $HOME/git/dwmblocks/dwmblocks &

export PATH="$HOME/.cargo/bin:$PATH"
