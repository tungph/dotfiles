#!/bin/sh
[ -d "$HOME/miniconda3" ] && return 0
[ -d "$HOME/anaconda" ] && return 0

echo "> [OPTIONAL] To install miniconda3, run this:"
INSTALLER=Miniconda3-latest-Linux-x86_64.sh
echo "wget https://repo.anaconda.com/miniconda/$INSTALLER && chmod +x $INSTALLER && ./$INSTALLER && rnm -f $INSTALLER"
echo ""
