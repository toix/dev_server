# php-fpm
FROM php:7.2-fpm

# WORKDIR /usr/share/nginx/html

# install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

RUN apt-get update && apt-get install -y unzip libaio-dev

RUN cd /tmp && curl -L https://raw.github.com/adrianharabula/php7-with-oci8/master/instantclient/19.3.0.0.0/instantclient-basiclite-linux.x64-19.3.0.0.0dbru.zip -O
RUN cd /tmp && curl -L https://raw.github.com/adrianharabula/php7-with-oci8/master/instantclient/19.3.0.0.0/instantclient-sdk-linux.x64-19.3.0.0.0dbru.zip -O
RUN cd /tmp && curl -L https://raw.github.com/adrianharabula/php7-with-oci8/master/instantclient/19.3.0.0.0/instantclient-sqlplus-linux.x64-19.3.0.0.0dbru.zip -O

RUN unzip /tmp/instantclient-basiclite-linux.x64-19.3.0.0.0dbru.zip -d /usr/local/
RUN unzip /tmp/instantclient-sdk-linux.x64-19.3.0.0.0dbru.zip -d /usr/local/
RUN unzip /tmp/instantclient-sqlplus-linux.x64-19.3.0.0.0dbru.zip -d /usr/local/

RUN ln -s /usr/local/instantclient_19_3 /usr/local/instantclient
# fixes error "libnnz19.so: cannot open shared object file: No such file or directory"
RUN ln -s /usr/local/instantclient/lib* /usr/lib
RUN ln -s /usr/local/instantclient/sqlplus /usr/bin/sqlplus

ENV LD_LIBRARY_PATH  /usr/local/instantclient:${LD_LIBRARY_PATH}
# RUN echo 'export LD_LIBRARY_PATH="/usr/local/instantclient"' >> /root/.bashrc
# ENV ORACLE_HOME  /usr/lib/oracle/19.3/client64:${ORACLE_HOME}

RUN echo 'instantclient,/usr/local/instantclient' | pecl install oci8

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
RUN echo "extension=oci8.so" >> /usr/local/etc/php/php.ini

RUN chmod -R 775 /usr/local/lib/php/extensions

EXPOSE 9000

CMD ["php-fpm", "--nodaemonize"]
