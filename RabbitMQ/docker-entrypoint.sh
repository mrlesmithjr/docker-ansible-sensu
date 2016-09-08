#!/bin/bash
set -e

/etc/init.d/rabbitmq-server start
ansible-playbook -i "localhost," -c local /docker-entrypoint.yml
/etc/init.d/rabbitmq-server stop

exec "$@"
