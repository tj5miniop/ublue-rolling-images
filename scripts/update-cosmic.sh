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
#Install Dependencies for apps such as steam - Enable Multimedia codes
dnf5 -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf5 -y config-manager setopt fedora-cisco-openh264.enabled=1
dnf5 -y update --refresh


# enable mesa-git copr repo - NOTE - will be included in NVIDIA Images - 
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

dnf5 -y clean all

#Regenerate Kernel Modules 
dracut --regenerate-all --force

# Update to Fedora 42
dnf5 -y upgrade --refresh
dnf5 system-upgrade download --releasever=42