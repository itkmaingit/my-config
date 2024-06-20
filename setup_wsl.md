# Overview

WSLが消えた時用にライブラリインストールの方法をまとめておく

以下ライブラリをインストール。

- [fzf](https://github.com/junegunn/fzf)
- [exa](https://github.com/ogham/exa)
- [fd-find(fd)](https://github.com/sharkdp/fd)
- [bat](https://github.com/sharkdp/bat)
- [ripgrep(rg)](https://github.com/BurntSushi/ripgrep)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [lazydocker](https://github.com/jesseduffield/lazydocker)
- [delta](https://github.com/dandavison/delta)
- [cargo](https://qiita.com/yoshiyasu1111/items/0c3d08658560d4b91431)
- [navi](https://github.com/denisidoro/navi)
- [grex](https://github.com/pemistahl/grex)

## Commands
### installation
```bash
sudo apt update
sudo apt upgrade -y
sudo apt-get update
sudo apt-get upgrade -y

sudo apt install -y fzf exa fd-find bat gcc
sudo apt-get install -y ripgrep

#### rust
curl https://sh.rustup.rs -sSf | sh

#### zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

#### navi
cargo install navi

#### grex
cargo install grex

#### delta
cargo install git-delta

#### symbolic link
mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd
ln -s $(which fdfind) ~/.local/bin/bat

### settings
echo 'alias g='git'' >> ~/.bashrc
echo 'alias ls='ls -l'' >> ~/.bashrc
echo 'alias ex='exa -l --icons --group-directories-first'' >> ~/.bashrc
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
echo 'export PATH="$PATH:$HOME/.cargo/bin"' >> ~/.bashrc
```

#### lazygit
~/.config/lazygit/config.ymlに以下を記述。
```yml
gui:
  nerdFontsVersion: "3"

git:
  allBranchesLogCmd: git log --graph --color=always --date=format:'%Y-%m-%d %H:%M' --pretty=format:'%C(#a0a0a0 reverse)%h%Creset %C(cyan)%ad%Creset %C(#dd4814)%ae%Creset %C(yellow reverse)%d%Creset %n%C(white bold)%s%Creset%n' --
  branchLogCmd: git log --graph --color=always --date=format:'%Y-%m-%d %H:%M' --pretty=format:'%C(#a0a0a0 reverse)%h%Creset %C(cyan)%ad%Creset %C(#dd4814)%ae%Creset %C(yellow reverse)%d%Creset %n%C(white bold)%s%Creset%n' {{branchName}} --
  paging:
    colorArg: always
    pager: delta --dark --paging=never

customCommands:
  - key: "V"
    context: "localBranches"
    description: "branch vacuum"
    command: "git vacuum"
```


