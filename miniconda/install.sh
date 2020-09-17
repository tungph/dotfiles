#!/bin/sh

if ! [ -d "$HOME/miniconda3" ]; then
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh 
  chmod +x Miniconda3-latest-Linux-x86_64.sh 
  ./Miniconda3-latest-Linux-x86_64.sh
  rm -r Miniconda3-latest-Linux-x86_64.sh 
fi
