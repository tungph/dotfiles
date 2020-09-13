export PATH="/usr/local/sbin:$HOME/.local/dotfiles/dependencies/diff-so-fancy:$PATH"

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
alias dot="~/.dotfiles/dot"
alias rl="exec zsh"

    # apps #
alias diff="diff-so-fancy"
alias vi='nvim'
alias of='open'
alias rp='realpath'
alias xc='exercism'
alias fl='flutter'
alias tm="tmux a -t local || tmux new -s local"

    # utils #
alias f="ls -ltra | grep -i"
alias ff='ag -g'
alias del='rm -rf'

    # edit config #
alias zz="vi ~/.localrc && rl"
alias vv="vi ~/.vimrc ~/.config/nvim/init.vim"

    # docker #
alias dc='docker-compose'
alias di='docker images'
alias dif='di | grep -i'
alias dl='docker logs -f'
alias dp='docker ps'
