Repo Info
=========
Build [Docker] image for [Sensu]..

Consuming
---------
```
docker-compose up -d --build
```

Log Into WebUI...  
http://IPorHostName:3000

Configuring Sensu Clients
-------------------------
Head over to https://github.com/mrlesmithjr/ansible-sensu and leverage this
[Ansible] role to provision your [Sensu] clients.

Managing [Sensu] plugins
------------------------
You can easily add/remove [Sensu] plugins by
configuring the following in `playbook.yml`:
```
sensu_plugins:
  - 'json'
  - 'mail'
  - 'redis'
  - 'rest-client'
  - 'sensu-plugin'
  - 'sensu-plugins-cpu-checks'
  - 'sensu-plugins-disk-checks'
  - 'sensu-plugins-memory-checks'
```

Managing [Sensu] checks
-----------------------
You can easily add/remove [Sensu] checks by configuring the following in
`docker-entrypoint.yml`:
```
sensu_checks:
  - name: 'cpu'
    command: 'check-cpu.rb'
    interval: 60
    subscribers:
      - 'test'
      - 'ALL'
    state: 'present'
  - name: 'disk-usage'
    command: 'check-disk-usage.rb -w 80 -c 90'
    interval: 60
    subscribers:
      - 'test'
      - 'ALL'
    state: 'present'
  - name: 'memory'
    command: 'check-memory.rb'
    interval: 60
    subscribers:
      - 'test'
      - 'ALL'
    state: 'present'
  - name: 'memory-percent'
    command: 'check-memory-percent.rb -w 70 -c 80'
    interval: 60
    subscribers:
      - 'test'
      - 'ALL'
    state: 'present'
  - name: 'test'
    command: 'echo -n OK'
    interval: 60
    subscribers:
      - 'test'
      - 'ALL'
state: 'present'
```

License
-------

BSD

Author Information
------------------

Larry Smith Jr.
- [@mrlesmithjr]
- [everythingshouldbevirtual.com]
- [mrlesmithjr@gmail.com]


[Ansible]: <https://www.ansible.com/>
[Docker]: <https://www.docker.com>
[Sensu]: <https://sensuapp.org/>
[@mrlesmithjr]: <https://twitter.com/mrlesmithjr>
[everythingshouldbevirtual.com]: <http://everythingshouldbevirtual.com>
[mrlesmithjr@gmail.com]: <mailto:mrlesmithjr@gmail.com>
