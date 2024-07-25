# Overview

WSLが消えた時用にライブラリインストールの方法をまとめておく

以下ライブラリをインストールするようになっている。また、レシピファイルなどの初期設定を行う。

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
- [tre](https://github.com/dduan/tre)

## installation

以下コマンドを実行する。

```bash
echo "$(whoami)   ALL=(ALL:ALL)   NOPASSWD:       ALL" | sudo tee -a /etc/sudoers > /dev/null
mkdir -p ~/.config/.settings
git clone https://github.com/itkmaingit/my-config.git ~/.config/.settings
sh ~/.config/.settings/setup_wsl.sh
```
