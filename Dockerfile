FROM php:8.2-apache

WORKDIR /var/www/html

ADD https://raw.githubusercontent.com/prasathmani/tinyfilemanager/master/tinyfilemanager.php ./index.php

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
