{pkgs, lib, config, ... }:

{
  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "neovim.desktop" ];
    "application/pdf" = [ "firefox.desktop" ];
    "image/*" = [ "imv.desktop" ];
    "video/png" = [ "mpv.desktop" ];
    "video/jpg" = [ "mpv.desktop"];
    "video/*" = [ "mpv.desktop" ];
    "text/html" = [ "firefox.desktop" ];
    "inode/directory" = [ "thunar.desktop" ];
  };
}
