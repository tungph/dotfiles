#!/usr/bin/env sh

. ./utils.sh

install_requirements() {
  install git
  install tar
  install zsh
  install curl

  install unzip

  install fzy
  install tldr
  install trash-cli
  install_diff_so_fancy
}

install_carlos_dotfiles() {
  git clone https://github.com/caarlos0/dotfiles.git ~/.dotfiles
  cd ~/.dotfiles && ./script/bootstrap
}

add_my_customization() {
  # attach personal settings
  rm -f ~/.localrc
  ln "$BASE_DIR"/localrc ~/.localrc

}

# ENTRY POINT
install_requirements
install_carlos_dotfiles
add_my_customization
