{ config, pkgs, ... }:
{
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./rofi.nix
    ./kitty.nix
    ./alacritty.nix
    ./nvim.nix
    ./dunst.nix
    ./git.nix
  ];

  home.username = "nix";
  home.homeDirectory = "/home/nix";
  home.stateVersion = "25.11";

  home.file = {
    ".config/btop"        = { source = ../dotfiles/btop;        recursive = true; };
    ".config/cava"        = { source = ../dotfiles/cava;        recursive = true; };
    ".config/fastfetch"   = { source = ../dotfiles/fastfetch;   recursive = true; };
    ".config/yazi"        = { source = ../dotfiles/yazi;        recursive = true; };
    ".config/zathura"     = { source = ../dotfiles/zathura;     recursive = true; };
    ".config/easyeffects" = { source = ../dotfiles/easyeffects; recursive = true; mutable = true; };
    ".config/hyprshell"   = { source = ../dotfiles/hyprshell;   recursive = true; };
    ".config/noisetorch"  = { source = ../dotfiles/noisetorch;  recursive = true; mutable = true; };
    ".config/eza"         = { source = ../dotfiles/eza;         recursive = true; };
    ".config/xsettingsd"  = { source = ../dotfiles/xsettingsd;  recursive = true; };
    ".config/Kvantum"     = { source = ../dotfiles/Kvantum;     recursive = true; };
  };

  gtk = {
    enable = true;
    cursorTheme = { name = "Bibata-Modern-Classic"; size = 24; };
    gtk3.extraConfig = { gtk-application-prefer-dark-theme = 1; };
    gtk4.extraConfig = { gtk-application-prefer-dark-theme = 1; };
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE  = "24";
  };
}
