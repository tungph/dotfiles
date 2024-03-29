#!/usr/bin/env bash

if ! [ -d "$HOME/.local/miniconda" ]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
    bash ~/miniconda.sh -b -p "$HOME/.local/miniconda"
    rm -f ~/miniconda.sh
    conda config --add channels conda-forge
fi
