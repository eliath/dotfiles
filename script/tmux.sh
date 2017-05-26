. common.sh

rm -f $HOME/.tmux.conf
ln -s $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf
tmux source-file ~/.tmux.conf
