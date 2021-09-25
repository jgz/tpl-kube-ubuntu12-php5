FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y \
    apache2 \
    php5 \
    php5-cli \
    php5-curl \
    libapache2-mod-php5 \
    php5-gd \
    php5-ldap \
    php5-mysql \
    php5-pgsql

COPY src/* /var/www/
COPY apache.conf /etc/apache2/sites-available/000-default.conf
COPY run /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint
RUN a2enmod rewrite

EXPOSE 80
CMD ["/usr/local/bin/entrypoint"]
