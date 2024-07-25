dns () {
    sudo rm /etc/resolv.conf
    sudo sh -c "echo 'nameserver 8.8.8.8' > /etc/resolv.conf"
}

vpn () {
    sudo ip link set eth0 mtu 1200
}

# dive <container-name>
dive () {
    docker container exec -it $1 /bin/bash
}

tre() { command tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null; }

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
alias g='git'
alias ex='exa -l --icons --group-directories-first'
alias lg='lazygit'
alias lzd='lazydocker'
alias bat='/home/dango/.cargo/bin/bat'
eval "$(zoxide init bash)"
eval "$(direnv hook bash)"
. "$HOME/.cargo/env"
export EDITOR=code
dns
bash ~/.config/.settings/scripts/pull.sh
bash ~/.config/.settings/scripts/push.sh