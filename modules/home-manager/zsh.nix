{pkgs, lib, config, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    # envExtra = ''
    #   export SOMEZSHVARIABLE="something"
    # '';
  };
}
