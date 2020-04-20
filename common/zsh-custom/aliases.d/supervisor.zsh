alias Sv='./bin/supervisorctl status'
alias Svd='./bin/supervisord'
alias Svk='./bin/supervisorctl shutdown'

_Svs() {
  if [[ $# -gt 0 ]]; then
    ./bin/supervisorctl start "$@"
  else
    ./bin/supervisorctl start all
  fi
}
alias Svs_='declare -f _Svs'
alias Svs='_Svs'

_Svx() {
  if [[ $# -gt 0 ]]; then
    ./bin/supervisorctl stop "$@"
  else
    ./bin/supervisorctl stop all
  fi
}
alias Svx_='declare -f _Svx'
alias Svx='_Svx'

alias Svr='./bin/supervisorctl reload'
