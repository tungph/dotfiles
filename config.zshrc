export PIPENV_SKIP_LOCK=true
export POETRY_HOME="$HOME/.local/poetry"
export PATH="/usr/local/sbin:$PATH:$POETRY_HOME/bin:$HOME/.local/bin"

#### FUNCTIONS #####
j() {
  target="$(z -l | fzy | awk -F ' ' '{print $NF}')"
  # shellcheck disable=SC2164
  cd "$target"
}

# jum to a child-directory
jj() {
  cd "$(z -c | fzy | awk -F ' ' '{print $NF}')"
  ls
}

# jump to a direct child-directory
jd() {
  # shellcheck disable=SC2164
  [ $# -gt 0 ] && cd "$(command ls -1F | grep / | grep -i $@ | head -1)" || cd "$(command ls -1F | grep / | fzy)"
  ls
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

  curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$MESSAGE\"}" $WEBHOOK_URL
}

# Extend the iterm 2 download utility it2dl
download() {
  if ! type it2dl >/dev/null; then
    echo "it2dl does not found. Installing with $(pi it2)"
  fi

  IT2DL="$HOME/.iterm2/it2dl"
  if [ $# -eq 1 ] && [ -d "$1" ]; then
    ZIP_FILE="/tmp/$1.zip"
    zip -r "$ZIP_FILE" "$1"
    "$IT2DL" "$ZIP_FILE"
    rm "$ZIP_FILE"
  else
    "$IT2DL" "$@"
  fi
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

    conda create --name "$NAME" python=$VERSION
  elif [ $# -eq 1 ]; then
    conda create --name "$1"
  else
    echo "USAGE: $(basename $0) <environment name> [python version]"
  fi
}

#### ALIASES #####

# apps #
alias dot="~/.dotfiles/dot"
alias vi='nvim'
alias e='vi -p'
alias v='bat'
alias rp='realpath .'
alias fl='flutter'

# utils #
alias h='history'
alias f="ls -1tra | grep -i"
alias ff='ag -g'
alias del='rm -rf'
alias rl='dot pull && . ~/.zshrc'
alias pi='package_installer'
alias df='df -h .'
alias op='sudo netstat -tulpn | grep LISTEN'
alias ccat='imgcat'
alias upload='it2ul'
alias myip='curl ifconfig.me'
alias jb='cd -'

# config #
alias dotfiles='cd ~/.dotfiles'
alias ec='vi ~/.dotfiles/config.zshrc'
alias ez='vi ~/.zshrc'
alias el="vi ~/.localrc"
alias ev="vi ~/.SpaceVim.d/init.toml"
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
alias au='./aurora'

# pipenv + conda #
alias p='poetry'
alias cecre=conda_env_create
alias ceact='conda activate "$(conda env list -q | cut -d " " -f 1 | fzy)"'
alias cedea='conda deactivate'
alias cedel='conda remove --name "$(conda env list -q | cut -d " " -f 1 | fzy)" --all && conda clean --all'
