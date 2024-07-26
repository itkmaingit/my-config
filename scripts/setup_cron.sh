#!/bin/bash

# ジョブ内容
JOB1="*/10 * * * * ~/.config/unq/scripts/synchronization.sh"
JOB2="@reboot ~/.config/unq/scripts/synchronization.sh"

# crontab に現在のユーザーのジョブを出力し、新しいジョブを追加
(crontab -l 2>/dev/null; echo "$JOB1") | crontab -
(crontab -l 2>/dev/null; echo "$JOB2") | crontab -
