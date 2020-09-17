#!/usr/bin/env bash

[ -d ~/.local/fzf ] && exit 0

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.local/fzf
# shellcheck disable=SC1090
~/.local/fzf/install

exit 0
