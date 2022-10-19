export PIPENV_SKIP_LOCK=true
export POETRY_HOME="$HOME/.local/poetry"
export PATH="/usr/local/sbin:$PATH:$POETRY_HOME/bin:$HOME/.local/bin"

# Enable vim mode
bindkey -v

#### FUNCTIONS ##### print out $PATH
path() {
  echo -e ${PATH//:/\\n}
}

# jump to a directory
u() {
  target=$(z -l | fzy | awk '{$1=""}1' | sed 's/^[ \t]*//')
  # shellcheck disable=SC2164
  cd "$target"
}

# jum to a child-directory
U() {
  [ $# -gt 0 ] && cd $@ || cd "$(find . -type d -d 1 | fzy)" || return
}

uu() {
  [ $# -gt 0 ] && cd $@ || cd "$(find . -type d | fzy)" || return
}

f() {
  ls -1 | fzy
}

ff() {
  find . | fzy
}

alias l='ls -1'
alias us='ls -lt'
alias usa='ls -lta'
alias ut='ls -lt | head'
alias uta='ls -lta | head'

# to long dont read
tl() {
  if [ $# -gt 1 ]; then
    # shellcheck disable=SC2068
    tldr "${@:1:1}" | ag -C 1 ${@:2}
  else
    # shellcheck disable=SC2068
    tldr $@
  fi
}

# better man
man() {
  if [ $# -gt 1 ]; then
    # shellcheck disable=SC2068
    command man "${@:1:1}" | ag -C 1 ${@:2}
  else
    # shellcheck disable=SC2068
    command man $@
  fi
}

# del with fuzzy
del() {
  if ! type "trash" >/dev/null; then
    # shellcheck disable=SC2068
    [ $# -gt 0 ] && rm -rf $@ || rm "$(command ls -1rA | fzy)"
  else
    # shellcheck disable=SC2068
    if [ $# -gt 0 ]; then
      trash $@
    else
      trash "$(command ls -1rA | fzy)"
    fi
  fi
}

# mkdir, then cd into the newly created directory
n() {
  # shellcheck disable=SC2164
  [ $# -eq 1 ] && mkdir -p "$1"
}
N() {
  # shellcheck disable=SC2164
  [ $# -eq 1 ] && mkdir -p "$1" && cd "$1"
}

alias nf='touch'
Nf() {
  # shellcheck disable=SC2164
  [ $# -eq 1 ] && touch "$1" && nvim "$1"
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

# Send a message to a slack webhook
slackme() {
  RESULT=$?

  if [ -z ${WEBHOOK_URL+x} ]; then
    echo "WEBHOOK_URL doesn't set."
    echo "Get it here: https://api.slack.com/apps/A015FK5133K/incoming-webhooks"
    echo "export WEBHOOK_URL="
    return 1
  fi

  if [ $RESULT -eq 0 ]; then
    MESSAGE=":heavy_check_mark: The task on \`$(hostname)\` has finished \`SUCESSFULLY\`"
  else
    MESSAGE=":exclamation: The task on \`$(hostname)\` has finished with \`ERROR($RESULT)\`"
  fi

  # shellcheck disable=SC2124
  [ $# -gt 0 ] && MESSAGE="$@"

  curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$MESSAGE\"}" "$WEBHOOK_URL"
}

# Copy content of a file
copy() {
  IT2COPY="$HOME/.iterm2/it2copy"
  IT2CHECK="$HOME/.iterm2/it2check"

  # shellcheck disable=SC2015
  "$IT2CHECK" && "$IT2COPY" "$@" || cat "$@" | xclip

}

# Create a new conda env
conda_env_create() {
  if [ $# -eq 2 ]; then
    NAME="$1"
    VERSION="$2"

    conda create --name "$NAME" python="$VERSION"
  elif [ $# -eq 1 ]; then
    conda create --name "$1"
  else
    echo "USAGE: $(basename "$0") <environment name> [python version]"
  fi
}

# ram <process-name> - Find how much RAM a process is taking.
ram() {
  local sum
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in $(ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'); do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}

# Kill process
fkil() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]; then
    echo $pid | xargs -r -t kill -${1:-9}
  fi
}

#### ALIASES #####

# apps #
alias eva='eval $(ssh-agent -s) && ssh-add ~/.ssh/id_rsa'
alias dot="~/.dotfiles/dot"
alias vi='nvim'
alias v='batcat -p'
alias V='v $(fzf)'
alias rp='realpath .'
alias fl='flutter'
alias q='exit'

# utils #
alias h='history'
alias gr='ag --no-numbers --ignore-case'
alias rl='dot pull && . ~/.zshrc'
alias pi='pip3 install'
alias pin='pip3 install --no-dependencies'
alias df='df -h .'
alias op='sudo netstat -tulpn | grep LISTEN'
alias ccat='imgcat'
alias myip='curl ifconfig.me'
alias jb='cd -'
alias count='ls -1 | wc -l'
alias inst='sudo apt install -y'
alias top='btm'
alias m='less'

# config #
alias dotfiles='cd ~/.dotfiles'
alias o='vi'
alias O='vi $(fzf)'
alias ec='vi ~/.dotfiles/config.zshrc'
alias ez='vi ~/.zshrc'
alias el="vi ~/.localrc"
alias ev="vi ~/.SpaceVim.d/init.toml"
alias evv='vi ~/.SpaceVim.d/autoload/myspacevim.vim'
alias eg='vi ~/.gitconfig.local'
alias et='vi ~/.tmux.conf'

# docker #
alias dc='docker-compose'
alias dcd='dc down'
alias dcl='dc logs'
alias dclf='dcl -f'
alias dcb='dc build'
alias dcu='dc up -d --remove-orphans'
alias dcul='dc up -d --remove-orphans && dc logs'
alias dculf='dc up -d --remove-orphans && dc logs -f'
alias dcub='dcu --build'
alias dcubl='dcub && dc logs --tail 33 -f'
alias dpr='docker_prune'
alias dsp='docker system prune -y'
alias dl='docker logs'
alias dlf='docker logs -f'
alias drsc='docker rm $(docker ps --filter status=exited -q)'
alias au='./aurora'

# pipenv + conda #
alias p='poetry'
alias cecre=conda_env_create
alias ceact='conda activate "$(conda env list -q | cut -d " " -f 1 | fzy)"'
alias cedea='conda deactivate'
alias cedel='conda remove --name "$(conda env list -q | cut -d " " -f 1 | fzy)" --all && conda clean --all'
alias ceinst='conda install -c conda-forge -y'
