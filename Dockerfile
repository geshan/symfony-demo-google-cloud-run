FROM composer:1.9 as build
WORKDIR /app/
COPY composer.json composer.lock /app/
RUN composer global require hirak/prestissimo &&  composer install --no-interaction

FROM php:7.3-apache-stretch
RUN apt-get update && apt-get install -y \
    acl \
 && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install pdo
WORKDIR /var/www/project

ENV APP_ENV=prod
ENV HTTPDUSER='www-data'

COPY docker/000-default.conf /etc/apache2/sites-available/
COPY --from=build /app/vendor /var/www/project/vendor
COPY . /var/www/project/

RUN setfacl -dR -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var && \
    setfacl -R -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var && \
    echo "Listen 8080" >> /etc/apache2/ports.conf && \
    a2enmod rewrite && \
    php bin/console cache:clear --no-warmup && \
    php bin/console cache:warmup

CMD ["apache2-foreground"]
