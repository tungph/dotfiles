#!/usr/bin/env bash

LOCAL_DIR="$HOME/.local"

[ "$(uname)" = "Linux" ] && sudo apt update

install() {
  COMMAND=$1
  PACKAGE=$COMMAND
  [ "$COMMAND" = "trash" ] && PACKAGE="trash-cli"
  [ "$COMMAND" = "nvim" ] && PACKAGE="neovim"
  [ "$COMMAND" = "ag" ] && PACKAGE="silversearcher-ag"

  echo ">>> Installing $PACKAGE..."

  if ! command -v "$COMMAND" >/dev/null 2>&2; then
    [ "$(uname)" = "Darwin" ] && brew install "$PACKAGE"
    [ "$(uname)" = "Linux" ] && sudo apt install -y "$PACKAGE"
  else
    echo "$PACKAGE has already installed on your system"
  fi
  echo ""
}

install_diff_so_fancy() {
  PACKAGE=diff-so-fancy
  echo ">>> Installing $PACKAGE..."
  if ! command -v "$PACKAGE" >/dev/null 2>&2; then
    [ -d "$LOCAL_DIR/$PACKAGE" ] || git clone https://github.com/so-fancy/diff-so-fancy.git "$LOCAL_DIR/$PACKAGE"
    git config --global core.pager "diff-so-fancy | less --tabs=2 -RFX"
  else
    echo "$PACKAGE has already installed on your system"
  fi
  echo ""
}

install_vim_plug() {
  echo ">>> Installing vim plug..."

  if command -v nvim >/dev/null 2>&2; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  else
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
  echo ""
}
