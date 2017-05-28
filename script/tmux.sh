. common.sh

mkdir -p "$HOME/.tmux/plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
rm -f $HOME/.tmux.conf
ln -s $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf
tmux source-file ~/.tmux.conf
