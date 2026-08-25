# استخدام نسخة Alpine خفيفة جداً من PHP مع سيرفر Apache
FROM php:8.2-alpine-apache

# تثبيت الأدوات والامتدادات الأساسية للتعامل مع الملفات والأرشيف
RUN apk add --no-libc-base-utils --no-cache \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-install zip

# تحديد مجلد العمل داخل الحاوية
WORKDIR /var/www/html

# تنزيل ملف Tiny File Manager المباشر وتسميته index.php
ADD https://raw.githubusercontent.com/prasathmani/tinyfilemanager/master/tinyfilemanager.php ./index.php

# ضبط صلاحيات الملكية لخدمة Apache لتمكين تعديل ورفع الملفات
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# فتح المنفذ الافتراضي للويب
EXPOSE 80

# تشغيل سيرفر Apache في الواجهة الأمامية
CMD ["httpd-foreground"]