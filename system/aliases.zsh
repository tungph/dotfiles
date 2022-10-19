#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
	alias ls="ls -FGt"
else
	alias ls="ls -Ft --color"
fi

alias S="ls -lhta"
alias s="ls -lht | tail -n +2"

alias grep="grep --color=auto"
alias duf="du -sh * | sort -hr"
alias less="less -r"

alias ..="cd .."
alias ...='cd "$(git rev-parse --show-toplevel)"'

# quick hack to make watch work with aliases
alias watch='watch -c -d -t '

