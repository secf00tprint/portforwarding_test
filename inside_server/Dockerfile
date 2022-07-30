FROM httpd:2.4.54
RUN apt-get update -qq && \
DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC  apt-get install -y openssh-server ssh sudo iputils-ping vim iproute2 curl unzip net-tools 

# Add user
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 inside
RUN echo 'inside:inside' | chpasswd
# SSH Service
RUN service ssh start

COPY start.sh /
RUN chmod u+x /start.sh
# Set up web server
COPY www/index.html /usr/local/apache2/htdocs
RUN chown www-data:www-data /usr/local/apache2/htdocs/index.html
# Set prompt
RUN echo 'PS1=inside_server":"$PS1' >> /root/.bashrc
CMD ["/start.sh"]
