export PIPENV_SKIP_LOCK=true
export POETRY_HOME="$HOME/.local/poetry"
export PATH="/usr/local/sbin:$PATH:$POETRY_HOME/bin"

#### FUNCTIONS #####
function j() {
    target="$(z -l | fzy | awk -F ' ' '{print $NF}')"
    cd "$target" || exit
}

# jump to a child-directory
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

mkd() {
    # shellcheck disable=SC2164
    [ $# -eq 1 ] && mkdir "$1" && cd "$1"
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
alias df='df -h .'

# config #
alias dotfiles='cd ~/.dotfiles'
alias ec='vi ~/.dotfiles/config.zshrc && rl'
alias ez='vi ~/.zshrc && rl'
alias el="vi ~/.localrc && rl"
alias ev="vi ~/.vimrc ~/.config/nvim/init.vim"
alias eg='vi ~/.gitconfig.local'
alias et='vi ~/.tmux.conf'

# docker #
alias dc='docker-compose'
alias di='docker images'
alias dif='di | grep -i'
alias dl='docker logs'
alias dp='docker ps'
alias dpf='dp | grep -i'
alias dpr='docker_prune'
alias au='./aurora'

# pipenv + conda #
alias p='pipenv'
alias activate='conda activate `conda env list -q | cut -d " " -f 1 | fzy`'
