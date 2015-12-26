FROM ubuntu

RUN apt-get update \
  && apt-get install -y build-essential software-properties-common curl git python \
  && curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash - \
  && apt-add-repository -y ppa:brightbox/ruby-ng \
  && apt-add-repository -y ppa:ondrej/php5-5.6 \
  && apt-get update \
  && apt-get install -y --force-yes ruby2.2 nodejs php5 php5-curl php5-mcrypt php5-mysql \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV PATH /root/.composer/vendor/bin:$PATH

CMD ruby --version
