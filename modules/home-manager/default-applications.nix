{pkgs, lib, config, ... }:

{
  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "neovim.desktop" ];
    "application/pdf" = [ "floorp.desktop" ];
    "image/*" = [ "imv.desktop" ];
    "video/png" = [ "mpv.desktop" ];
    "video/jpg" = [ "mpv.desktop"];
    "video/*" = [ "mpv.desktop" ];
    "text/html" = [ "floorp.desktop" ];
    "inode/directory" = [ "thunar.desktop" ];
  };
}
