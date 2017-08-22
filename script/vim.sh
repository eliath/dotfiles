. $HOME/dotfiles/script/lazy_init.sh

rm -r ~/.vim
VIM_CONFIG_SRC="$DOTFILES/vim/.vim"
curl -fLo $VIM_CONFIG_SRC/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s $VIM_CONFIG_SRC "$HOME/.vim"
ln -s "$DOTFILES/vim/.vimrc" "$HOME/.vimrc"
ln -s "$DOTFILES/vim/.tern-config" "$HOME/.tern-config"

# Install plugins
vim -c "PlugInstall | q | q"
