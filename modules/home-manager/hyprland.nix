{ pkgs, lib, config, ... }:

let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.swww}/bin/swww init &

    sleep 1

    ${pkgs.swww}/bin/swww img ${./wallpapers/CyberpunkRuins.jpg} &
  '';
in
{
  wayland.windowManager.hyprland.enable = true;
  # wayland.windowManager.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  wayland.windowManager.hyprland.settings = {
    
    # Setup Monitors as defined in home.nix
    monitor = map
      (m:
        let
	  resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
	  position = "${toString m.x}x${toString m.y}";
	  scale = "${toString m.scale}";
	in
	"${m.name},${if m.enabled then "${resolution},${position},${scale}" else "disable"}"
      )
      (config.monitors);

    general = with config.colorScheme.palette; {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 2;

      "col.active_border" = "rgba(${base0E}ff) rgba(${base09}ff) 60deg";
      "col.inactive_border" = "rgba(${base00}ff)";

      layout = "master";
    };

    decoration = {
      rounding = 10;
      blur = {
        enabled = true;
	size = 3;
	passes = 1;
      };

      drop_shadow = "yes";
      shadow_range = 4;
      shadow_render_power = 3;
      shadow_offset = "0 5";
      "col.shadow" = "rgba(00000099)";
    };

    animations = {
      enabled = "yes";
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

      animation = [
      "windows, 1, 7, myBezier"
      "windowsOut, 1, 7, default, popin 80%"
      "border, 1, 10, default"
      "borderangle, 1, 8, default"
      "fade, 1, 7, default"
      "workspaces, 1, 6, default"
      ];
    };

    master = {
      new_is_master = true;
    };

    gestures = {
      workspace_swipe = "on";
    };

    "$mod" = "SUPER";
    bind = [
      #"$mod, F, exec, firefox"
      ", Print, exec, grimblast copy area"
      "$mod, return, exec, alacritty" # Launch Terminal
      "$mod, Q, killactive,"
      "$mod SHIFT, M, exit,"
      "$mod SHIFT, P, exec, rofi -show p -modi p:'rofi-power-menu'"
      "$mod, T, exec, thunar" # File Manager
      "$mod, F, togglefloating,"
      "$mod SHIFT, F, fullscreen"
      "$mod, D, exec, rofi -show drun -show-icons" # App Launcher
      "$mod SHIFT, L, exec, swaylock -f -i ${./wallpapers/CyberpunkRuins.jpg}" # Lock Screen
      "$mod, V, exec, quickemu --vm windows-10.conf --display spice"
      #"$mod SHIFT, S, exec, grim -g $(slurp) - | swappy -f -" #screenshot

      # keyboard backlight
      ", xf86KbdBrightnessUp, exec, brightnessctl -d *::kbd_backlight set +33%"
      ", xf86KbdBrightnessDown, exec, brightnessctl -d *::kbd_backlight set 33%-"

      # screen brightness
      ", XF86MonBrightnessUp, exec, brightnessctl s +5% -d intel_backlight"
      ", XF86MonBrightnessDown, exec, brightnessctl s 5%- -d intel_backlight"

      # keyboard media keys
      ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
      ", XF86AudioLowerVolume, exec, pamixer -d 5"
      ", XF86AudioMicMute, exec, pamixer --default-source -m"
      ", XF86AudioMute, exec, pamixer -t"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"

      # Move focus with Mod + arrow keys
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # Switch workspaces with mod + [0-9]
      # "$mod, 1, workspace, 1"
      # "$mod, 2, workspace, 2"
      # "$mod, 3, workspace, 3"
      # "$mod, 4, workspace, 4"
      # "$mod, 5, workspace, 5"
      # "$mod, 6, workspace, 6"
      # "$mod, 7, workspace, 7"
      # "$mod, 8, workspace, 8"
      # "$mod, 9, workspace, 9"
      # "$mod, 0, workspace, 10"

      # Move active window to a workspace with mod + SHIFT + [0-9]
      # "$mod SHIFT, 1, movetoworkspace, 1"
      # "$mod SHIFT, 2, movetoworkspace, 2"
      # "$mod SHIFT, 3, movetoworkspace, 3"
      # "$mod SHIFT, 4, movetoworkspace, 4"
      # "$mod SHIFT, 5, movetoworkspace, 5"
      # "$mod SHIFT, 6, movetoworkspace, 6"
      # "$mod SHIFT, 7, movetoworkspace, 7"
      # "$mod SHIFT, 8, movetoworkspace, 8"
      # "$mod SHIFT, 9, movetoworkspace, 9"
      # "$mod SHIFT, 0, movetoworkspace, 10"

      # Example special workspaces (scratchpad)
      "$mod, S, togglespecialworkspace, magic"
      "$mod SHIFT, S, movetoworkspace, special:magic"

      # Scroll through existing workspaces with mod + Scroll
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"
    ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
    bindm = [
      # mouse movements
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod ALT, mouse:272, resizewindow"
    ];

    exec-once = ''${startupScript}/bin/start'';
  };
}

