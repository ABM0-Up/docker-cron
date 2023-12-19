# Use the official PHP image as the base image
FROM php:8.0-fpm

# Install necessary packages for Laravel, including cron and unzip
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install -y cron curl unzip libpq-dev \
    # Remove package lists for smaller image sizes
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo pdo_mysql \
    # Install Composer
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN ls -al .
RUN ls -al /workspace