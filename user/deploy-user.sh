#!/bin/sh
set -e

mkdir -p ~/.config
mkdir ~/.config/home-manager
rmdir ~/.config/home-manager

BRANCH=$1
PAT=$(age -d $PAT_DIR/pat.age)

gh auth login --with-token <<< "$PAT"

mkdir -p ~/nix-deploy-temp
cd ~/nix-deploy-temp
gh repo clone tsIgov/nix-users -- -b "$BRANCH"
mv nix-users ~/.config/home-manager
rm -rf ~/nix-deploy-temp
cd ~

nix registry add aether "github:tsIgov/aether-desktop-environment"
nix registry add nix-presets "github:tsIgov/nix-presets"

home-manager switch
