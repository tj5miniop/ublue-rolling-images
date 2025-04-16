#!/bin/bash

# Exit on error, undefined vars, and pipe failure
set -euo pipefail

echo 'Downloading Bazzite Kernel'

cd /tmp && mkdir kernel-tmp
cd kernel-tmp

echo 'Downloading packages to directory' 

wget https://github.com/bazzite-org/kernel-bazzite/releases/download/6.13.9-103/kernel-6.13.9-103.bazzite.fc42.x86_64.rpm
wget https://github.com/bazzite-org/kernel-bazzite/releases/download/6.13.9-103/kernel-core-6.13.9-103.bazzite.fc42.x86_64.rpm
wget https://github.com/bazzite-org/kernel-bazzite/releases/download/6.13.9-103/kernel-devel-6.13.9-103.bazzite.fc42.x86_64.rpm
wget https://github.com/bazzite-org/kernel-bazzite/releases/download/6.13.9-103/kernel-devel-matched-6.13.9-103.bazzite.fc42.x86_64.rpm
wget https://github.com/bazzite-org/kernel-bazzite/releases/download/6.13.9-103/kernel-modules-6.13.9-103.bazzite.fc42.x86_64.rpm
wget https://github.com/bazzite-org/kernel-bazzite/releases/download/6.13.9-103/kernel-modules-core-6.13.9-103.bazzite.fc42.x86_64.rpm
wget https://github.com/bazzite-org/kernel-bazzite/releases/download/6.13.9-103/kernel-modules-extra-6.13.9-103.bazzite.fc42.x86_64.rpm 
wget https://github.com/bazzite-org/kernel-bazzite/releases/download/6.13.9-103/kernel-modules-internal-6.13.9-103.bazzite.fc42.x86_64.rpm
wget https://github.com/bazzite-org/kernel-bazzite/releases/download/6.13.9-103/kernel-uki-virt-6.13.9-103.bazzite.fc42.x86_64.rpm
wget https://github.com/bazzite-org/kernel-bazzite/releases/download/6.13.9-103/kernel-uki-virt-addons-6.13.9-103.bazzite.fc42.x86_64.rpm

ls -al 

echo 'installing kernel'

dnf5 -y install *.rpm --allowerasing
echo 'Done!'

cd ../
rm -rf kernel-tmp