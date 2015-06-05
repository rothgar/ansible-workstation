#!/bin/bash
REPO="git@github.com:rothgar/ansible-workstation.git"
CLONE_DIR=/home/"${SUDO_USER}"/src/ansible-workstation

# install initial packages
yum install -y ansible git zsh

# clone this repo
mkdir -p "${CLONE_DIR}"
git clone "${REPO}" "${CLONE_DIR}"

ANSIBLE_NOCOWS=1 ansible-playbook -u ${SUDO_USER} -i "${CLONE_DIR}"/hosts.template "${CLONE_DIR}"/main.yml
