#!/usr/bin/env sh
BASE_DIR="$HOME/.local/dotfiles/dependencies"
DEP_DIR="$BASE_DIR/dependencies"
INSTALL_DIR="$BASE_DIR/shawn"

install() {
  PACKAGE=$1

  if ! command -v "$PACKAGE" >/dev/null 2>&2; then
    [ "$(uname)" = "Darwin" ] && brew install "$PACKAGE"
    [ "$(uname)" = "Linux" ] && sudo apt install "$PACKAGE"

  else
    echo "$PACKAGE has already installed on your system"
  fi
}

install_z() {
  PACKAGE=z
  if ! command -v "$PACKAGE" >/dev/null 2>&2; then
    git clone https://github.com/rupa/z.git "$DEP_DIR/$PACKAGE"
    . "$DEP_DIR"/z/z.sh
    echo ". $DEP_DIR/z/z.sh" >>"$INSTALL_DIR"/localrc
  else
    echo "$PACKAGE has already installed on your system"
  fi
}

install_diff_so_fancy() {
  PACKAGE=diff-so-fancy
  if ! command -v "$PACKAGE" >/dev/null 2>&2; then
    git clone https://github.com/rupa/z.git "$DEP_DIR/$PACKAGE"
    git config --global core.pager "diff-so-fancy | less --tabs=2 -RFX"
  else
    echo "$PACKAGE has already installed on your system"
  fi
}
