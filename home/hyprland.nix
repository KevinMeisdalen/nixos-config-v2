{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    extraConfig = builtins.readFile ../dotfiles/hypr/hyprland.conf;
  };

  home.file = {
    ".config/hypr/hypridle.conf".source  = ../dotfiles/hypr/hypridle.conf;
    ".config/hypr/hyprlock.conf".source  = ../dotfiles/hypr/hyprlock.conf;
    ".config/hypr/hyprpaper.conf".source = ../dotfiles/hypr/hyprpaper.conf;
    ".config/hypr/misc"                  = { source = ../dotfiles/hypr/misc; recursive = true; };
  };
}
