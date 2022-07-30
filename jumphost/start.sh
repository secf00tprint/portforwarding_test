#! /bin/bash
# SSF
cd /home/jumphost
curl -kLO https://github.com/securesocketfunneling/ssf/releases/download/3.0.0/ssf-linux-x86_64-3.0.0.zip
unzip -o ssf-linux-x86_64-3.0.0.zip
chown -R jumphost ssf-linux-x86_64-3.0.0

# plink from https://www.chiark.greenend.org.uk/~sgtatham/putty/releases/0.76.html
# you can call it with wine plink.exe
cd /home/jumphost
curl -OkL https://the.earth.li/~sgtatham/putty/0.76/w64/plink.exe
chown jumphost plink.exe
chmod u+x plink.exe

# Chisel (cf https://0xdf.gitlab.io/2020/08/10/tunneling-with-chisel-and-ssf-update.html)
cd /home/jumphost
curl -OL https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_amd64.gz
cat chisel_1.7.7_linux_amd64.gz | gzip -d - > chisel
chown jumphost chisel
chmod u+x chisel

# Start SSH Service
/usr/sbin/sshd -D
