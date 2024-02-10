{ config, pkgs, lib, inputs, nixvim, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "gfernandez";
  home.homeDirectory = "/home/gfernandez";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports= [
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    ./../../modules/home-manager/hyprland.nix
    ./../../modules/home-manager/mako.nix
    ./../../modules/home-manager/alacritty.nix
    ./../../modules/home-manager/nixvim.nix  
    ./../../modules/home-manager/git.nix
    ./../../modules/home-manager/gtk.nix
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    tokyo-night-gtk
    bibata-cursors
    gtk-engine-murrine
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/gfernandez/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  colorScheme = inputs.nix-colors.colorschemes.tokyo-night-dark;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
