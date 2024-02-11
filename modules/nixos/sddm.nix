{ pkgs, config, ... }:

{
  services.xserver.displayManager.sddm = {
    enabled = true;
    wayland.enable = true;
    theme = "catppuccin";
  };
}
