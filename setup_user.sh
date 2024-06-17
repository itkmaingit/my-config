#!/bin/bash

# 引数として受け取るユーザー名
USERNAME=$1

# 引数が渡されているか確認
if [ -z "$USERNAME" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

echo "Checking if user $USERNAME exists"

# ユーザーが存在しない場合に作成
if ! id -u "$USERNAME" &>/dev/null; then
    echo "User $USERNAME does not exist. Creating user."
    useradd -m "$USERNAME"
else
    echo "User $USERNAME already exists."
fi

# sudoers.d に設定を追加
echo "$USERNAME ALL=(root) NOPASSWD:ALL" | tee /etc/sudoers.d/$USERNAME
chmod 0440 /etc/sudoers.d/$USERNAME

echo "User $USERNAME setup complete."
