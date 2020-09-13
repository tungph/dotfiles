export PATH="/usr/local/sbin:$PATH"

#### FUNCTIONS #####
function j() {
	target="$(z -l | fzy | awk -F ' ' '{print $NF}')"
	cd "$target" || exit
}

# jump to a sub-directory
function jj() {
	target="$(z -c | fzy | awk -F ' ' '{print $NF}')"
	cd "$target" || exit
}

function tl() {
	if [ $# -gt 1 ]; then
		# shellcheck disable=SC2068
		tldr "${@:1:1}" | ag -C 1 ${@:2}
	else
		# shellcheck disable=SC2068
		tldr $@ | less
	fi
}

#### ALIASES #####

    # apps #
alias diff="diff-so-fancy"
alias vi='nvim'
alias rp='realpath'
alias fl='flutter'

    # utils #
alias f="ls -ltra | grep -i"
alias ff='ag -g'
alias del='rm -rf'

    # config #
alias vl="vi ~/.localrc && rl"
alias vv="vi ~/.vimrc ~/.config/nvim/init.vim"
alias vz='vi ~/.dotfiles/config.zshrc && rl'

    # docker #
alias dc='docker-compose'
alias di='docker images'
alias dif='di | grep -i'
alias dl='docker logs -f'
alias dp='docker ps'
