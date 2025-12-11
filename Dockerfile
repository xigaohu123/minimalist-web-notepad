FROM php:7.4-apache

RUN a2enmod rewrite

COPY index.php .htaccess /var/www/html/

# _tmp will be mounted from host, so just ensure it exists
RUN mkdir -p /var/www/html/_tmp \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html  # readable/executable only
# 复制刚才写的脚本进容器
COPY docker-entrypoint.sh /usr/local/bin/

# 赋予脚本执行权限
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# 设置入口点：每次容器启动都会先运行这个脚本
ENTRYPOINT ["docker-entrypoint.sh"]

# 原本的 CMD 保持不变，它会作为参数传给 entrypoint
CMD ["apache2-foreground"]
