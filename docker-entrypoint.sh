#!/bin/bash

ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
  --extra-vars "rabbitmq_host=$RABBITMQ_HOST redis_host=$REDIS_HOST"
sleep 5
/etc/init.d/sensu-server start
/etc/init.d/sensu-api start
/etc/init.d/sensu-client start
/etc/init.d/uchiwa start

tail -f /var/log/sensu/sensu-*.log
