## Install on a new machine

```bash
nix-shell -p git --run "git clone git@github.com:KevinMeisdalen/nixos-config-v2.git ~/nixos-config"
bash ~/nixos-config/install.sh
```

The script will:
1. Ask for a hostname
2. Copy hardware-configuration.nix from /etc/nixos
3. Create a configuration.nix based on meisdalen if none exists
4. Run nixos-rebuild switch

## Rebuild current machine

```bash
cd ~/nixos-config
sudo nixos-rebuild switch --flake .#meisdalen
```

## Adding a new host

1. Create `hosts/<hostname>/configuration.nix`
2. Add the host to `flake.nix`
3. Commit and push
