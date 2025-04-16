#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1
 
dnf5 -y autoremove
dnf5 -y remove kernel* --allowerasing
# enable Kernel CachyOS repository
dnf5 -y copr enable sentry/kernel-blu
rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:sentry:kernel-blu kernel kernel-headers
dnf5 -y copr disable sentry/kernel-blu
#install COSMIC Desktop environment
dnf5 -y copr enable ryanabx/cosmic-epoch
dnf5 -y install cosmic-desktop sddm NetworkManager
dnf5 -y copr disable ryanabx/cosmic-epoch

#Update akmods by re-enabling repo temporarily
dnf5 -y copr enable ublue-os/akmods 
dnf5 -y update --refresh 
dnf5 -y copr disable ublue-os/akmods

#Add the latest linux firmware!
dnf5 -y copr enable danayer/linux-firmware-git 
dnf5 -y install linux-firmware 
dnf5 -y copr disable danayer/linux-firmware-git

dnf5 -y clean all

#Prepare Steam Dependencies
dnf5 -y install pipewire sassc 
 
#Install Dependencies for apps such as steam - Enable Multimedia codes
dnf5 -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf5 -y config-manager setopt fedora-cisco-openh264.enabled=1


# enable mesa-git copr repo - NOTE - will be included in NVIDIA Images - 
dnf5 -y copr enable xxmitsu/mesa-git
dnf5 -y update 
dnf5 -y upgrade 
dnf5 -y copr disable xxmitsu/mesa-git

#Install CachyOS Optimizations 
dnf5 -y copr enable bieszczaders/kernel-cachyos-addons
dnf5 -y install uksmd bore-sysctl cachyos-settings --allowerasing --skip-unavailable
dnf5 -y copr disable bieszczaders/kernel-cachyos-addons

dnf5 -y clean all


#Regenerate Kernel Modules 
dracut --regenerate-all --force

systemctl enable sddm