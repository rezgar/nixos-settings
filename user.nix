{ config, pkgs, ... }:

let
    username = "rezgar";
in {
    imports = [
        ./work.nix
        ./desktop/i3/nix
    ];

    time.timeZone = "Europe/Chisinau";
    
    users.users.${username} = {
        isNormalUser = true;
            extraGroups = [
              "wheel" # enable 'sudo'
              "networkmanager"
              "docker"
            ];
    };

    environment.systemPackages = with pkgs; [
        mattermost-desktop
    ];
}
