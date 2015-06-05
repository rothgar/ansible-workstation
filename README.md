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

### If you're crazy

You can set up a system completely from scratch using the init.sh script. By default it will use my repo/home directory but you can change that with

```
export REPO=http://path/to/your/ansible/repo
export CLONE_DIR=/where/you/want/files
curl -k -L https://raw.githubusercontent.com/rothgar/ansible-workstation/master/init.sh | sudo bash```
