#!/usr/bin/env sh

install_requirements() {
  install git
  install tar
  install zsh
  install curl

  install unzip
  install nvim
  install ag
  install fzy
  install tldr
  install_diff_so_fancy
}

install_carlos_dotfiles() {
  ~/.dotfiles/script/bootstrap
}

add_my_customization() {
  install_vim_plug

}

# ENTRY POINT
BASE_DIR="$(dirname "$0")"
# shellcheck disable=SC1090,SC2039
source "$BASE_DIR/utils.sh"

install_requirements
install_carlos_dotfiles
add_my_customization
