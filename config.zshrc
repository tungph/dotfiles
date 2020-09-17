export PATH="/usr/local/sbin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

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
