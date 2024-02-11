{ pkgs, config, ... }:

{
  services.xserver.displayManager.sddm.settings = {
    enabled = true;
    wayland.enable = true;
    theme = "catppuccin";
  };
}
