#!/bin/bash

dnf5 -y copr enable bieszczaders/kernel-cachyos
sudo rpm-ostree override remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra --install kernel-cachyos
dnf5 -y copr disable bieszczaders/kernel-cachyos