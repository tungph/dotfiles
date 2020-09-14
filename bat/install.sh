#!/bin/sh

if [ "$(uname)" = "Linux" ]; then
  sudo apt install bat
  
  if ! command -v "bat" >/dev/null 2>&2; then
    wget https://github.com/sharkdp/bat/releases/download/v0.15.4/bat_0.15.4_amd64.deb
    chmod +x bat_0.15.4_amd64.deb 
    sudo dpkg -i bat_0.15.4_amd64.deb
    rm bat_0.15.4_amd64.deb
  fi
fi
