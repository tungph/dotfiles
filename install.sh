#!/usr/bin/env sh

. ./utils.sh

install_requirements() {
  #  git, curl, tar, zsh
  command -v git >/dev/null 2>&2 || sudo apt install -y git
  command -v tar >/dev/null 2>&2 || sudo apt install -y tar
  command -v zsh >/dev/null 2>&2 || sudo apt install -y zsh
  command -v curl >/dev/null 2>&2 || sudo apt install -y curl
}

install_carlos_dotfiles() {
  git clone https://github.com/caarlos0/dotfiles.git ~/.dotfiles/carlos
  cd ~/.dotfiles/carlos && ./script/bootstrap
}

add_my_customization() {
  install diff-so-fancy
  install fzy
  install tldr

  # attach personal settings
  ln -s ./localrc ~/.localrc

}
