FROM ubuntu:21.10
RUN apt-get update -qq && apt-get install -y openssh-server ssh iputils-ping vim iproute2 curl unzip net-tools proxychains

# SSH Service
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 outside
RUN echo 'outside:outside' | chpasswd
RUN service ssh start

RUN touch /var/log/syslog
COPY start.sh /
RUN chmod u+x /start.sh
CMD ["/start.sh"]
