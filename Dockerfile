FROM php:5.6-apache

RUN apt-get update \
  && apt-get install -y build-essential software-properties-common curl git python libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev \
  && curl -sL https://deb.nodesource.com/setup_5.x | bash - \
  && apt-get update \
  && apt-get install -y mysql-client \
  && apt-get install -y --force-yes ruby2.1 nodejs \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
  && ln -s /usr/bin/ruby2.1 /usr/bin/ruby
RUN docker-php-ext-install curl mbstring mcrypt mysql \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install gd
RUN service apache2 start

ENV PATH /root/.composer/vendor/bin:$PATH

