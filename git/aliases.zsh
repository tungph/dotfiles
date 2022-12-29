#!/bin/sh

alias gl="git log --graph --decorate --oneline --abbrev-commit"
alias glnext='git log --oneline $(git describe --tags --abbrev=0 @^)..@'

alias gs='git status -sb'
alias gd='git diff'

alias gcam='git commit -s -a -m'
