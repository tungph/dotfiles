## Shawn's dotfiles
To setup and sync settings across devices.
 - `dot` the main script, run `dot --help` for detail
 - `config.zshrc` holds the common config. Local settings must be placed in *~/.localrc*
 - `requirements.txt` holds the commands to be install when run `dot init`

For heavy configuration app like vim, antibody..., create a folder with this kind of structure:
```text
git
├── aliases.zsh
├── gitconfig.local.symlink
├── gitignore.symlink
└── install.sh
```
- `aliases.zsh` holds the aliases for the app
- `*.symlink` will create a symbolic link to the targeted folder
- `install.sh` will be run when **init** or **update**
- `path.zsh` hold command to append system path variable


### Installation
```shell script
git clone https://github.com/tungph/dotfiles.git ~/.dotfiles && ~/.dotfiles/dot init
```
### Acknowledgement
The philosophy and a lot of settings were copied from [Carlos' dotfiles](https://github.com/caarlos0/dotfiles)
