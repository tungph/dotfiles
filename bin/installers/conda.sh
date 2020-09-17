#!/usr/bin/env bash

[ -d "$HOME/miniconda3" ] && return 0
[ -d "$HOME/anaconda" ] && return 0

INSTALLER=Miniconda3-latest-Linux-x86_64.sh
wget "https://repo.anaconda.com/miniconda/$INSTALLER"
chmod +x "$INSTALLER"
. "./$INSTALLER"
rm -f "$INSTALLER"
