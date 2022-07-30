FROM ubuntu:21.10
RUN apt-get update -qq && \
DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC  apt-get install -y ssh iputils-ping vim iproute2 curl unzip net-tools

# Add user inside_client
RUN useradd -rm -d /home/inside_client -s /bin/bash -g root -G sudo -u 1000 inside_client
RUN echo 'inside_client:inside_client' | chpasswd

COPY start.sh /
RUN chmod u+x /start.sh
RUN echo 'PS1=inside_client":"$PS1' >> /root/.bashrc
CMD ["/start.sh"]
