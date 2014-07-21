#!/bin/sh

# systemctl start sshd はエラーが発生し起動しない
/usr/sbin/sshd -D &

/usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
