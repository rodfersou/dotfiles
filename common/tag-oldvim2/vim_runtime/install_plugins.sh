#!/bin/bash
cd my_plugins
git clone --depth=1 https://github.com/ervandew/supertab.git
git clone --depth=1 https://github.com/ryanoasis/vim-devicons.git
git clone --depth=1 https://github.com/junegunn/vim-easy-align.git
# git clone --depth=1 https://github.com/neoclide/coc.nvim.git
git clone --depth=1 https://github.com/aklt/plantuml-syntax.git
git clone --depth=1 --branch next https://github.com/autozimu/LanguageClient-neovim.git
git clone --depth=1 https://github.com/LnL7/vim-nix.git
cd ..
