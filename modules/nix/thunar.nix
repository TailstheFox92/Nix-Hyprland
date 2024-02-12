{ pkgs, config, lib, ... }:

{
  programs.xfconf.enable = true;

  services.gvfs.enable = true;

  services.tumbler.enable = true; # Thumbnail support for images

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
}
