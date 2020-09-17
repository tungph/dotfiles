#!/usr/bin/env bash

if [ -d ~/.local/fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.local/fzf
    ~/.local/fzf/install
fi
