_default_environ() {
  if [ "$(uname -s)" != "Darwin" ]
  then
    return
  fi

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
  if [ "$(uname -s)" != "Darwin" ]
  then
    return
  fi

  _default_environ

  unset CPATH
  unset LDFLAGS
  unset PKG_CONFIG_PATH

  # about libxml2
  export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig:$PKG_CONFIG_PATH"
  # about openssl
  export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig:$PKG_CONFIG_PATH"
  # about SQLite (maybe not necessary)
  export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig:$PKG_CONFIG_PATH"
  # about icu4c
  export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"
}


_erlang_environ() {
  if [ "$(uname -s)" != "Darwin" ]
  then
    return
  fi

  unset SDKROOT
  unset CPATH
  unset CFLAGS
  unset CPPFLAGS
  unset LDFLAGS
  unset PKG_CONFIG_PATH

  # libs
  export SDKROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
  export LDFLAGS="-L $SDKROOT/usr/lib -L /usr/local/lib"

  # about llvm
  export LDFLAGS="-Wl,-rpath,/usr/local/lib $LDFLAGS"
  # about erlang
  export CFLAGS="-O2 -g $CFLAGS";

  libs=(
    libxml2 bison readline openssl sqlite expat icu4c
    libyaml xz jpeg libiconv libzip gettext qt wxmac
    unixodbc
  )
  for lib in $libs
  do
    if [ -d "/usr/local/opt/$lib/bin" ]
    then
      export PATH="/usr/local/opt/$lib/bin:$PATH";
    fi
    if [ -d "/usr/local/opt/$lib/include" ]
    then
      export CFLAGS="-I /usr/local/opt/$lib/include $CFLAGS";
    fi
    if [ -d "/usr/local/opt/$lib/lib" ]
    then
      export LDFLAGS="-L /usr/local/opt/$lib/lib $LDFLAGS";
    fi
  done
}


_install_python() {
  _default_environ

  export PYTHON_CONFIGURE_OPTS="--enable-unicode=ucs4 --enable-shared"

  if [[ $# -gt 0 ]]; then
    asdf install python $1
  else
    asdf install python 2.7.17
    asdf install python 3.7.7
    asdf install python 3.8.2
    asdf global python 3.7.7 2.7.17
    asdf install python anaconda3-2020.02
    (cd .asdf/installs/python/anaconda3-2020.02/bin && http https://raw.githubusercontent.com/pyenv/pyenv/master/pyenv.d/rehash/conda.d/default.list | grep -v "\#" | xargs rm)
    asdf reshim python
  fi
}
alias install_python_='declare -f _install_python'
alias install_python='_install_python'


_install_nodejs() {
  _default_environ

  if [[ $# -gt 0 ]]; then
    asdf install nodejs $1
  else
    asdf install nodejs 11.15.0
    asdf install nodejs 12.16.2
    asdf install nodejs 13.13.0
    asdf global nodejs 12.16.2
  fi
}
alias install_nodejs_='declare -f _install_nodejs'
alias install_nodejs='_install_nodejs'


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

  export PHP_WITHOUT_PEAR=yes

  if [[ $# -gt 0 ]]; then
    asdf install php $1
  else
    asdf install php 7.4.4
    asdf global php 7.4.4
    source "$ZSH_CUSTOM/aliases.d/php.zsh"
    composer global require laravel/installer
  fi
}
alias install_php_='declare -f _install_php'
alias install_php='_install_php'


_install_golang() {
  _default_environ

  if [[ $# -gt 0 ]]; then
    asdf install golang $1
  else
    asdf install golang 1.14.1
    asdf global golang 1.14.1
    go get github.com/prasmussen/gdrive
  fi
}
alias install_golang_='declare -f _install_golang'
alias install_golang='_install_golang'


_install_java() {
  _default_environ

  if [[ $# -gt 0 ]]; then
    asdf install java $1
  else
    asdf install java adopt-openjdk-8u242-b08
    asdf global java adopt-openjdk-8u242-b08

    asdf install maven 3.6.3
    asdf global maven 3.6.3
  fi
}
alias install_java_='declare -f _install_java'
alias install_java='_install_java'


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


_install_rlang() {
  _default_environ

  if [[ $# -gt 0 ]]; then
    bash -c "asdf install rlang $1"
  else
    bash -c "asdf install rlang 3.6.3"
    asdf global rlang 3.6.3
  fi
}
alias install_rlang_='declare -f _install_rlang'
alias install_rlang='_install_rlang'


_install_asdf() {
  if [ "$(uname -s)" = "Darwin" ]
  then
    brew install   \
         autoconf  \
         automake  \
         coreutils \
         curl      \
         libtool   \
         libxml2   \
         libxslt   \
         libyaml   \
         openssl   \
         readline  \
         unixodbc  \
         unzip
  else
    sudo apt -y install  /
         autoconf        /
         automake        /
         libffi-dev      /
         libncurses-dev  /
         libreadline-dev /
         libssl-dev      /
         libtool         /
         libxslt1-dev    /
         libyaml-dev     /
         llvm            /
         unixodbc-dev 
  fi
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8
}
alias install_asdf_='declare -f _install_asdf'
alias install_asdf='_install_asdf'


_install_asdf_plugins_python() {
  if [ "$(uname -s)" = "Darwin" ]
  then
    brew install     \
         autoconf    \
         expat       \
         openssl@1.1 \
         pkg-config  \
         readline    \
         sqlite3     \
         xz          \
         zlib
    brew link zlib --eeeee
  else
    sudo apt -y install  \
         build-essential \
         curl            \
         libbz2-dev      \
         libffi-dev      \
         liblzma-dev     \
         libncurses5-dev \
         libreadline-dev \
         libsqlite3-dev  \
         libssl-dev      \
         libxml2-dev     \
         libxmlsec1-dev  \
         llvm            \
         make            \
         tk-dev          \
         wget            \
         xz-utils        \
         zlib1g-dev 
    # maybe need to run software-properties-gtk to review software sources
    sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
    sudo apt-get update
    sudo apt -y build-dep \
         python2.7        \
         python3.8
  fi
  asdf plugin-add python 
}
alias install_asdf_plugins_python_='declare -f _install_asdf_plugins_python'
alias install_asdf_plugins_python='_install_asdf_plugins_python'


_install_asdf_plugins_nodejs() {
  if [ "$(uname -s)" = "Darwin" ]
  then
    brew install coreutils gnupg
  else
    sudo apt install -y dirmngr gpg
  fi
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
}
alias install_asdf_plugins_nodejs_='declare -f _install_asdf_plugins_nodejs'
alias install_asdf_plugins_nodejs='_install_asdf_plugins_nodejs'


_install_asdf_plugins_java() {
  if [ "$(uname -s)" = "Darwin" ]
  then
    brew install coreutils jq curl sha256sum
  else
    sudo apt install -y coreutils jq curl
  fi
  asdf plugin-add java https://github.com/halcyon/asdf-java.git
  asdf plugin-add maven
}
alias install_asdf_plugins_java_='declare -f _install_asdf_plugins_java'
alias install_asdf_plugins_java='_install_asdf_plugins_java'


_install_asdf_plugins_php() {
  if [ "$(uname -s)" = "Darwin" ]
  then
    brew install bison libiconv re2c libzip
  else
    sudo apt install -y bison libiconv-hook-dev re2c libzip-dev libcurl4-nss-dev libonig-dev
  fi
  asdf plugin-add php https://github.com/asdf-community/asdf-php.git
}
alias install_asdf_plugins_php_='declare -f _install_asdf_plugins_php'
alias install_asdf_plugins_php='_install_asdf_plugins_php'


_install_asdf_plugins_golang() {
  asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
}
alias install_asdf_plugins_golang_='declare -f _install_asdf_plugins_golang'
alias install_asdf_plugins_golang='_install_asdf_plugins_golang'


_install_asdf_plugins() {
    install_asdf_plugins_python
    install_asdf_plugins_nodejs
    install_asdf_plugins_java
    install_asdf_plugins_golang
    install_asdf_plugins_php
}
alias install_asdf_plugins_='declare -f _install_asdf_plugins'
alias install_asdf_plugins='_install_asdf_plugins'


_install_languages() {
  install_asdf
  install_asdf_plugins

  install_python
  install_nodejs
  install_java
  install_php
  install_golang
  # install_ruby
  # install_erlang
  # install_rlang
}
alias install_languages_='declare -f _install_languages'
alias install_languages='_install_languages'
