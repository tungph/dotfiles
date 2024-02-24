#!/usr/bin/env bash

sudo apt install -qqy neovim
sudo apt install -qqy python3-neovim

# Install SpaceVim
curl -sLf https://spacevim.org/install.sh | bash

cd $HOME/.SpaceVim && git checkout v2.1.0
cd $HOME/.SpaceVim/bundle/vimproc.vim && make
