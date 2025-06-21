#!/bin/bash

set -euo pipefail

# ensure ~/.ssh exists and trust GitHub’s key
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keyscan github.com >> ~/.ssh/known_hosts

if ! command -v chezmoi >/dev/null; then
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:xdoddyx/dotfiles.git
fi

exit 0