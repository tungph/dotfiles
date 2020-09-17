#!/bin/sh

[ -d ~/.local/fzf ] && rm -rf ~/.local/fzf

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.local/fzf
# shellcheck disable=SC1090
. ~/.local/fzf/install
