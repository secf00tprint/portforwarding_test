FROM ubuntu:21.10
RUN apt-get update -qq && \
DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC  apt-get install -y ssh iputils-ping vim iproute2 curl unzip net-tools

COPY start.sh /
RUN chmod u+x /start.sh
RUN echo 'PS1=inside_client":"$PS1' >> /root/.bashrc
CMD ["/start.sh"]
