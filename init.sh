#!/bin/bash
REPO="git@github.com:rothgar/ansible-workstation.git"

# install initial packages
yum install -y ansible git zsh

# clone this repo
mkdir -p "${HOME}/src
git clone "${REPO}" "${HOME}"/src/ansible-workstation 

ansible-playbook "${HOME}"/src/ansible-workstation/main.yml
