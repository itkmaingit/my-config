#!/bin/bash

# ファイルのURL
file_urls=(
  "https://raw.githubusercontent.com/itkmaingit/my-config/main/.gitconfig"
  "https://raw.githubusercontent.com/itkmaingit/my-config/main/.latexmkrc"
  )

# 保存先のファイルパス
save_paths=(
  "${HOME}/.gitconfig"
  "${HOME}/.latexmkrc"
  )

# URLと保存先パスの数が一致しているか確認
if [ ${#file_urls[@]} -ne ${#save_paths[@]} ]; then
    echo "エラー: URLの数と保存先のパスの数が一致しません"
    exit 1
fi

# ファイルの数（配列の要素数）
num_files=${#file_urls[@]}

# ファイルを順番に取得・保存するループ
for (( i=0; i<$num_files; i++ )); do
    file_url="${file_urls[$i]}"
    save_path="${save_paths[$i]}"

    # curlコマンドでファイルを取得し、保存する
    curl -o "$save_path" -fL "$file_url"
done