## Shawn's dotfiles
<div align="center">
<h4>To setup and sync settings across devices</h4>
</div>

Meaning of the files:
 - `dot` the main script, run `dot --help` for detail.
 - `config.zshrc` holds the common settings. Local settings must be placed in *~/.localrc*.
 - `bundels.txt` holds the commands to be installed when run `dot init`.

For heavy configuration app like vim, antibody... create a folder with this structure:
```text
module
├── aliases.zsh
├── config_dir_sample.symlink
├── config_file_sample.symlink
├── install.sh
└── path.zsh
```
- `*.symlink` will create a symbolic link to the targeted file/folder.
- `install.sh` will be run when **init** and **update**.
- `*.zsh` all the .zsh file will be sourced in the `.zshrc`
  - `aliases.zsh` holds the aliases for the app.
  - `path.zsh` holds command to append system path variable.
  - ...


### Installation
- Fork this repo to be able to customize and sync your settings.
- Beware of hardcode:
  1. installation path must be `~/.dotfiles`.
  1. some installation that can not be installed with the package manager, will be placed under `~/.locals`.
  1. git username and email will be set to mine, if not preconfigured.

Install with this command, but replace the repo with yours.
```shell script
git config --global core.autocrlf input
git clone -q https://github.com/tungph/dotfiles.git ~/.dotfiles && ~/.dotfiles/dot init
```

```shell
# With new user create
sudo adduser shawn
sudo usermod -aG sudo shawn
sudo echo "shawn ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
sudo su - shawn
git clone -q https://github.com/tungph/dotfiles.git ~/.dotfiles && ~/.dotfiles/dot init
```
### Acknowledgement
The philosophy and a lot of settings were copied from [Carlos' dotfiles](https://github.com/caarlos0/dotfiles).
