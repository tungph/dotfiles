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
  git clone https://github.com/caarlos0/dotfiles.git ~/.dotfiles
  cd ~/.dotfiles && ./script/bootstrap
}

add_my_customization() {
  install fzy
  install tldr

  # diff-so-fancy
  if ! command -v diff-so-fancy >/dev/null 2>&2; then
    git clone https://github.com/so-fancy/diff-so-fancy.git ~/.local/dotfiles/dependencies/diff-so-fancy
    git config --global core.pager "diff-so-fancy | less --tabs=2 -RFX"
  fi

  # attach personal settings
  rm -f ~/.localrc
  ln ~/.local/dotfiles/localrc ~/.localrc

}

# ENTRY POINT
install_requirements
install_carlos_dotfiles
add_my_customization
