command -v docker >/dev/null 2>&2 && echo "docker command has already exist" && exit 0

sudo apt-get remove -qqy docker docker-engine docker.io containerd runc

sudo apt-get update -qq

sudo apt-get install -qqy \
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

sudo apt-get update -qq

sudo apt-get install -qqy docker-ce docker-ce-cli containerd.io

sudo groupadd docker

# shellcheck disable=SC2086
sudo usermod -aG docker $USER
