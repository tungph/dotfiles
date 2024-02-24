#!/bin/sh

sudo apt install -qqy bat

# if 'bat' is not found, then create a symlink to 'batcat'
if [ ! -f /usr/bin/bat ]; then
    sudo ln -s /usr/bin/batcat /usr/bin/bat
fi
