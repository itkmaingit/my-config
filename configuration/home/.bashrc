# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

if [ -f ~/.git-completion.sh ]; then
    source ~/.git-completion.sh
fi
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

# Function to set the color of git prompt
git_color() {
    # git_statusに__git_ps1の出力を格納
    local git_status="$(__git_ps1 "%s")"
    # 変更したファイルのみが存在する（ステージングエリアのみ）
    if [[ $git_status == *"+"* ]] && [[ $git_status != *"%"* ]] && [[ $git_status != "*"* ]]; then
        echo -e '\033[1;32m'

    # 変更したファイルのみが存在する（ステージングエリアとワーキングディレクトリに混在）
    elif [[ $git_status == *"*"* ]] && [[ $git_status == *"+"* ]]; then
        echo -e '\033[1;35m'

    # 変更したファイルのみが存在する（ワーキングディレクトリのみ）
    elif [[ $git_status == *"*"* ]] && [[ $git_status != *"+"* ]]; then
        echo -e '\033[1;33m'

    elif [[ $git_status == *"%"* ]]; then
        echo -e '\033[1;37m'

    else
        echo -e '\033[1;36m'
    fi
}

# addされていない変更を「*」commitされていない変更を「+」で示す
GIT_PS1_SHOWDIRTYSTATE=true
# addされていない新規ファイルの存在を「%」で示す
GIT_PS1_SHOWUNTRACKEDFILES=true
# stashがある場合は「$」で示す
unset GIT_PS1_SHOWSTASHSTATE
# upstreamと同期「=」進んでいる「>」遅れている「<」で示す
GIT_PS1_SHOWUPSTREAM=auto

PS1='\n\[\033[1;32m\]\w\[\033[0m\] \[\033[0;33m\]$(__git_ps1 "[ ")\[\033[0m\]$(git_color)$(__git_ps1 "%s")\[\033[0m\]\[\033[0;33m\]$(__git_ps1 " ]")\[\033[0m\]\n\$ '
# dive <container-name>
dive() {
    docker container exec -it $1 /bin/sh
}

dns() {
    sudo rm /etc/resolv.conf
    sudo sh -c "echo 'nameserver 8.8.8.8' > /etc/resolv.conf"
}

dns_reset() {
    sudo rm /etc/resolv.conf
    sudo ln -s /mnt/wsl/resolv.conf /etc/resolv.conf
    sudo sh -c "printf '[boot]\nsystemd=true' > /etc/wsl.conf"
}

tren() { command tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null; }

mz () {
    mkdir -p $1
    z $1
}

repeat (){
  local n=$1
  shift
  for ((i = 0; i < n; i++)); do
    "$@"
  done
}

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/usr/local/bin"
export EDITOR=code
alias g='git'
alias k='kubectl'
alias l='exa -l --icons --group-directories-first'
alias lg='lazygit'
alias lzd='lazydocker'
alias reload='source ~/.bashrc'
alias vpn='sudo ip link set eth0 mtu 1200'
alias mem-cl='sudo sh -c "/usr/bin/echo 3 > /proc/sys/vm/drop_caches"'
alias dc='docker compose'
alias d='docker'
alias gm='gitmoji'
alias gc='gitmoji -c'
alias git-per="find . -user root | xargs sudo chown $USER:$USER"
. "$HOME/.cargo/env"
eval "$(zoxide init bash)"
eval "$(gh completion -s bash)"
eval "$(mcfly init bash)"
eval "$(direnv hook bash)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(task --completion bash)"
