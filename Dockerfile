FROM php:8.2-apache

# تفعيل وحدة إعادة التوجيه mod_rewrite
RUN a2enmod rewrite

# ضبط المنفذ الديناميكي الخاص بـ Render
RUN sed -i 's/80/${PORT}/g' /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

# تثبيت إضافة zip وتوسيعات PHP
RUN apt-get update && apt-get install -y \
    libzip-dev zip unzip \
    && docker-php-ext-install zip pdo pdo_mysql mysqli

# نسخ كل الملفات ومنح الصلاحيات
COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html

EXPOSE 80