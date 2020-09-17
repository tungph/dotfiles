#!/bin/sh
if ! command -v docker >/dev/null 2>&2; then
	echo " - install docker and docker-compose"
	
	sudo apt-get remove docker docker-engine docker.io containerd runc

	sudo apt-get update

	sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

	sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

	sudo apt-get update

	sudo apt-get install docker-ce docker-ce-cli containerd.io

	sudo groupadd docker

	sudo usermod -aG docker $USER

fi

echo " - add zsh auto completions"
mkdir -p "$HOME/.docker/completions"

if command -v docker-compose >/dev/null 2>&1; then
	curl -sL https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose \
		-o "$HOME/.docker/completions/_docker-compose"
fi
if command -v docker-machine >/dev/null 2>&1; then
	curl -sL https://raw.githubusercontent.com/docker/machine/master/contrib/completion/zsh/_docker-machine \
		-o "$HOME/.docker/completions/_docker-machine"
fi
if command -v docker >/dev/null 2>&1; then
	curl -sL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker \
		-o "$HOME/.docker/completions/_docker"
fi
