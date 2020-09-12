#!/usr/bin/env sh

install_requirements() {
	install git
	install tar
	install zsh
	install curl

	install unzip
	install neovim

	install fzy
	install tldr
	install trash-cli
	install_diff_so_fancy
}

install_carlos_dotfiles() {
	mv -fv ~/.dotfiles ~/.dotfiles.backup
	git clone https://github.com/caarlos0/dotfiles.git ~/.dotfiles
	cd ~/.dotfiles && ./script/bootstrap
}

add_my_customization() {
	install_vim_plug

	# attach personal settings
	rm -f ~/.localrc
	ln "$BASE_DIR"/localrc ~/.localrc

}

# ENTRY POINT
. ./utils.sh
rm -f ~/.localrc

install_requirements
install_carlos_dotfiles
add_my_customization
