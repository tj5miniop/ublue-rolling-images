#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1


#Update akmods by re-enabling repo temporarily - not needed for bazzite
dnf5 -y copr enable ublue-os/akmods 
dnf5 -y update 
dnf5 -y copr disable ublue-os/akmods

#Add the latest linux firmware! - not needed for bazzite (Might be needed for bleeding edge Bazzite, which is what this repo is building)
dnf5 -y copr enable danayer/linux-firmware-git 
dnf5 -y install linux-firmware 
dnf5 -y copr disable danayer/linux-firmware-git 

dnf5 -y clean all
dnf5 -y update
dnf5 -y upgrade

# enable mesa-git copr repo
dnf5 -y copr enable xxmitsu/mesa-git
dnf5 -y update 
dnf5 -y upgrade 
dnf5 -y copr disable xxmitsu/mesa-git


dnf5 -y copr enable bieszczaders/kernel-cachyos-addons
dnf5 -y update
dnf5 -y upgrade
dnf5 -y install uksmd bore-sysctl ananicy-cpp cachyos-ananicy-rules cachyos-settings --allowerasing
dnf5 -y copr disable bieszczaders/kernel-cachyos-addons


#Install Gaming RPMs (Will soon be migrated into a script) (Bottles will be kept as a flatpak)
cd /tmp
https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.16.1/Heroic-2.16.1-linux-x86_64.rpm -O heroic.rpm
dnf 5 -y install heroic.rpm 


dnf5 -y remove @kde-desktop sddm --allowerasing
dnf5 -y remove cockpit qemu libvirt --allowerasing
dnf5 -y clean all

systemctl disable sddm

dnf5 -y copr enable ryanabx/cosmic-epoch 
dnf5 -y install cosmic-desktop
dnf5 -y install cosmic-greeter
dnf5 -y copr disable ryanabx/cosmic-epoch 

dfn5 -y cleanall