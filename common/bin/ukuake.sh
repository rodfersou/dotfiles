#!/bin/bash
urxvt -name "UKuake" -T "UKuake" -depth 32 -bg rgba:0000/0000/0000/eeee +sb -pe default,kuake -kuake-hotkey F1 -e screen -RRaAD > /dev/null 2> /dev/null &
urxvt -name "UKuake2" -T "UKuake2" -depth 32 -bg rgba:0000/0000/0000/eeee +sb -pe default,kuake -kuake-hotkey F2 > /dev/null 2> /dev/null &
