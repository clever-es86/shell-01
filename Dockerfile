FROM php:8.2-apache

RUN a2enmod rewrite

RUN apt-get update
RUN apt-get install -y libzip-dev zip unzip
RUN docker-php-ext-install zip pdo pdo_mysql mysqli

COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 775 /var/www/html

EXPOSE 80
