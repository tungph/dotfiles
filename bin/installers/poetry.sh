#!/usr/bin/env bash

export POETRY_HOME="$HOME/.local/poetry"
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3
mkdir -p "$HOME/.zfunc"
poetry completions zsh >~/.zfunc/_poetry
