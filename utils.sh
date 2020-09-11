#!/usr/bin/env sh

install() {
  PACKAGE=$1

  if ! command -v "$PACKAGE" >/dev/null 2>&2; then
    [ "$(uname)" = "Darwin" ] && brew install "$PACKAGE"
    [ "$(uname)" = "Linux" ] && sudo apt install "$PACKAGE"

  else
    echo "$PACKAGE has already installed on your system"
  fi
}
