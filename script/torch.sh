. lazt_init.sh

# Install torch & some extra libs
git clone https://github.com/torch/distro.git ~/torch --recursive
pushd ~/torch
bash install-deps
./install.sh
popd

# luarocks deps
luarocks install async
luarocks install luasocket
luarocks install image
luarocks install csvigo
luarocks install graphicsmagick
luarocks install luacheck

ln -s $DOTFILES/lua/.luacheckrc $HOME/
