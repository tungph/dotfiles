#!/bin/sh
export PATH="$PATH:$DOTFILES/bin"

[ -d "$HOME/.local/bin" ] && PATH="$PATH:$HOME/.local/bin"
[ -d "/Users/shawn/Library/Python/3.8/bin" ] && PATH="$PATH:/Users/shawn/Library/Python/3.8/bin"
