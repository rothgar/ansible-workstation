#!/bin/bash

apts=(git screenkey hexyl bat fd-find bwm-ng net-tools git-extras fzf vim mosh python-pip ripgrep curl wget jq tree docker.io build-essential chrome-gnome-shell fasd default-jdk gthumb htop virtualenv peek gifsicle tmux flatpak gnome-software-plugin-flatpak)
apts_purge=(snapd)
pips=(awscli awslogs aws-sam-cli ansible urllib3 selenium)
user_pips=(cfn_flip)
brews=(packer terraform)
ppas=('peek-developers/stable')

function log() {
	echo "==============================="
	echo "======$1"
	echo "==============================="
}

function session-manager-plugin-install() {
	curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
	sudo dpkg -i session-manager-plugin.deb
	session-manager-plugin && rm -f session-manager-plugin.deb || echo "session manager plugin failed to install"
}

function install-linuxbrew() {
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >>${ZDOTDIR}/.zprofile
}

function setup-ppas() {
	for PPA in ${ppas[@]}; do
		sudo add-apt-repository -y ppa:${PPA}
	done
}

function install-apts() {
  sudo apt install -y "${apts[@]}"
}

function remove-apts() {
  sudo apt purge -y "${apts_purge[@]}"
}

function install-pips() {
	sudo pip install "${pips[@]}"
}

function install-user-pips() {
	pip install --user "${user_pips[@]}"
}

function install-brews() {
	brew install "${brews[@]}"
}

function gnome-tweaks() {
  set -x
	gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
	gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Super>'
	gsettings set org.gnome.desktop.interface show-battery-percentage true
	gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
	gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
	gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"
  set +x
}

if [ ! -f /etc/sudoers.d/$USER ]; then
	log sudoers
	sudo sh -c "echo $USER ALL=\(ALL\) NOPASSWD: ALL >/etc/sudoers.d/$USER"
fi

log setup-ppas
setup-ppas

log install-apts
install-apts

log install-pips
install-pips

log install-user-pips
install-user-pips

log brew
brew --version || install-linuxbrew

log install-brews
install-brews

log session-manager-plugin
session-manager-plugin || session-manager-plugin-install

log gnome-tweaks
gnome-tweaks
