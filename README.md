ansible-workstation
==============

Ansible playbook for setting up an ubuntu or fedora workstation.

Add desired software installs to roles/common/vars/main.yml

Or use one of the specific fedora/ubuntu/gnome folders to tweek settings.

### Usage

Add your own hosts file or run locally with

`ansible-playbook -i hosts.template -K main.yml`

The `-e host=` option can be used to specify a host that is in your inventory file.
If you exclude the host variable the playbook will default to localhost.

