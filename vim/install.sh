#!/bin/sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim/
ln -sf "$DOTFILES/vim/vimrc.symlink" ~/.config/nvim/init.vim
nvim +'PlugInstall --sync' +qa
nvim +'PlugUpdate' +qa
