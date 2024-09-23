setxkbmap 'us(altgr-intl)'; xmodmap ~/.Xmodmap.d/us_swap_keys
sudo chgrp video /sys/class/backlight/intel_backlight/brightness
sudo chmod g+w /sys/class/backlight/intel_backlight/brightness
echo 200 > /sys/class/backlight/intel_backlight/brightness
xgamma -gamma 0.7

tilda &
urxvt -name 'UKuake' +sb -pe default,kuake -kuake-hotkey F2 -e screen -RRaAD &
# exec --no-startup-id hsetroot -solid "#000000"
udiskie -a -s &
# exec --no-startup-id start-pulseaudio-x11
nm-applet &
blueman-applet &
i3lock -c 000000 -I 0 &

