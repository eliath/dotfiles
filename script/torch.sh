. $HOME/dotfiles/script/lazy_init.sh
TORCH_DIR='$HOME/torch'
# Prevent multiple installs
if [ -d "$TORCH_DIR/install" ]; then
  echo '[DOTFILES] Torch seems to have already been installed. Skipping...'
else
  # Install torch & some extra libs
  git clone https://github.com/torch/distro.git ~/torch --recursive
  pushd ~/torch
  bash install-deps
  ./install.sh
  popd
fi

# luarocks deps
LUAROCKS_BIN=$TORCH_DIR/install/bin/luarocks
$LUAROCKS_BIN install async
$LUAROCKS_BIN install luasocket
$LUAROCKS_BIN install image
$LUAROCKS_BIN install csvigo
$LUAROCKS_BIN install graphicsmagick
$LUAROCKS_BIN install luacheck

ln -s $DOTFILES/lua/.luacheckrc $HOME/
