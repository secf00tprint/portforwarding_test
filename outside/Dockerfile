FROM ubuntu:21.10
RUN apt-get update -qq && apt-get install -y openssh-server ssh iputils-ping vim iproute2 curl unzip net-tools proxychains

# Add user
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 outside
RUN echo 'outside:outside' | chpasswd
# SSH Service
RUN service ssh start

RUN mkdir -p /www/
COPY www/index.html /www/

# Set Prompt and run start.sh 
COPY start.sh /
RUN chmod u+x /start.sh
RUN echo 'PS1=outside":"$PS1' >> /root/.bashrc
CMD ["/start.sh"]
