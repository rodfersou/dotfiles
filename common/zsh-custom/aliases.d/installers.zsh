_python_environ() {
  unset SDKROOT
  unset CPATH
  unset CFLAGS
  unset CPPFLAGS
  unset LDFLAGS
  unset PKG_CONFIG_PATH

  # libs
  export SDKROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
  # export CPATH="$SDKROOT/usr/include:/usr/local/include"
  export CFLAGS="-I $SDKROOT/usr/include -I /usr/local/include"
  export CPPFLAGS="-I $SDKROOT/usr/include -I /usr/local/include"
  export LDFLAGS="-L $SDKROOT/usr/lib -L /usr/local/lib"
  # export PKG_CONFIG_PATH="$SDKROOT/usr/lib/pkgconfig:/usr/local/lib/pkgconfig"

  # about llvm
  export LDFLAGS="-Wl,-rpath,/usr/local/lib $LDFLAGS"

  libs=(
    libxml2 bison readline openssl sqlite expat icu4c
    libyaml xz jpeg libiconv libzip gettext qt wxmac
    pcre
  );
  for lib in $libs
  do
    if [ -d "/usr/local/opt/$lib/bin" ]
    then
      export PATH="/usr/local/opt/$lib/bin:$PATH";
    fi
    if [ -d "/usr/local/opt/$lib/include" ]
    then
      # export CPATH="/usr/local/opt/$lib/include:$CPATH";
      export CFLAGS="-I /usr/local/opt/$lib/include $CFLAGS";
      export CPPFLAGS="-I /usr/local/opt/$lib/include $CPPFLAGS";
    fi
    if [ -d "/usr/local/opt/$lib/lib" ]
    then
      export LDFLAGS="-L /usr/local/opt/$lib/lib $LDFLAGS";
    fi
    # if [ -d "/usr/local/opt/$lib/lib/pkgconfig" ]
    # then
    #   export PKG_CONFIG_PATH="/usr/local/opt/$lib/lib/pkgconfig:$PKG_CONFIG_PATH";
    # fi
  done

  ### Sometimes get pyexpat error; run brew update && brew upgrade and restart machine
}

_php_environ() {
  unset SDKROOT
  unset CPATH
  unset CFLAGS
  unset CPPFLAGS
  unset LDFLAGS
  unset PKG_CONFIG_PATH

  # libs
  export SDKROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
  export CFLAGS="-I $SDKROOT/usr/include -I /usr/local/include"
  export CPPFLAGS="-I $SDKROOT/usr/include -I /usr/local/include"

  for lib in `find /usr/local/opt/* -depth 0`
  do
    if [ -d "$lib/bin" ]
    then
      export PATH="$lib/bin:$PATH";
    fi
    if [ -d "$lib/include" ]
    then
      export CFLAGS="-I $lib/include $CFLAGS";
      export CPPFLAGS="-I $lib/include $CPPFLAGS";
    fi
  done

  # about libxml2
  export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig:$PKG_CONFIG_PATH"
  # about openssl
  export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig:$PKG_CONFIG_PATH"
  # about SQLite (maybe not necessary)
  export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig:$PKG_CONFIG_PATH"
  # about icu4c
  export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"

  # PHP specific environ
  export PHP_WITHOUT_PEAR=yes
}

_erlang_environ() {
  unset SDKROOT
  unset CPATH
  unset CFLAGS
  unset CPPFLAGS
  unset LDFLAGS
  unset PKG_CONFIG_PATH

  # libs
  export SDKROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
  # export CPATH="$SDKROOT/usr/include:/usr/local/include"
  export CFLAGS="-I $SDKROOT/usr/include -I /usr/local/include"
  # export CPPFLAGS="-I $SDKROOT/usr/include -I /usr/local/include"
  export LDFLAGS="-L $SDKROOT/usr/lib -L /usr/local/lib"
  # export PKG_CONFIG_PATH="$SDKROOT/usr/lib/pkgconfig:/usr/local/lib/pkgconfig"

  # about llvm
  export LDFLAGS="-Wl,-rpath,/usr/local/lib $LDFLAGS"
  # export CC="clang"
  # export CXX="$(CC)++"

  # about erlang
  export CFLAGS="-O2 -g $CFLAGS";

  # libs=`find /usr/local/opt/* -depth 0 -exec basename {} \;`;
  libs=(
    libxml2 bison readline openssl sqlite expat icu4c
    libyaml xz jpeg libiconv libzip gettext qt wxmac
  );
  for lib in $libs
  do
    if [ -d "/usr/local/opt/$lib/bin" ]
    then
      export PATH="/usr/local/opt/$lib/bin:$PATH";
    fi
    if [ -d "/usr/local/opt/$lib/include" ]
    then
      # export CPATH="/usr/local/opt/$lib/include:$CPATH";
      export CFLAGS="-I /usr/local/opt/$lib/include $CFLAGS";
      # export CPPFLAGS="-I /usr/local/opt/$lib/include $CPPFLAGS";
    fi
    if [ -d "/usr/local/opt/$lib/lib" ]
    then
      export LDFLAGS="-L /usr/local/opt/$lib/lib $LDFLAGS";
    fi
    # if [ -d "/usr/local/opt/$lib/lib/pkgconfig" ]
    # then
    #   export PKG_CONFIG_PATH="/usr/local/opt/$lib/lib/pkgconfig:$PKG_CONFIG_PATH";
    # fi
  done

  # about pdftotext
  # export CPPFLAGS="-std=c++11 $CPPFLAGS"
}

_install_python() {
  _default_environ

  if [[ $# -gt 0 ]]; then
    asdf install python $1
  else
    asdf install python 2.7.17
    asdf install python 3.7.7
    asdf install python 3.8.2
    asdf global python 3.7.7 2.7.17
  fi
}
alias install_python_='declare -f _install_python'
alias install_python='_install_python'


_install_ruby() {
  _default_environ

  if [[ $# -gt 0 ]]; then
    asdf install ruby $1
  else
    asdf install ruby 2.7.1
    asdf global ruby 2.7.1
  fi
}
alias install_ruby_='declare -f _install_ruby'
alias install_ruby='_install_ruby'


_install_php() {
  _php_environ

  if [[ $# -gt 0 ]]; then
    asdf install php $1
  else
    asdf install php 7.4.4
    asdf global php 7.4.4
  fi
}
alias install_php_='declare -f _install_php'
alias install_php='_install_php'


_install_erlang() {
  _erlang_environ

  if [[ $# -gt 0 ]]; then
    asdf install erlang $1
  else
    asdf install erlang 22.3.2
    asdf global erlang 22.3.2
  fi
}
alias install_erlang_='declare -f _install_erlang'
alias install_erlang='_install_erlang'


_install_languages() {
  install_python
  install_ruby
  install_php
  install_erlang
}
alias install_languages_='declare -f _install_languages'
alias install_languages='_install_languages'
