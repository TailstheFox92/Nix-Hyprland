{ pkgs, config, lib, ... }:

{
  services.xserver = {
    enable = true;

    libinput.enable = true;
    displayManager = {
      sddm = {
        enable = true;
        theme = "catppuccin-sddm-corners";
      };
    };
  };
}
