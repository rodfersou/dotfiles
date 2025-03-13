export CURRENT_OS="$(uname -s)"
if [ $CURRENT_OS = "Linux" ]; then
    export CURRENT_OS="$(lsb_release -si)"
fi

if [ $CURRENT_OS = "Ubuntu" ]; then
    export DISPLAY=:0
fi

if [ $CURRENT_OS = "Darwin" ]; then
    alias deluge='/Applications/Deluge.app/Contents/MacOS/Deluge > /dev/null 2> /dev/null &'
fi
alias signal-desktop='signal-desktop --start-in-tray > /dev/null 2> /dev/null &'

_android() {
  ip=$1
  if [ "$(adb devices | grep $1)" = "" ]
  then
    adb connect $ip
  fi
  # scrcpy -s $ip -S -b2M -m800 --max-fps 15 > /dev/null 2> /dev/null &
  scrcpy -s $ip -S > /dev/null 2> /dev/null &
  pid=$!

  # If this script is killed, kill the command.
  trap "kill $pid 2> /dev/null" EXIT
  # While command is running...
  while kill -0 $pid 2> /dev/null
  do
      adb -s $ip shell input keyevent mouse
      sleep 5
  done
  # Disable the trap on a normal exit.
  trap - EXIT
}
alias android_='declare -f _android'
alias android='_android'
alias moto='android 192.168.9.3:5555 &'
alias htc='android 192.168.9.4:5555 &'

# _xgamma() {
#     xrandr --output eDP-1-1 --gamma $1:$1:$1
# }
# alias xgamma_='declare -f _xgamma'
# alias xgamma='_xgamma'

_show_ip() {
  if [ "$(uname -s)" = "Darwin" ]
  then
    ipconfig getifaddr en0
  else
    hostname -I
  fi
}
alias show_ip_='declare -f _show_ip'
alias show_ip='_show_ip'

_caffeinate() {
  if [ "$(uname -s)" = "Darwin" ]
  then
    caffeinate -dim
  else
    systemd-inhibit
  fi
}
alias caffeinate_='declare -f _caffeinate'
alias caffeinate='_caffeinate'

_topcpu() {
    echo "APP              CPU   MEM";
    top -b -n1                                                                                  \
        | tail -n +8                                                                            \
        | awk '{ print $12, $9, $10 }'                                                          \
        | awk '{ CPU[$1] += $2; MEM[$1] += $3 } END { for (k in CPU) print k, CPU[k], MEM[k] }' \
        | sort -k2 -n                                                                           \
        | tail -n 10                                                                            \
        | column -t                                                                             \
        | tac
}
alias topcpu_='declare -f _topcpu'
alias topcpu='_topcpu'


_topmem() {
    echo "APP              CPU   MEM";
    top -b -n1                                                                                  \
        | tail -n +8                                                                            \
        | awk '{ print $12, $9, $10 }'                                                          \
        | awk '{ CPU[$1] += $2; MEM[$1] += $3 } END { for (k in CPU) print k, CPU[k], MEM[k] }' \
        | sort -k3 -n                                                                           \
        | tail -n 10                                                                            \
        | column -t                                                                             \
        | tac
}
alias topmem_='declare -f _topmem'
alias topmem='_topmem'



alias ukuake='urxvt -name "UKuake" +sb -pe default,kuake -kuake-hotkey F1 -e tmuxp load -y default'
# alias vi='vim'
# yaourt -S vi-vim-symlink
alias Sb='subl . X &'

# Check Port
alias Nc='nc -z -v'

_Cc() {
  if [[ $# -gt 0 ]]; then
    if [[ $1 == *.css ]]; then
      ln -sf $1 ${1%.css}.less
      csscomb ${1%.css}.less
      rm ${1%.css}.less
    else
      csscomb $1
    fi
  else
    echo "Usage: Cc <file>"
  fi
}
alias Cc_='declare -f _Cc'
alias Cc='_Cc'

alias winetricks32='WINEPREFIX=~/.wine32 WINEARCH=win32 winetricks'
alias wine32='WINEPREFIX=~/.wine32 WINEARCH=win32 wine'
#alias steam='optirun -c jpeg steam'
alias bwrap='bwrap --dev-bind / / bash'
alias increase_tmpfs='mount -o remount,size=5G,noatime /tmp'
alias handbrake-gtk='ghb'
alias youtube-dl-best='youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio" --merge-output-format mp4'
alias fix-video='killall VDCAssistant'
alias youtube-dl-480p='youtube-dl -f "bestvideo[height<=480]+bestaudio/best[height<=480]" --merge-output-format mp4'
alias youtube-dl-720p='youtube-dl -f "bestvideo[height<=720]+bestaudio/best[height<=720]" --merge-output-format mp4'
alias youtube-dl-sub='youtube-dl --write-sub --sub-lang en --skip-download'
alias youtube-dl-music='youtube-dl --extract-audio --audio-format mp3'

_castnow-youtube() {
  if [[ $# -gt 0 ]]; then
    youtube-dl -o - $1 | castnow --quiet -
  else
    echo "Usage: castnow-youtube <url>"
  fi
}
alias castnow-youtube_='declare -f _castnow-youtube'
alias castnow-youtube='_castnow-youtube'
