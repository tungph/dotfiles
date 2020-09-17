#!/usr/bin/env bash

# [ -d ~/.local/fzf ] && return 0

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.local/fzf
# shellcheck disable=SC1090
. ~/.local/fzf/install

return 0
