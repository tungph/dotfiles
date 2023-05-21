#!/bin/sh
curl -sLf https://spacevim.org/install.sh | bash

cd $HOME/.SpaceVim && git checkout v2.1.0
cd $HOME/.SpaceVim/bundle/vimproc.vim && make
