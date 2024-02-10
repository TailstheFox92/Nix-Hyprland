{ inputs, pkgs, lib, ... }:

{
  options = {
    wallpaper = lib.mkOption {
      default = ./wallpapers/CyberpunkRuins.jpg;
      type = lib.types.path;
      descriptions = ''
        Path to your wallpapers
      '';
    }; 
  };

  config = {
    home.file."paperChooser.sh".source =
      let
        script = pkgs.writeShellScriptBin "paperChooser.sh" ''
	  ${pkgs.swww}/bin/swww img ${config.wallpaper}
	'';
      in
      "${script}/bin/paperChooser.sh";
  };
}
