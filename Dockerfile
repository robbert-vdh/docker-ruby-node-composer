FROM php:5.6-apache

RUN apt-get update \
  && apt-get install -y build-essential software-properties-common curl git python \
  && curl -sL https://deb.nodesource.com/setup_5.x | bash - \
  && apt-get update \
  && apt-get install -y mysql-client \
  && apt-get install -y --force-yes ruby2.1 nodejs \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV PATH /root/.composer/vendor/bin:$PATH

