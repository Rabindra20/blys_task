#PHP and Apache image as the base
FROM php:8.2-apache
WORKDIR /var/www/html
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the entire WordPress directory
COPY ./wordpress /var/www/html
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Enable Apache mod_rewrite for permalinks
RUN a2enmod rewrite
EXPOSE 80
CMD ["apache2-foreground"]
