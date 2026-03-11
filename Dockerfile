FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    git \
    libpq-dev \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-install pgsql pdo_pgsql zip

RUN a2enmod rewrite

WORKDIR /var/www/html

RUN git clone --branch MOODLE_405_STABLE https://github.com/moodle/moodle.git .

RUN chown -R www-data:www-data /var/www/html
RUN mkdir -p /var/moodledata

RUN chown -R www-data:www-data /var/moodledata \
    && chmod -R 777 /var/moodledata