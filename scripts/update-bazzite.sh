#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1
dnf5 -y update
dnf5 -y upgrade

#Bazzite needs minimal tweaks as it is slighly more bleeding-edge than the other images 

# enable mesa-git copr repo
dnf5 -y copr enable danayer/mesa-git
dnf5 -y update 
dnf5 -y upgrade 
dnf5 -y copr disable danayer/mesa-git

# enable vulkan-git copr repo
dn5 -y copr enable danayer/vulkan-git
dnf5 -y update 
dnf5 -y upgrade 
dnf5 -y copr disable danayer/vulkan-git
