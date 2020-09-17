#!/bin/sh
mkdir -p "$HOME/.local"

if ! command -v "diff-so-fancy" >/dev/null 2>&2; then
  [ -d "$HOME/.local/diff-so-fancy" ] || git clone -qhttps://github.com/so-fancy/diff-so-fancy.git "$HOME/.local/diff-so-fancy"
  git config --global core.pager "diff-so-fancy | less --tabs=2 -RFX"
fi
