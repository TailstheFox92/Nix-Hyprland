{ inputs, pkgs, ... }: let

# Pin JRE Versions used by instances
jre8 = pkgs.temurin-bin-8;
jre17 = pkgs.temurin-bin-17;

in {
    imports = [ inputs.mms.module ];

    services.modded-minecraft-servers = {
        # This is mandatory, sorry.
        eula = true;
        instances = {
            spore = {
                enable = false;
                jvmMaxAllocation = "8G";
                jvmInitialAllocation = "2G";
                jvmPackage = jre17;
                serverConfig = {
                    server-port = 25565;
                    rcon-port = 25575;
                    motd = "If I need your body, I'll fuck it";
                    white-list = true;
                    spawn-protection = 0;
                    max-tick-time = 5 * 60 * 1000;
                    allow-flight = true;
                    difficulty = 2;
                    rcon-password = "6337";
                };
            };
            valhesia = {
                enable = true;
                jvmMaxAllocation = "8G";
                jvmInitialAllocation = "2G";
                jvmPackage = jre8;
                serverConfig = {
                    server-port = 25565;
                    rcon-port = 25575;
                    motd = "If I need your body, I'll fuck it";
                    white-list = true;
                    spawn-protection = 0;
                    max-tick-time = 5 * 60 * 1000;
                    allow-flight = true;
                    difficulty = 2;
                    rcon-password = "6337";
                };
            };
        };
    };
}
