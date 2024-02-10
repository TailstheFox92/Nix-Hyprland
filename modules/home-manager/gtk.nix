{ pkgs, lib, config, ... }:

{
  gtk = {
    enable = true;
    theme.name = "Tokyonight-Dark-BL";
    cursorTheme.name = "Bibata-Modern-Ice";
    iconTheme.name = "Tokyonight-Dark";
  };
}
