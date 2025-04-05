FROM php:8.2.28-apache-bullseye

MAINTAINER glauciolabs

ARG htmly_version=v3.0.7

RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libzip-dev zip unzip libonig-dev libxml2-dev wget git \
    && rm -rf /var/lib/apt/lists/*


RUN docker-php-ext-install mbstring
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd

RUN a2enmod rewrite

RUN wget -O /tmp/htmly.tar.gz https://github.com/danpros/htmly/archive/refs/tags/${htmly_version}.tar.gz \
    && tar -xzf /tmp/htmly.tar.gz -C /var/www/html/ --strip-components 1 \
    && rm -rf /tmp/htmly* \
    && rm -rf /var/www/html/config/config.ini

RUN rm -rf /var/www/html/config/config.ini

RUN chown -R www-data:www-data /var/www/html

USER www-data

EXPOSE 80
CMD ["apache2-foreground"]
