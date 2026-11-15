#!/bin/sh
# Gera a ISO. Requer Debian/Ubuntu com `live-build` instalado e permissão de root.
#   sudo apt install live-build debootstrap debian-archive-keyring
set -eu
cd "$(dirname "$0")/.."
sh scripts/fetch-app.sh

lb config \
  --distribution trixie \
  --parent-distribution trixie \
  --mirror-bootstrap http://deb.debian.org/debian/ \
  --mirror-chroot http://deb.debian.org/debian/ \
  --mirror-binary http://deb.debian.org/debian/ \
  --parent-mirror-bootstrap http://deb.debian.org/debian/ \
  --parent-mirror-chroot http://deb.debian.org/debian/ \
  --parent-mirror-binary http://deb.debian.org/debian/ \
  --security true \
  --parent-mirror-chroot-security http://security.debian.org/debian-security/ \
  --parent-mirror-binary-security http://security.debian.org/debian-security/ \
  --mirror-chroot-security http://security.debian.org/debian-security/ \
  --mirror-binary-security http://security.debian.org/debian-security/ \
  --architectures amd64 \
  --archive-areas "main contrib non-free non-free-firmware" \
  --binary-images iso-hybrid \
  --bootappend-live "boot=live components quiet splash=0" \
  --debian-installer none \
  --apt-recommends false \
  --apt-indices false \
  --memtest none \
  --compression xz \
  --iso-application "Magrathea OS" \
  --iso-volume "MAGRATHEA_OS"

lb build
sha256sum live-image-amd64.hybrid.iso > live-image-amd64.hybrid.iso.sha256
