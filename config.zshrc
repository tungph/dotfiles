export PIPENV_SKIP_LOCK=true
export POETRY_HOME="$HOME/.local/poetry"
export PATH="/usr/local/sbin:$PATH:$POETRY_HOME/bin:$HOME/.local/bin"

#### FUNCTIONS #####
j() {
    target="$(z -l | fzy | awk -F ' ' '{print $NF}')"
    cd "$target" || exit
}

# jump to a child-directory
jj() {
    target="$(z -c | fzy | awk -F ' ' '{print $NF}')"
    cd "$target" || exit
}

# to long dont read
tl() {
    if [ $# -gt 1 ]; then
        # shellcheck disable=SC2068
        tldr "${@:1:1}" | ag -C 1 ${@:2}
    else
        # shellcheck disable=SC2068
        tldr $@ | less
    fi
}

# mkdir, then cd into the newly created directory
mkd() {
    # shellcheck disable=SC2164
    [ $# -eq 1 ] && mkdir "$1" && cd "$1"
}

# docker ps, perform search for any provided argument
dp() {
    if [ $# -eq 0 ]; then
        docker ps
    else
        docker ps | grep -i "$@"
    fi
}

# docker images, perform search for any provided argument
di() {
    if [ $# -eq 0 ]; then
        docker images
    else
        docker images | grep -i "$@"
    fi
}

#### ALIASES #####

# apps #
alias diff="diff-so-fancy"
alias vi='nvim'
alias e='vi -p'
alias v='bat'
alias rp='realpath .'
alias fl='flutter'

# utils #
alias h='history'
alias f="ls -ltra | grep -i"
alias ff='ag -g'
alias del='rm -rf'
alias pi='package_installer'
alias df='df -h .'
alias op='sudo netstat -tulpn | grep LISTEN'

# config #
alias dotfiles='cd ~/.dotfiles'
alias ec='vi ~/.dotfiles/config.zshrc && rl'
alias ez='vi ~/.zshrc && rl'
alias el="vi ~/.localrc && rl"
alias ev="vi ~/.SpaceVim.d/init.toml"
alias eg='vi ~/.gitconfig.local'
alias et='vi ~/.tmux.conf'

# docker #
alias dc='docker-compose'
alias dl='docker logs'
alias dr='dc up -d --build --remove-orphans && dc logs --tail 33 -f'
alias dk='dc up -d --remove-orphans'
alias dpr='docker_prune'
alias au='./aurora'

# pipenv + conda #
alias p='poetry'
alias activate='conda activate `conda env list -q | cut -d " " -f 1 | fzy`'
