#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
	alias ls="ls -FGt"
else
	alias ls="ls -Ft --color"
fi
alias l="ls -1"
alias la="ls -A"
alias ll="ls -lh"
alias lla="ls -lAh"

alias grep="grep --color=auto"
alias duf="du -sh * | sort -hr"
alias less="less -r"

alias ..="cd .."
alias ..r='cd "$(git rev-parse --show-toplevel)"'

# quick hack to make watch work with aliases
alias watch='watch -c -d -t '

