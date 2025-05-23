#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1
dnf5 -y update
dnf5 -y upgrade

# enable mesa-git copr repo
dnf5 -y copr enable xxmitsu/mesa-git
dnf5 -y update 
dnf5 -y upgrade 
dnf5 -y copr disable xxmitsu/mesa-git

#Install Gaming RPMs (Will soon be migrated into a script) (Bottles will be kept as a flatpak)
cd /tmp
wget https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.16.1/Heroic-2.16.1-linux-x86_64.rpm -O heroic.rpm
dnf 5 -y install heroic.rpm 
