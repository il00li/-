FROM php:8.2-apache

# تفعيل التمديدات المطلوبة
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# نسخ ملفات التطبيق إلى الحاوية
COPY . /var/www/html/

# تفعيل mod_rewrite لإعادة التوجيه
RUN a2enmod rewrite

# تعيين الصلاحيات للمجلدات
RUN chown -R www-data:www-data /var/www/html

# تعيين البورت الذي سيعمل عليه السيرفر
EXPOSE 80
