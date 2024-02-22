{ pkgs, lib, config, ... }:

{
  programs.alvr = {
    enable = true;
    openFirewall = true;
  };
}
