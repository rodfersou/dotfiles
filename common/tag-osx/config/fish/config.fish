set -g -x fish_greeting ''

set -g -x PYTHONSTARTUP ~/.pythonrc.py
set -g -x PYTHON_CONFIGURE_OPTS --enable-unicode=ucs4 --enable-shared
set -g -x XMODIFIERS ''
set -g -x EDITOR vim
set -g -x PYTEST_ADDOPTS -s
set -g -x PATH /usr/local/Cellar/openssl@1.1/1.1.1c/bin $PATH
# set -g -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -g -x PATH /usr/local/opt/expat/bin $PATH

# about zlib
set -g -x CFLAGS -I /Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk/usr/include
set -g -x LDFLAGS -L /usr/local/opt/zlib/lib
set -g -x CPPFLAGS -I /usr/local/opt/zlib/include

# about readline
set -g -x CFLAGS -I /usr/local/opt/readline/include $CFLAGS
set -g -x LDFLAGS -L /usr/local/opt/readline/lib $LDFLAGS

# about openssl
set -g -x CFLAGS -I /usr/local/Cellar/openssl@1.1/1.1.1c/include $CFLAGS
set -g -x LDFLAGS -L /usr/local/Cellar/openssl@1.1/1.1.1c/lib $LDFLAGS

# about SQLite (maybe not necessary)
set -g -x CFLAGS -I /usr/local/opt/sqlite/include $CFLAGS
set -g -x LDFLAGS -L /usr/local/opt/sqlite/lib $LDFLAGS

# about expat
set -g -x LDFLAGS -L /usr/local/opt/expat/lib
set -g -x CPPFLAGS -I /usr/local/opt/expat/include

#set -g -x TZ America/Sao_Paulo
set -g -x LC_ALL en_US.UTF-8
set -g -x LANG en_US.UTF-8

if test (tty) = /dev/ttys001
  while test -z (echo (ls -A ~/.dotfiles/sensitive))
    cd ~/.dotfiles
    make
    cd ~
    reset
  end
end
