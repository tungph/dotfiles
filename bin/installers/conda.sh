#!/usr/bin/env bash

[ -d "$HOME/miniconda3" ] && return 0
[ -d "$HOME/anaconda" ] && return 0

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p "$HOME/miniconda3"
rm -f "$HOME/miniconda.sh"
