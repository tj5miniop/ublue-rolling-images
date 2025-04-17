#!/bin/bash

dnf5 -y copr enable whitehara/kernel-cachyos-preempt
rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:whitehara:kernel-cachyos-preempt kernel
dnf5 -y copr disable whitehara/kernel-cachyos-preempt