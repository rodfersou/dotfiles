alias deluge='/Applications/Deluge.app/Contents/MacOS/Deluge X'

alias adsm='adb connect 192.168.9.3:5555'
alias adsh='adb connect 192.168.9.3:5555'
alias adk='adb kill-server'
alias adcm='scrcpy -s 192.168.9.3:5555 -S X'
alias adch='scrcpy -s 192.168.9.4:5555 -S X'
alias adfm='scrcpy -s 192.168.9.3:5555 -S -b2M -m800 --max-fps 15 X'
alias adfh='scrcpy -s 192.168.9.4:5555 -S -b2M -m800 --max-fps 15 X'

alias ukuake='urxvt -name "UKuake" +sb -pe default,kuake -kuake-hotkey F1 -e screen -RRaAD'
# alias vi='vim'
# yaourt -S vi-vim-symlink
alias Sb='subl . X &'

alias V='varnishadm backend.list'
# Check Port
alias Nc='nc -z -v'
alias ClearNginx='cd /var/lib/nginx/cache && rm -rf {0..9} {a..f}'

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
alias Cc_='declare -f _cdo'
alias Cc='_Cc'

alias winetricks32='WINEPREFIX=~/.wine32 WINEARCH=win32 winetricks'
alias wine32='WINEPREFIX=~/.wine32 WINEARCH=win32 wine'
alias steam='optirun -c jpeg steam'
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
