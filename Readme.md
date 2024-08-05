# Overview

WSLが消えた時用にライブラリインストールの方法をまとめておく

以下ライブラリをインストールするようになっている。また、レシピファイルなどの初期設定を行う。

- [GitHub CLI](https://github.com/cli/cli)
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
- [mcfly](https://github.com/cantino/mcfly)
- [direnv](https://github.com/direnv/direnv/tree/master)
- [speedtest-cli](https://www.speedtest.net/apps/cli)

## installation

以下コマンドを実行する。

```bash
curl -fsSL https://raw.githubusercontent.com/itkmaingit/my-config/main/scripts/setup_git.sh | sh
echo -e "\n\n### input example ### \n\n\e[32m?\e[m What account do you want to log into? ->\e[36m GitHub.com\e[m\n\e[32m?\e[m What is your preferred protocol for Git operations? -> \e[36mSSH\e[m\n\e[32m?\e[m Generate a new SSH key to add to your GitHub account? -> \e[36mYes\e[m\n\e[32m?\e[m Enter a passphrase for your new SSH key -> (Enter) \n\e[32m?\e[m How would you like to authenticate GitHub CLI? -> \e[36mLogin with a web browser\e[m\n\n"
gh auth login
curl -fsSL https://raw.githubusercontent.com/itkmaingit/my-config/main/scripts/setup_wsl.sh | sh
```
