#!/bin/bash

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

#Install CachyOS Kernel
echo 'Installing CachyOS kernel'
dnf5 -y copr enable bieszczaders/kernel-cachyos
rpm-ostree override remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra --install kernel-cachyos

echo 'Done!'

dnf5 -y update 
dnf5 -y clean all