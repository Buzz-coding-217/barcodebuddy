FROM php:8.2-apache

# Install needed PHP extensions
RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql

# Copy Barcode Buddy source into Apache root
COPY . /var/www/html/

# Permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
CMD ["apache2-foreground"]
