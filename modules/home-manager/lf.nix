{ pkgs, config, ... }:

{

  xdg.configFile."lf/icons".source = ./icons/icons;

  programs.lf = {

    enable = true;

    commands = {
      dragon-out = ''%${pkgs.ripdrag}/bin/ripdrag -a -x "$fx"'';
      editor-open = ''$$EDITOR $F'';
      mkdir = ''
      ''${{
	printf "Directory Name: "
	read DIR
	mkdir $DIR
      }}
      '';
    };

    keybindings = {
      "\\\"" = "";
      o = "";
      c = "mkdir";
      "." = "set hidden!";
      "`" = "mark-load";
      "\\'" = "mark-load";
      "<enter>" = "open";

      do = "dragon-out";

      "g~" = "cd";
      gh = "cd";
      "g/" = "/";

      ee = "editor-open";
      V = ''''$${pkgs.bat}/bin/bat --paging=always --theme=tokyo-night-dark "$f"'';
    };

    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
      previewer = "${pkgs.ctpv}/bin/ctpv";
      cleaner = "${pkgs.ctpv}/bin/ctpvclear";
    };
  };
}
