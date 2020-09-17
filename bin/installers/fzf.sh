#!/usr/bin/env bash

sudo apt install -qqy fzf

if ! command -v fzf >/dev/null 2>&2; then
    if ! [ -d ~/.local/fzf ]; then
        git clone -q --depth 1 https://github.com/junegunn/fzf.git "$HOME/.local/fzf"
    fi
    ~/.local/fzf/install
fi
