#! /bin/bash

#### init
sudo apt update
sudo apt upgrade -y
sudo apt install -y  gcc cron curl

#### rust
curl https://sh.rustup.rs -sSf | sh
rustup update

#### cargo
cargo install exa fd-find ripgrep navi grex git-delta tre
cargo install --locked bat zoxide

#### lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install -y lazygit /usr/local/bin

#### lazydocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

### settings
mkdir -p ~/.config/lazygit
rm ~/.bashrc
rm ~/.gitconfig
rm ~/.latexmkrc
rm ~/.config/lazygit/config.yml
ln -s ~/.config/.settings/configuration/home/.bashrc ~/.bashrc
ln -s ~/.config/.settings/configuration/home/.gitconfig ~/.gitconfig
ln -s ~/.config/.settings/configuration/home/.latexmkrc ~/.latexmkrc
ln -s ~/.config/.settings/configuration/lazygit/config.yml ~/.config/lazygit/config.yml
sh ~/.config/.settings/scripts/setup_cron.sh

### root settings
sudo rm /etc/wsl.conf
sudo ln -s ~/.config/.settings/configuration/root/wsl.conf /etc/wsl.conf
