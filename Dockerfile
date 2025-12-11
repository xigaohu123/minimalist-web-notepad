FROM php:7.4-apache

# Enable mod_rewrite
RUN a2enmod rewrite

# Copy app files
COPY .htaccess index.php /var/www/html/

# Create notes directory
RUN mkdir -p /var/www/html/_tmp \
    && chown -R www-data:www-data /var/www/html \
    && find /var/www/html -type d -exec chmod 755 {} \; \
    && find /var/www/html -type f -exec chmod 644 {} \;

# Ensure Apache runs in foreground
CMD ["apache2-foreground"]