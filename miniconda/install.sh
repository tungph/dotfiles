#!/bin/sh
[ -d "$HOME/miniconda3" ] && return 0
[ -d "$HOME/anaconda" ] && return 0

echo "> [OPTIONAL] Install miniconda3"
INSTALLER=Miniconda3-latest-Linux-x86_64.sh
echo "wget https://repo.anaconda.com/miniconda/$INSTALLER && chmod +x $INSTALLER && ./$INSTALLER"
