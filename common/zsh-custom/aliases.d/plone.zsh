# _Bs() {
#   README='Bootstrap custom environment'
#   cp $HOME/.buildout/custom.bootstrap.py .
#   if [ ! -e buildout.cfg ]
#   then
#     ln -sf development.cfg buildout.cfg
#   fi
#   if [ ! -e custom.buildout.cfg ]
#   then
#     cp buildout.cfg custom.buildout.cfg
#   fi
#   cp -R $HOME/.buildout/custom.d .
#   if [ ! -f custom.cfg ]
#   then
#     cp $HOME/.buildout/custom.cfg .
#   fi
#   for i in custom.d/*
#   do
#     if [ ! grep -q $i custom.cfg ]
#     then
#       echo 'WARNING: $i config file not loaded.'
#     fi
#   done
#   C pipenv run python custom.bootstrap.py -c custom.cfg --setuptools-version=33.1.1 --buildout-version=2.9.5
# }
# alias Bs_='declare -f _Bs'
# alias -g Bs='_Bs'

# _Bc() {
#   README='Clear environment'
#   rm bootstrap-buildout.py
#   rm buildout.cfg.custom
#   rm buildout.custom.cfg
#   rm -rf custom*
# }
# alias Bc_='declare -f _Bc'
# alias -g Bc='_Bc'

# alias -g B='R Bs; ./bin/buildout -c custom.cfg'
# alias Ba='R ./bin/buildout -c custom.cfg annotate'
# alias Bv='R ./bin/buildout -c custom.cfg -vvvv'
# alias Bn='R ./bin/buildout -c custom.cfg -N'
# alias Br='Bc; B'

# _Cs() {
#   README='Cache search'
#   ag -i $1 -G "requires\.txt$" /srv/cache/eggs/*
# }
# alias Cs_='declare -f _Cs'
# alias Cs='_Cs'

# _Csg() {
#   README='Cache search with grep'
#   grep -Ri --include="requires.txt" "$1" /srv/cache/eggs/*
# }
# alias Csg_='declare -f _Csg'
# alias Csg='_Csg'

# alias Z='./bin/zeo status'
# alias Zs='./bin/zeo start'
# alias Zx='./bin/zeo stop'

# # alias I='R echo "http://localhost:8080/Plone"; echo "http://rodrigo.dedyn.io:58080/Plone"; RELOAD_PATH=src/ ./bin/instance fg'
# alias I='R RELOAD_PATH=src/ ./bin/instance fg'
# alias I4='R RELOAD_PATH=src/ ./bin/instance4x fg'
# alias I5='R RELOAD_PATH=src/ ./bin/instance5x fg'
# alias Ib='R PATH=`pwd`/bin:$PATH RELOAD_PATH=src/ ./bin/instance fg'
# alias Ist='./bin/instance status'
# alias Is='./bin/instance start'
# alias Ix='./bin/instance stop'

# _Id() {
#   handler=bin/instance
#   if [ -f bin/instance-debug ]
#   then
#     handler=bin/instance-debug
#   fi
#   reset
#   if [[ $# -gt 0 ]]
#   then
#     $handler -O $1 debug
#     return
#   fi
#   $handler -O Plone debug
# }
# alias Id_='declare -f _Id'
# alias Id='_Id'

# alias Ir='R ./bin/instance -O Plone run'
# alias Ia='./bin/instance adduser admin admin'

# # alias I1='R echo "http://localhost:8081/Plone"; echo "http://rodrigo.dedyn.io:58081/Plone"; RELOAD_PATH=src/ ./bin/instance1 fg'
# alias I1='R RELOAD_PATH=src/ ./bin/instance1 fg'
# alias I1b='R PATH=`pwd`/bin:$PATH RELOAD_PATH=src/ ./bin/instance1 fg'
# alias I1st='./bin/instance1 status'
# alias I1s='./bin/instance1 start'
# alias I1x='./bin/instance1 stop'

# _I1d() {
#   if [[ $# -gt 0 ]]; then
#     R ./bin/instance1 -O $1 debug
#   else
#     R ./bin/instance1 -O Plone debug
#   fi
# }
# alias I1d_='declare -f _I1d'
# alias I1d='_I1d'

# alias I1r='R ./bin/instance1 run'
# alias I1a='./bin/instance1 adduser admin admin'

# alias Ms='tmux new-session "make start-backend" \; split-window -h "make start-frontend" \; select-pane -t 0'
# alias Mst='tmux new-session "make start-test-backend" \; split-window -h "make start-test-frontend" \; split-window -f "make start-test" \;  select-pane -t 0'

# alias Ww='R ./bin/watch-'
# alias Ew='R ./bin/env-'
# alias Bw='R ./bin/build-'
# alias Dw='R ./bin/debug-'

# # alias O='R echo "http://localhost:8069"; echo "http://rodrigo.dedyn.io:58069"; ./bin/start_odoo'

# # _N() {
# #   # trap ctrl-c and call ctrl_c()
# #   trap ctrl_c INT
# #   function ctrl_c() {
# #     R ./bin/npm_build
# #   }
# #   R ./bin/npm_watch
# # }
# # alias N='R ./bin/npm_watch'
# # alias Nd='R ./bin/npm_dev'
# # alias Nb='R ./bin/npm_build'
# # alias Nt='R ./bin/npm_test'
# # alias Ntw='R ./bin/npm_test_watch'
# # alias W='R ./bin/webpack_env'
