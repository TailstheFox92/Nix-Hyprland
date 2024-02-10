{pkgs, lib, config, ... }:

{
  # Git Configuration
  programs.git = {
    enable = true;
    userName = "Gabriel Fernandez";
    userEmail = "gfernandez@mailfence.com";
  };
}
