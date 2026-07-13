{
  flake-file.inputs = {
    impermanence = {
      url = "github:nix-community/impermanence";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  flake.modules.nixos.impermanence = {
    fileSystems."/persistent".neededForBoot = true;
    users.mutableUsers = false;
    environment.persistence."/persistent" = {
      enable = true;
      hideMounts = true;
      directories = [
        "/var/log"
        "/var/lib/nixos"
        "/var/lib/regreet"
        "/var/lib/systemd"
        "/var/lib/tailscale"
        "/var/lib/fprint"
        "/var/lib/bluetooth"
      ];
      files = [
        "/etc/machine-id"
        "/etc/NetworkManager/system-connections"
      ];
    };
  };
  flake.modules.homeManager.impermanence = {
    home.persistence."/persistent" = {
      directories = [
        "Documents"
        "Downloads"
        "Pictures"
        "Persist"
        "Notes"
        "Keepass"
        "nixdev"
        "nixos"
        ".ssh"
        ".bash_history"
        ".librewolf/default"
        ".config/librewolf"
      ];
      files = [
        ".config/sops/age/keys.txt"
      ];
    };
  };
}
