FROM php:5.6-apache

RUN apt-get -y update --fix-missing
RUN apt-get upgrade -y

# Install useful tools
RUN apt-get -y install --fix-missing nano \
									vim \
									wget

# Install important libraries
RUN apt-get -y install --fix-missing apt-utils \
									build-essential \
									git \
									curl \
									libcurl4-openssl-dev \
									libcurl3 \
									libcurl3-dev \
									zip \
									nano \
									vim \
									wget \
									net-tools \
									iputils-ping

# Install php libraries

RUN apt-get -y install zlib1g-dev \
											libzip-dev \
											libxml2-dev \
											libssh2-1 \
											libpng-dev \
											libmcrypt4

RUN docker-php-ext-install gd
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install curl
RUN docker-php-ext-install xml
RUN docker-php-ext-install xmlrpc
#RUN docker-php-ext-install fpm
#RUN docker-php-ext-install pear
#RUN docker-php-ext-install dev
RUN docker-php-ext-install zip
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
#RUN docker-php-ext-install libapache2-mod-php

# Install xdebug
#RUN pecl install xdebug-2.5.0
#RUN docker-php-ext-enable xdebug

COPY . /var/www/html/
WORKDIR /var/www/html/

# Enable apache modules
RUN a2enmod rewrite headers
RUN service apache2 restart
