#!/bin/bash
set -e

# 核心逻辑：容器启动时，强制修改挂载目录的权限
# 注意：这需要容器以 root 启动（Apache 默认就是 root 启动）
if [ -d "/var/www/html/_tmp" ]; then
    chown -R www-data:www-data /var/www/html/_tmp
fi

# 执行原本的 CMD 命令 (即 apache2-foreground)
exec "$@"