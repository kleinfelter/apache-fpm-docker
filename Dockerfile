FROM ubuntu:18.04

EXPOSE 80

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

RUN apt-get update && apt-get install -yq --no-install-recommends \
        apache2 \
        libapache2-mod-php7.2 \
        php7.2-fpm  && \
    a2enmod proxy_fcgi && \
    sed -i 's#^listen = /run/php/php7.2-fpm.sock#listen = 127.0.0.1:9000#' /etc/php/7.2/fpm/pool.d/www.conf && \
    echo '<?php phpinfo() ?>' > /var/www/html/index.php && \

COPY conf/apache/sites-available/* /etc/apache2/sites-available/

# The next 2 lines prevent Apache whining: Could not reliably determine the server's fully qualified domain name
RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/servername.conf
RUN a2enconf servername

WORKDIR /var/www/html

