{ pkgs, config, lib, ...}: 

{
    environment.systemPackages = with pkgs; [
        docker-client
        docker-compose
    ];

    virtualisation.docker.enable = false;
    virtualisation.podman.enable = true;
    virtualisation.podman.dockerSocket.enable = true;
    virtualisation.podman.defaultNetwork.settings.dns_enabled = true;

    virtualisation.docker.rootless = {
        enable = true;
        setSocketVariable = true;
    };

    # virtualisation.arion = {
    #     backend = "docker";
    #     project.name = "minecraft";
    #     services = {
    #         "minecraft".settings.services."minecraft".service = {
    #             image = "itzg/minecraft-server:${"IMAGE_TAG:-java8"}";
    #             ports = [ "25567:25565" ];
    #             restart = "unless-stopped";
    #             environment = { 
    #                 TYPE = "CURSEFORGE";
    #                 ICON = "http://clipart-library.com/new_gallery/57-579791_minecraft-steve-alabama.png";
    #                 MEMORY = "8G";
    #                 MODE = "survival";
    #                 MOTD = "Modded Minecraft. Chill Vibes Only."; 
    #                 EULA = "true";
    #                 ENABLE_RCON = "true";
    #                 RCON_PASSWORD = "6337";
    #                 RCON_PORT = "28016";
    #                 CF_SERVER_MOD = https://cdn.discordapp.com/attachments/1218711629756239952/1218744308039946401/Sporeaverse_3.0_Origins.zip?ex=6608c716&is=65f65216&hm=301fcd2f4a681f3c421f416d1a0a137d46ef94a3ffb690c7a74f354dcb1b69ae&;
    #             };
    #             volumes = "${toString /home/gfernandez }/data/minecraft:/data";
    #         };
    #     };
    #  };
}
