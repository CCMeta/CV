#!/bin/bash

# 引用 Secret 中存储的服务器 IP
TARGET_IP="$SERVER_IP"

echo "开始检查服务器：$TARGET_IP"

# 使用 ping 命令检查连通性，尝试 3 次 (-c 3)
# -W 2 表示超时时间为 2 秒
if ping -c 3 -W 2 $TARGET_IP; then
    echo "✅ 服务器正常运行。"
    exit 0 # 成功退出 (Job 成功)
else
    echo "❌ 警告：服务器无响应！"
    exit 1 # 失败退出 (Job 失败，触发 GitHub 邮件通知)
fi