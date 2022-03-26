#! /bin/bash
# SSF
cd /
curl -kLO https://github.com/securesocketfunneling/ssf/releases/download/3.0.0/ssf-linux-x86_64-3.0.0.zip
unzip -o ssf-linux-x86_64-3.0.0.zip

# plink from https://www.chiark.greenend.org.uk/~sgtatham/putty/releases/0.76.html
# you can call it with wine plink.exe
cd /
curl -OkL https://the.earth.li/~sgtatham/putty/0.76/w64/plink.exe
wine plink.exe

# Start SSH Service
/usr/sbin/sshd -D
