ansible-ubuntu
==============

Ansible playbook for setting up an ubuntu desktop.

Add desired software installs to roles/common/vars/main.yml

### Usage

Add your own hosts file or run locally with

`ansible-playbook -i hosts.template -K ubuntu.yml`
