#!/bin/bash
REPO="git@github.com:rothgar/ansible-workstation.git"

# install initial packages
yum install -y ansible git zsh

# clone this repo
mkdir -p /home/"${SUDO_USER}/src
git clone "${REPO}" /home/"${SUDO_USER}"/src/ansible-workstation 

ansible-playbook /home/"${SUDO_USER}"/src/ansible-workstation/main.yml
