#!/bin/bash

ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
  --extra-vars "rabbitmq_host=$RABBITMQ_HOST redis_host=$REDIS_HOST"
sleep 5

exec supervisord -n

tail -f /var/log/sensu/sensu-*.log
