#!/usr/bin/env sh

source ./utils.sh

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

  #  diff-so-fancy
  if not command -v diff-so-fancy >/dev/null 2>&2; then
    git clone git@github.com:so-fancy/diff-so-fancy.git ~/.dotfiles/others/diff-so-fancy
    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
  fi

  # fzf
  if not command -v fzy >/dev/null 2>&2; then
    [ "$(uname)" = "Darwin" ] && brew install fzy
    [ "$(uname)" = "Linux" ] && sudo apt install fzy
  fi

  # attach personal settings
  ln -s ./localrc ~/.localrc

}
