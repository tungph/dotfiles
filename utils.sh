#!/usr/bin/env sh

LOCAL_DIR="$HOME/.local"
BASE_DIR="$LOCAL_DIR/dotfiles"

[ "$(uname)" = "Linux" ] && sudo apt update

install() {
  PACKAGE=$1
  COMMAND=$PACKAGE
  [ "$PACKAGE" = "trash-cli" ] && COMMAND="trash"

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
  if command -v nvim >/dev/null 2>&2; then
    echo ">>> Installing neovim plug..."
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  else
    echo ">>> Installing vim plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "DONE curl -fLo ~/.vim/autoload/plug.vim..."
    realpath ~/.vim/autoload/plug.vim
  fi
  echo ""
}
