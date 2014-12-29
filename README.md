ansible-ubuntu
==============

Ansible playbook for setting up an ubuntu desktop.

Add desired software installs to roles/common/vars/main.yml

### Usage

Add your own hosts file or run locally with

`ansible-playbook -i hosts.template -K ubuntu.yml -e host=localhost`

The `-e host=` option needs to specify a host that is in your inventory file.
If you exclude the host variable the playbook will default to localhost.

