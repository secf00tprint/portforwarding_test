FROM ubuntu:21.10
RUN apt-get update -qq && \ 
DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y openssh-server ssh sudo iputils-ping vim iproute2 curl unzip net-tools \
# for reverse/local portforwarding tunnel plink \
wine-stable wine64 \
# for local portforwarding socat \
socat \
# for local portforwarding rinetd \
rinetd \
# for local portforwarding iptables installs nf-tables
iptables

# Wine configuration for plink
#RUN dpkg --add-architecture i386 && apt-get update -qq && apt-get -y install wine32

# SSH Service
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 jumphost
RUN echo 'jumphost:jumphost' | chpasswd
RUN service ssh start

COPY start.sh /
COPY tcp-proxy2.pl /
RUN chmod u+x /start.sh
# Set Prompt
RUN echo 'PS1=jumphost":"$PS1' >> /root/.bashrc
CMD ["/start.sh"]
