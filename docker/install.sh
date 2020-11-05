#!/bin/sh
mkdir -p "$HOME/.docker/completions"

curl -sL https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose \
    -o "$HOME/.docker/completions/_docker-compose"
curl -sL https://raw.githubusercontent.com/docker/machine/master/contrib/completion/zsh/_docker-machine \
    -o "$HOME/.docker/completions/_docker-machine"
curl -sL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker \
    -o "$HOME/.docker/completions/_docker"

sudo usermod -aG docker $USER

