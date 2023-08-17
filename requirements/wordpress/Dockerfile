FROM debian:buster

RUN apt update -y \
    && apt upgrade -y
RUN apt install -y wget \
                   unzip \
                   php7.3 \
                   php-fpm \
				   php-mysql \
				   mariadb-client

COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /var/

COPY wp_install.sh /var/
RUN bash /var/wp_install.sh

CMD ["bash", "/var/wp_install.sh"]

EXPOSE 9000
