. common.sh

# Install torch & some extra libs
git clone https://github.com/torch/distro.git ~/torch --recursive
pushd ~/torch
bash install-deps
./install.sh
popd
