#!/bin/sh

if ! [ -d "$HOME/miniconda3" ]; then
  echo "saving Miniconda.sh to $HOME"
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh $HOME/ 
  chmod +x $HOME/Miniconda3-latest-Linux-x86_64.sh 
fi
