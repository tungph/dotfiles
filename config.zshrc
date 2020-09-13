export PATH="/usr/local/sbin:$HOME/.local/dotfiles/dependencies/diff-so-fancy:$PATH"

#### FUNCTIONS #####
function j() {
	target="$(z -l | fzy | awk -F ' ' '{print $NF}')"
	cd "$target" || exit
}

function jj() {
	target="$(z -c | fzy | awk -F ' ' '{print $NF}')"
	cd "$target" || exit
}

function tl() {
	if [ $# -gt 1 ]; then
		# shellcheck disable=SC2068
		tldr "${@:1:1}" | ag -C 1 ${@:2}
	else
		# shellcheck disable=SC2068
		tldr $@ | less
	fi
}

#### ALIASES #####
alias ss="(cd ~/.local/dotfiles && git add -u . && git commit -m \"sync\" && git push)"
alias pp="(cd ~/.local/dotfiles && git pull && rm -f ~/.localrc && ln localrc ~/.localrc)"
alias diff="diff-so-fancy"
alias vi='nvim'
alias zz="vi ~/.localrc && rl"
alias vv="vi ~/.vimrc ~/.config/nvim/init.vim"
alias rl="exec zsh"
alias tm="tmux a -t local || tmux new -s local"

alias del='rm -rf'
alias f="ls -ltra | grep -i"
alias ff='ag -g'
alias gr='ag'
alias lt='ls -ltrs'

alias gl='git l | less -r'

alias of='open'
alias rp='realpath'

alias xc='exercism'
alias fl='flutter'
alias ad='adb devices'

alias di='docker images'
alias dif='di | grep -i'
alias dc='docker-compose'
alias dl='docker logs -f'
alias dp='docker ps'

# LOCAL ONLY
if [ "$(uname)" = "Darwin" ]; then
	alias del="trash"
	alias xclip='pbcopy'
	alias lsregister='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Versions/Current/Support/lsregister'

	alias sshpersonalec2='ssh -i ~/.ssh/servers/personal_ec2.pem ubuntu@ec2-18-188-200-212.us-east-2.compute.amazonaws.com'
	alias nn='ssh -i ~/.ssh/servers/44.229.237.92.pem shawn@44.229.237.92'
	alias nng='ssh -i ~/.ssh/servers/54.203.226.136.pem shawn@54.203.226.136'
	alias sshgcpinstance='ssh -i ~/.ssh/id_rsa  tungph_hut_gmail_com@35.223.233.120'
	alias home='ssh shawn@192.168.0.208'
	alias cb='ssh -i ~/.ssh/servers/54.184.20.134.pem shawn@54.184.20.134'
	alias sshnathan='ssh -i ~/.ssh/servers/44.231.181.118.pem nathan@44.231.181.118'
fi