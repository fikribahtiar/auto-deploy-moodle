FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    git \
    libpq-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libicu-dev \
    libxml2-dev \
    libexif-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
       gd \
       intl \
       soap \
       exif \
       pgsql \
       pdo_pgsql \
       zip

RUN a2enmod rewrite

WORKDIR /var/www/html

RUN git clone --branch MOODLE_405_STABLE https://github.com/moodle/moodle.git .

RUN mkdir -p /var/moodledata

RUN chown -R www-data:www-data /var/moodledata \
    && chmod -R 777 /var/moodledata