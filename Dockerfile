FROM mrlesmithjr/ubuntu-ansible:16.04

MAINTAINER Larry Smith Jr. <mrlesmithjr@gmail.com>

ENV SENSU_VER="0.25.7-1"

# Copy Ansible Playbook
COPY playbook.yml /playbook.yml

COPY docker-entrypoint.yml /docker-entrypoint.yml
COPY config.json.j2 /config.json.j2
COPY uchiwa.json.j2 /uchiwa.json.j2

# Run Ansible playbook
RUN ansible-playbook -i "localhost," -c local /playbook.yml \
  --extra-vars "sensu_ver=$SENSU_VER"

# Cleanup
RUN apt-get -y clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy Docker Entrypoint
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# Expose ports
EXPOSE 3000 4567
