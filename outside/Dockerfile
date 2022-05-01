FROM ubuntu:21.10
RUN apt-get update -qq && \
DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y openssh-server ssh iputils-ping vim iproute2 curl unzip net-tools proxychains \
# for plink 
wine-stable wine64 

# SSH Service
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 outside
RUN echo 'outside:outside' | chpasswd
RUN service ssh start

RUN touch /var/log/syslog
COPY start.sh /
RUN chmod u+x /start.sh
# Set prompt
RUN echo 'PS1=outside":"$PS1' >> /root/.bashrc
CMD ["/start.sh"]
