export GTK_THEME=Adwaita:dark
export QT_QPA_PLATFORMTHEME=qt5ct
#export DISPLAY=:1

/usr/libexec/gsd-xsettings &

# setxkbmap 'us(altgr-intl)'; xmodmap ~/.Xmodmap.d/us_swap_keys
#sudo chgrp video /sys/class/backlight/intel_backlight/brightness
#sudo chmod g+w /sys/class/backlight/intel_backlight/brightness
#echo 200 > /sys/class/backlight/intel_backlight/brightness
brightnessctl -P s 2000 &
xgamma -gamma 0.6 &

#dunst &

gnome-terminal --profile tmuxp &
# wezterm &
#tabby &
#tilda &
#urxvt -name 'UKuake' +sb -pe default,kuake -kuake-hotkey F3 -e screen -RRaAD &
hsetroot -solid "#000000" &
GTK_THEME=Adwaita:dark udiskie -a -s &
pasystray &
nm-applet &
GTK_THEME=Adwaita:dark blueman-applet &
keynav &
i3lock -c 000000 -I 0 &


~/.i3/update_xmodmap.sh &
