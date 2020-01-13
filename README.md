# Macbook install procedure

## Update to Catalina
Open Apple store and update

## Update XCode
```bash
sudo rm -rf /Library/Developer/CommandLineTools
xcode-select --install
```

## Install Homebrew
https://brew.sh/
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Install Google Chrome
https://www.google.com/chrome/
```bash
brew cask install google-chrome
```

## Install Firefox
```bash
brew cask install firefox
```

## Install VSCode
```bash
code | brew cask install visual-studio-code
```

## Install harvest
```bash
brew cask install harvest
```

## Install iTerm2
https://iterm2.com/downloads.html
```bash
iterm | brew cask install iterm2 
```

In iTerm2:
* Profiles -> Open Profiles...
* Edit Profiles...
* Keys tab
* From Load Preset... drop-down, pick Terminal.app compatibility

## Install Slack
https://slack.com/downloads/mac
```bash
brew cask install slack
```

## Install Line
https://apps.apple.com/br/app/line/id539883307?l=en&mt=12

## Install Wechat
```bash
brew cask install wechat
```

## Install extra utilities
```bash
brew install p7zip htop zsh ranger
```

## Enable USB Tethering
https://github.com/jwise/HoRNDIS/issues/102
```bash
brew cask install horndis
```

### Install encfs
```bash
brew cask install osxfuse
brew install encfs
```

## Install NTFS-3G
https://github.com/osxfuse/osxfuse/wiki/NTFS-3G
```bash
brew install ntfs-3g
```

* Reboot macOS to Recovery Mode (Turn on your Mac and immediately press and hold Command (⌘)-R.)
* Open Terminal in Recovery Mode from Menu bar -> Utilities -> Terminal

```bash
csrutil disable
diskutil list
```

* Find the label `Macintosh HD` (my case `disk2s5`)

```bash
diskutil apfs unlockVolume disk2s5
cd "/Volumes/Macintosh HD/sbin"
mv mount_ntfs mount_ntfs.orig
ln -s "/Volumes/Macintosh HD/usr/local/sbin/mount_ntfs" mount_ntfs
csrutil enable
```

* Reboot to normal mac

## Configure dotfiles
https://github.com/rodfersou/dotfiles
```bash
git clone https://github.com/rodfersou/dotfiles.git .dotfiles
```

### Update git reference
```bash
(cd .dotfiles/.git && vi config)
```
```ini
[remote "origin"]
    url = git@github.com:rodfersou/dotfiles.git
    fetch = +refs/heads/*:refs/remotes/origin/*
```

### Install Kdiff3
```bash
brew cask install https://raw.githubusercontent.com/Homebrew/homebrew-cask/6a96e5ea44803e52a43c0c89242390f75d1581ab/Casks/kdiff3.rb
```

### Install RCM
https://github.com/thoughtbot/rcm
```bash
brew tap thoughtbot/formulae
brew install rcm
```

### Configure dotfiles
```bash
(cd .dotfiles && make)
(cd .dotfiles && make install)
(cd .ssh/ids && chmod 600 *)
```

### Install Oh My Zsh
https://github.com/ohmyzsh/ohmyzsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install terminal utilities
```bash
brew install screen tmux the_silver_searcher
```

## Install VIM
```bash
brew install vim
curl -sS https://raw.githubusercontent.com/mkropat/vim-dwiw2015/master/bootstrap.sh | sh
```

### Open vim and run
```
:PluginInstall
```

### Install fonts in ~/.fonts

## Install Karabiner
```bash
brew cask install karabiner-elements
```

## Development environment
### Some dependencies
```bash
brew install readline openssl xz zlib expat
```

### Install asdf
https://github.com/asdf-vm/asdf
```bash
brew install asdf --HEAD
brew install \
  coreutils automake autoconf openssl \
  libyaml readline libxslt libtool unixodbc \
  unzip curl
```

### Install Python
https://github.com/danhper/asdf-python
```bash
brew install autoconf openssl@1.1 pkg-config readline sqlite3 xz zlib
asdf plugin-add python
asdf install python 2.7.17
asdf install python 3.7.5
asdf global python 3.7.5 2.7.17
```

### Install Node.js
https://github.com/asdf-vm/asdf-nodejs
```bash
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
brew install gnupg
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 10.14.2
asdf global nodejs 10.14.2
```

## Configure Development Environment
Create needed folders
```bash
mkdir -p Projects/cache/downloads
mkdir Projects/cache/eggs
mkdir Projects/cache/extens
```

Error `fatal error: 'X11/Xlib.h' file not found`
```bash
brew cask install xquartz
ln -s /opt/X11/include/X11 /usr/local/include/X11
```

Error `ImportError: failed to find libmagic.  Check your installation`
```bash
brew install libmagic
```

### Setup Pillow
```
--- TKINTER support available
*** JPEG support not available
*** ZLIB (PNG/ZIP) support not available
*** LIBTIFF support not available
--- FREETYPE2 support available
*** LITTLECMS2 support not available
*** WEBP support not available
*** WEBPMUX support not available
```

```bash
brew install libpng libtiff freetype little-cms2 webp jpeg
```

### Speed up terminal
```bash
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1
```
