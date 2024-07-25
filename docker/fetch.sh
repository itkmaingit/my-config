#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt-get update
sudo apt-get upgrade -y

sudo apt install -y fzf exa fd-find bat
sudo apt-get install -y ripgrep

# zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

mkdir -p ~/.local/bin
# シンボリックリンク
ln -s $(which fdfind) ~/.local/bin/fd
ln -s $(which fdfind) ~/.local/bin/bat

echo 'alias g='git'' >> ~/.bashrc
echo 'alias ls='ls -l'' >> ~/.bashrc
echo 'alias ex='exa -l --icons --group-directories-first'' >> ~/.bashrc
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
