command -v dvc >/dev/null 2>&2 && echo "dvc command has already exist" && exit 0

sudo wget \
    https://dvc.org/deb/dvc.list \
    -O /etc/apt/sources.list.d/dvc.list
sudo apt update
sudo apt install dvc
