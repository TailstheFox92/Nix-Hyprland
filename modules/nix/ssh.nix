{ config, pkgs, ...}:

{
    services.openssh = {
        enable = true;
#       require public key authentication for better security
        settings.PasswordAuthentication = false;
        settings.KbdInteractiveAuthentication = true;
    };

    users.users."gfernandez".openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDcizxGnOXrqoqtngKDL8Agur0mJH9BgD80asT9UerZm"
    ];
}
