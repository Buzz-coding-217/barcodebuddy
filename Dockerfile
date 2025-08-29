FROM php:8.2-apache

# Install required system packages
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libzip-dev \
    unzip \
    git \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Enable Apache mod_rewrite (Barcode Buddy needs it)
RUN a2enmod rewrite

# Copy source code into container
COPY . /var/www/html/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html

# Expose web port
EXPOSE 80

CMD ["apache2-foreground"]
