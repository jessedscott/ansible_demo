#!/bin/bash

ansible web -m ansible.builtin.ping

ansible web -b -m ansible.builtin.dnf -a "name=httpd state=present"

ansible web -b -m ansible.builtin.copy -a "src=files/index.html dest=/var/www/html/index.html"

ansible web -b -m ansible.builtin.service -a "name=httpd state=started enabled=true"

ansible web -b -m ansible.posix.firewalld -a "service=http permanent=true state=enabled immediate=true"

ansible web -b -m ansible.builtin.reboot
