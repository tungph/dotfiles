#!/usr/bin/env sh
LOCAL_DIR="$HOME/.local"
BASE_DIR="$LOCAL_DIR/dotfiles"

[ "$(uname)" = "Linux" ] && sudo apt update

install() {
  PACKAGE=$1

  if ! command -v "$PACKAGE" >/dev/null 2>&2; then
    [ "$(uname)" = "Darwin" ] && brew install "$PACKAGE"
    [ "$(uname)" = "Linux" ] && sudo apt install -y "$PACKAGE"

  else
    echo "$PACKAGE has already installed on your system"
  fi
}

install_diff_so_fancy() {
  PACKAGE=diff-so-fancy
  if ! command -v "$PACKAGE" >/dev/null 2>&2; then
    [ -d "$LOCAL_DIR/$PACKAGE" ] || git clone https://github.com/so-fancy/diff-so-fancy.git "$LOCAL_DIR/$PACKAGE"
    git config --global core.pager "diff-so-fancy | less --tabs=2 -RFX"
  else
    echo "$PACKAGE has already installed on your system"
  fi
}
