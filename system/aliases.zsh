#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
	alias ls="ls -FGt"
else
	alias ls="ls -Ft --color"
fi
alias ll="ls -lAhl"
alias la="ls -A"
alias l="ls"

alias grep="grep --color=auto"
alias duf="du -sh * | sort -hr"
alias less="less -r"

alias cdr='cd "$(git rev-parse --show-toplevel)"'

# quick hack to make watch work with aliases
alias watch='watch -c -d -t '

