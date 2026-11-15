#!/bin/sh
# Baixa o .deb do Magrathea Writer na versão fixada em app-version.txt.
set -eu
cd "$(dirname "$0")/.."
TAG="$(tr -d '[:space:]' < app-version.txt)"
rm -f config/packages.chroot/*.deb
gh release download "$TAG" \
  --repo rhuanlima/magrathea-writer \
  --pattern '*_amd64.deb' \
  --dir config/packages.chroot
ls -l config/packages.chroot
