#! /bin/bash
# SSF
cd /
curl -kLO https://github.com/securesocketfunneling/ssf/releases/download/3.0.0/ssf-linux-x86_64-3.0.0.zip
unzip -o ssf-linux-x86_64-3.0.0.zip

# Chisel (cf https://0xdf.gitlab.io/2020/08/10/tunneling-with-chisel-and-ssf-update.html)
cd /home/inside_client
curl -OL https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_amd64.gz
cat chisel_1.7.7_linux_amd64.gz | gzip -d - > chisel
chown inside_client chisel
chmod u+x chisel

while :; do sleep 1; done
