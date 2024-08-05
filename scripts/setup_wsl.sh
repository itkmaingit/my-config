#! /bin/bash

### working at home directory
cd ~

printf "Host github.com\n  HostName github.com\n  IdentityFile ~/.ssh/id_ed25519 #ここに自分の鍵のファイル名\n  User git\n  IdentitiesOnly yes" > ~/.ssh/config

# No passworld for sudo
echo "$(whoami)   ALL=(ALL:ALL)   NOPASSWD:       ALL" | sudo tee -a /etc/sudoers > /dev/null

# donwload settings repository
mkdir -p ~/.config/unq
git clone git@github.com:itkmaingit/my-config.git ~/.config/unq

# basic settings
mkdir -p ~/.config/lazygit
rm -f ~/.bashrc ~/.gitconfig ~/.latexmkrc ~/.config/lazygit/config.yml
ln -s ~/.config/unq/configuration/home/.bashrc ~/.bashrc
ln -s ~/.config/unq/configuration/home/.gitconfig ~/.gitconfig
ln -s ~/.config/unq/configuration/home/.latexmkrc ~/.latexmkrc
ln -s ~/.config/unq/configuration/lazygit/config.yml ~/.config/lazygit/config.yml
sh ~/.config/unq/scripts/setup_cron.sh
sudo chmod +x ~/.config/unq/scripts/synchronization.sh

### root settings
sudo rm -f /etc/wsl.conf /etc/resolv.conf
sudo ln -s ~/.config/unq/configuration/root/wsl.conf /etc/wsl.conf
sudo ln -s ~/.config/unq/configuration/root/resolv.conf /etc/resolv.conf
source ~/.bashrc

#### git-completion.sh & git-prompt.sh
curl -o .git-completion.sh \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o .git-prompt.sh \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

#### rust
curl https://sh.rustup.rs -sSf | sh
reload
rustup update

#### cargo
cargo install exa fd-find ripgrep navi grex git-delta tre
cargo install --locked bat zoxide

#### mcfly
curl -LSfs https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh | sudo sh -s -- --git cantino/mcfly

#### direnv
curl -sfL https://direnv.net/install.sh | bash

#### lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
rm -f lazygit.tar.gz lazygit
sudo install  lazygit /usr/local/bin

#### lazydocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

#### speedtest
wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
sudo mv speedtest-cli /usr/bin/speedtest
sudo chmod +x /usr/bin/speedtest
