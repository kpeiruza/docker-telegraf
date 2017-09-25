#!/bin/bash
set -e
if [ -f "$HOST_ETC/hostname" ]
    HOSTNAME="$(cat $HOST_ETC/hostname)"
elif [ -f "$HOST_ETC/HOSTNAME" ]
    HOSTNAME=$(cat $HOST_ETC/HOSTNAME)
else
    HOSTNAME=$(hostname)
fi
sed -i 's/hostname = .*/hostname = $HOSTNAME/' /etc/telegraf/telegraf.conf
#hostname -F /etc/hostname
export HOSTNAME
if [ "${1:0:1}" = '-' ]; then
    set -- telegraf "$@"
fi

exec "$@"
