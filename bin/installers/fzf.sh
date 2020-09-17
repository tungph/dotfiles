if ! [ -d ~/.local/fzf ]; then
    git clone -q --depth 1 https://github.com/junegunn/fzf.git "$HOME/.local/fzf"
fi
~/.local/fzf/install
