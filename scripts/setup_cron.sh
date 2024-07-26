#!/bin/bash

# ジョブ内容
JOB="*/10 * * * * ~/.config/unq/scripts/synchronization.sh"

# crontab に現在のユーザーのジョブを出力し、新しいジョブを追加
(crontab -l 2>/dev/null; echo "$JOB") | crontab -
