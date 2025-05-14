#!/bin/bash
# install expect: udo dnf install -y expect
unbuffer bluetoothctl | while read -r line; do
    if echo "$line" | grep -q "Connected: yes"; then
        device=$(echo "$line" | python -c "import sys, re; print(re.search(r'\ ([0-9A-F]{2}:.*?)\ ', sys.stdin.read()).group(1))")
        echo "Device connected: $device"
        if bluetoothctl info "$device" | grep -qi "keyboard"; then
            echo "Keyboard connected: $device"
            sleep 0.3
            setxkbmap 'us(altgr-intl)'
            xmodmap "$HOME/.Xmodmap.d/us_swap_keys"
            echo "keyboard configuration updated"
        fi
    fi
done
