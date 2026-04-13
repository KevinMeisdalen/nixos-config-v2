#!/usr/bin/env bash
set -e

REPO="git@github.com:KevinMeisdalen/nixos-config-v2.git"
CONFIG_DIR="$HOME/nixos-config"

# Ask for hostname
read -p "Enter hostname for this machine: " HOSTNAME

# Clone repo
nix-shell -p git --run "git clone $REPO $CONFIG_DIR"

# Create host dir if it doesn't exist
mkdir -p "$CONFIG_DIR/hosts/$HOSTNAME"

# Copy hardware config
cp /etc/nixos/hardware-configuration.nix "$CONFIG_DIR/hosts/$HOSTNAME/"

# If no configuration.nix exists for this host, copy from meisdalen as a base
if [ ! -f "$CONFIG_DIR/hosts/$HOSTNAME/configuration.nix" ]; then
  cp "$CONFIG_DIR/hosts/meisdalen/configuration.nix" "$CONFIG_DIR/hosts/$HOSTNAME/configuration.nix"
  echo "⚠️  Edit $CONFIG_DIR/hosts/$HOSTNAME/configuration.nix before rebuilding!"
  echo "   Change hostname, remove/add hardware specific options (nvidia etc)"
  read -p "Press enter when done editing..."
fi

# Build
cd "$CONFIG_DIR"
sudo nixos-rebuild switch --flake ".#$HOSTNAME"

echo "✅ Done!"
