#!/usr/bin/env bash
exit 1
sudo apt install -qqy fzf && exit 0

command -v fzf >/dev/null 2>&2 && exit 0

if [ -d ~/.local/fzf ]; then
    git clone -q --depth 1 https://github.com/junegunn/fzf.git ~/.local/fzf
fi

~/.local/fzf/install
