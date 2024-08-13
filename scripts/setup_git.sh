#! /bin/bash

### working at home directory
cd ~

# Install GitHub CLI and login GitHub
sudo apt update \
&& sudo apt upgrade -y \
&& sudo apt install -y wget  gcc cron curl libsqlite3-dev libpq-dev libmysqlclient-dev build-essential python-is-python3 nodejs npm python3-dev python3-pip python3-setuptools \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt install gh -y
