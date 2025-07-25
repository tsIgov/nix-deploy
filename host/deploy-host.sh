#!/bin/sh
set -e

BRANCH=$1
PAT=$(age -d $PAT_DIR/pat.age)

gh auth login --with-token <<< "$PAT"

mkdir -p ~/nix-deploy-temp
cd ~/nix-deploy-temp
gh repo clone tsIgov/nix-hosts -- -b "$BRANCH"

sudo rm -rf /etc/nixos
sudo mv nix-hosts /etc/nixos
rm -rf ~/nix-deploy-temp
cd ~

sudo nixos-generate-config
sudo nixos-rebuild switch --flake /etc/nixos#$BRANCH