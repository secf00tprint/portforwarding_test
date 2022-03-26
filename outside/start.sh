#! /bin/bash
# SSF
cd /
curl -kLO https://github.com/securesocketfunneling/ssf/releases/download/3.0.0/ssf-linux-x86_64-3.0.0.zip
unzip -o ssf-linux-x86_64-3.0.0.zip

/usr/sbin/sshd -D &
/usr/bin/tail -f /var/log/syslog