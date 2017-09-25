#!/bin/bash
set -e
if [ -f "$HOST_ETC/hostname" ]
then
    HOSTNAME="$(cat $HOST_ETC/hostname)"
elif [ -f "$HOST_ETC/HOSTNAME" ]
then
    HOSTNAME=$(cat $HOST_ETC/HOSTNAME)
else
    HOSTNAME=$(hostname)
fi
sed -i "s/  hostname = .*/  hostname = $HOSTNAME/" /etc/telegraf/telegraf.conf
#hostname -F /etc/hostname
export HOSTNAME
if [ "${1:0:1}" = '-' ]; then
    set -- telegraf "$@"
fi

exec "$@"
