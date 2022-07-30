FROM ubuntu:22.04
RUN apt-get update -qq && \ 
DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y \
# ssh and tunnel tools \
openssh-server ssh \
# needed for ssf \
unzip \
sudo coreutils \
# networking stuff \
iputils-ping  iproute2 curl net-tools \
# helpful tools \
vim \
# for portforwarding python example \
python2 \
# for reverse/local portforwarding tunnel plink \
wine-stable wine64 \
# for local portforwarding socat \
socat \
# for local portforwarding rinetd \
rinetd \
# browser using jump server \
xorg xauth

# Add user
RUN useradd -rm -d /home/jumphost -s /bin/bash -g root -G sudo -u 1000 jumphost
RUN echo 'jumphost:jumphost' | chpasswd
# SSH Service
COPY sshd/sshd_config /etc/ssh/sshd_config
RUN service ssh start

# for port forwarding perl example
COPY tcp-proxy2.pl /home/jumphost
RUN chown jumphost /home/jumphost/tcp-proxy2.pl
# for port forwarding python example
COPY port-forward.py /home/jumphost
RUN chown jumphost /home/jumphost/port-forward.py

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:mozillateam/ppa
RUN echo '\
Package: *\
Pin: release o=LP-PPA-mozillateam\
Pin-Priority: 1001\
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
RUN apt-get install -y firefox


# Set Prompt and run start.sh
COPY start.sh /
RUN chmod u+x /start.sh
RUN echo 'PS1=jumphost":"$PS1' >> /root/.bashrc
CMD ["/start.sh"]
