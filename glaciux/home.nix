{inputs, ...}: {
  imports = [inputs.home-manager.nixosModules.home-manager];
  programs.dconf.enable = true; # Home Manager fails to start if it's disabled
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    backupFileExtension = "bkp";
    sharedModules = [
      {
        nix.settings = {
          substituters = ["https://cache.nixos.org"];
          trusted-public-keys = ["cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="];
        };
        home.stateVersion = "25.11";
        xdg.autostart.enable = true;
        programs = {
          home-manager.enable = true;
          bash.enable = true;
          starship.enable = true;
          zoxide.enable = true;
          fzf.enable = true;
          fastfetch.enable = true;
        };
      }
      ./userMods/firefox/firefox.nix
      ./userMods/niri/niri.nix
      # ./userMods/umbriel/umbriel.nix
      ./userMods/beets.nix
      ./userMods/btop.nix
      ./userMods/cava.nix
      ./userMods/direnv.nix
      ./userMods/eza.nix
      ./userMods/ghostty.nix
      ./userMods/git.nix
      ./userMods/gtk.nix
      ./userMods/helix.nix
      ./userMods/keepassxc.nix
      ./userMods/noctalia.nix
      ./userMods/qt.nix
      ./userMods/screenshots.nix
      ./userMods/ssh.nix
      ./userMods/zedEditor.nix
    ];
  };
}
