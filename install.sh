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
  install fzy
  install tldr

  # diff-so-fancy
  if ! command -v diff-so-fancy >/dev/null 2>&2; then
    git clone https://github.com/so-fancy/diff-so-fancy.git ~/.dotfiles/others/diff-so-fancy
    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
  fi

  # attach personal settings
  [ -f ~/.localrc ] && mv -f ~/.localrc ~/.localrc.backup
  ln -s ./localrc ~/.localrc

}

# ENTRY POINT
install_requirements
install_carlos_dotfiles
add_my_customization
