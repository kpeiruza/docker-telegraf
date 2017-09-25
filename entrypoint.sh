#!/bin/bash
set -e

#hostname -F /etc/hostname
export HOSTNAME=$(cat /etc/hostname)
if [ "${1:0:1}" = '-' ]; then
    set -- telegraf "$@"
fi

exec "$@"
