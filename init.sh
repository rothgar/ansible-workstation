#!/bin/bash
REPO="git@github.com:rothgar/ansible-workstation.git"

# install ansible
yum install -y ansible

# clone this repo
mkdir -p "${HOME}/src
git clone "${REPO}" "${HOME}"/src/ansible-workstation 

ansible-playbook "${HOME}"/src/ansible-workstation/main.yml
