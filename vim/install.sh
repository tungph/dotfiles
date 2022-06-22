#!/bin/sh
curl -sLf https://spacevim.org/install.sh | bash

cd $HOME/.SpaceVim && git checkout v1.9.0
cd $HOME/.SpaceVim/bundle/vimproc.vim && make

