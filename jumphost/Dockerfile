FROM ubuntu:21.10
RUN apt-get update -qq && \ 
DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y openssh-server ssh sudo iputils-ping vim iproute2 curl unzip net-tools \
# for plink \
wine-stable \

# Wine configuration for plink
RUN dpkg --add-architecture i386 && apt-get update -qq && apt-get -y install wine32

# SSH Service
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 jumphost
RUN echo 'jumphost:jumphost' | chpasswd
RUN service ssh start

COPY start.sh /
RUN chmod u+x /start.sh
CMD ["/start.sh"]
