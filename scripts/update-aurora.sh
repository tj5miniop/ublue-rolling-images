#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Perform a distro-sync (again)
dnf5 -y update
#dnf5 -y distro-sync --allowerasing
dnf5 -y upgrade

#Update akmods by re-enabling repo temporarily
dnf5 -y copr enable ublue-os/akmods 
dnf5 -y update --refresh 
dnf5 -y copr disable ublue-os/akmods

#Add the latest linux firmware!
dnf5 -y copr enable danayer/linux-firmware-git 
dnf5 -y install linux-firmware 
dnf5 -y copr disable danayer/linux-firmware-git

# Install additional Firmware Tweaks - ACER 
dnf5 -y install akmods mokutil 
dnf5 -y copr enable asan/acer-modules
dnf5 -y install acer-wmi-battery akmod-acer-wmi-battery kmod-acer-wmi-battery 

dnf5 -y clean all

#Install Mutter Performance Tweaks
#dnf5 -y copr enable execat/mutter-performance
#dnf5 -y reinstall mutter --repo copr:copr.fedorainfracloud.org:execat:mutter-performance

#Install Librewolf Browser
dnf5 -y remove firefox

#Steam Installation
#Prepare Steam Dependencies
dnf5 -y install pipewire sassc 

# Perform a distro-sync (update) (again)
dnf5 -y update
dnf5 -y upgrade 
#Install Steam - taken from fedora copr repo - cannot be used in tj5-os due to way it's built currently
dnf5 -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf5 -y config-manager setopt fedora-cisco-openh264.enabled=1
dnf5 -y update --refresh

 #Install Steam Package
dnf5 -y install steam --allowerasing

# enable mesa-git copr repo
dnf5 -y copr enable xxmitsu/mesa-git
dnf5 -y update 
dnf5 -y upgrade 
dnf5 -y copr disable xxmitsu/mesa-git

#Install CachyOS Optimizations 
dnf5 -y copr enable bieszczaders/kernel-cachyos-addons
dnf5 -y update
dnf5 -y upgrade
dnf5 -y install uksmd bore-sysctl ananicy-cpp cachyos-ananicy-rules cachyos-settings --allowerasing --skip-unavailable
dnf5 -y copr disable bieszczaders/kernel-cachyos-addons

#Enable lact 
dnf5 -y copr enable ilyaz/LACT
dnf5 -y install lact
# Note - SYSTEMD Unit will have to be enable MANUALLY
dnf5 -y copr disable ilyaz/LACT

dnf5 -y clean all

# install kora icon theme 
cd /tmp
git clone https://github.com/bikass/kora.git
cd kora
cp -r kora /usr/share/icons
cd ../ 
rm -rf kora


#Regenerate Kernel Modules 
dracut --regenerate-all --force