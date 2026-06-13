#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux nextcloud-client goose

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket

ln -s /lib64/libbz2.so.1 /lib64/libbz2.so.1.0

# Install Nix
# TODO: This method to get the /nix usable does not work
# Can we create a btrfs subvolume and mount it to /nix instead?
# Is there another way to create a read-write folder (/ is read-only)?
# mkdir -m 777 /var/lib/nix
# ln -s /var/lib/nix /nix
# dnf5 install -y nix
# systemctl enable nix-daemon
dnf5 install -y nix-core

# Justfile extensions
cp /ctx/just/60-custom.just /usr/share/ublue-os/just/
cp /ctx/just/61-screwtos-nix.just /usr/share/ublue-os/just/
