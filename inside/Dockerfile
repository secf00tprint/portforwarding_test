FROM httpd:2.4.53
RUN apt-get update -qq && apt-get install -y openssh-server ssh sudo iputils-ping vim iproute2 curl unzip net-tools

# SSH Service
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 inside
RUN echo 'inside:inside' | chpasswd
RUN service ssh start

COPY start.sh /
RUN chmod u+x /start.sh
COPY www/index.html /usr/local/apache2/htdocs
RUN chown www-data:www-data /usr/local/apache2/htdocs/index.html
CMD ["/start.sh"]
