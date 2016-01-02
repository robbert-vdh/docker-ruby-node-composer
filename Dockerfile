FROM php:5.6-apache

RUN apt-get update

# Install build tools and libraries
RUN apt-get install -y build-essential software-properties-common curl git python libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev libcurl4-gnutls-dev netcat

# Install ruby
RUN apt-get install -y ruby2.1 \
  && ln -s /usr/bin/ruby2.1 /usr/bin/ruby \
  && ln -s /usr/bin/gem2.1 /usr/bin/gem

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash - \
  && apt-get install -y nodejs

# Install the MySQL cli
RUN apt-get install -y mysql-client

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install curl gd mbstring mcrypt mysql pdo_mysql zip

# Enable mod_rewrite
RUN a2enmod rewrite

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Default PHP configuration (taken from Ubuntu's PHP package)
COPY php.ini /usr/local/etc/php/

# Add composer's vendor directory to the path
ENV PATH /root/.composer/vendor/bin:$PATH

