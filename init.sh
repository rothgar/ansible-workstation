#!/bin/bash

# exit if a command fails
set -e

REPO=${REPO:-https://github.com/rothgar/ansible-workstation.git}
CLONE_DIR=${CLONE_DIR:-/home/"${SUDO_USER}"/src/ansible-workstation}

# install initial packages
dnf install -y vim ansible git zsh libselinux-python python2-dnf

# clone this repo
mkdir -p "${CLONE_DIR}"
git clone --recursive "${REPO}" "${CLONE_DIR}"
chown -R ${SUDO_USER}.${SUDO_USER} ${CLONE_DIR}

ANSIBLE_NOCOWS=1 ansible-playbook -u ${SUDO_USER} -i "${CLONE_DIR}"/hosts.template "${CLONE_DIR}"/main.yml

# Install and update vundle
# This should probably be moved to ansible
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install tpm and plugins
# need to automate plugin install
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

