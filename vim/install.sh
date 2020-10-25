#!/bin/sh
curl -sLf https://spacevim.org/install.sh | bash

cd $HOME/.SpaceVim/bundle/vimproc.vim && make
