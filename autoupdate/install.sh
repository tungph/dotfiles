#!/bin/sh
# setups the auto-update
#(
#	crontab -l | grep -v "dot_update"
#	echo "0 */2 * * * $HOME/.dotfiles/bin/dot_update > ${TMPDIR:-/tmp}/dotfiles_$USER.log 2>&1"
#) | crontab -

dot pull
