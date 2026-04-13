{ ... }:
{
  services.dunst = {
    enable     = true;
    configFile = "${../dotfiles/dunst/dunstrc}";
  };

  home.file.".config/dunst/assets" = {
    source    = ../dotfiles/dunst/assets;
    recursive = true;
  };
}
