export PATH=""$HOME/.miniconda3/bin:/usr/local/sbin:$PATH"

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

mkc() {
  [ $# -eq 1 ] && mkdir $1 && cd $1
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
alias pi='package_installer'

    # config #
alias dotfiles='cd ~/.dotfiles'
alias ec='vi ~/.dotfiles/config.zshrc && rl'
alias ez="vi ~/.localrc && rl"
alias ev="vi ~/.vimrc ~/.config/nvim/init.vim"
alias eg='vi ~/.gitconfig.local'
alias et='vi ~/.tmux.conf'

    # docker #
alias dc='docker-compose'
alias di='docker images'
alias dif='di | grep -i'
alias dl='docker logs -f'
alias dp='docker ps'
alias dpf='docker ps | grep -i'
alias dpr='docker_prune'
