{
  lib,
  inputs,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];
  programs.dconf.enable = true; # Home Manager fails to start if it's disabled
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    backupFileExtension = "bkp";
    sharedModules = [
      ./homeBase.nix
      {
        glaciux = {
          btop.enable = lib.mkDefault true;
          direnv.enable = lib.mkDefault true;
          eza.enable = lib.mkDefault true;
          foot.enable = lib.mkDefault true;
          git.enable = lib.mkDefault true;
          keepassxc.enable = lib.mkDefault true;
          neovim.enable = lib.mkDefault true;
          ssh.enable = lib.mkDefault true;
        };
      }
      ./userMods/beets.nix
      ./userMods/btop.nix
      ./userMods/cava.nix
      ./userMods/direnv.nix
      ./userMods/eclipse.nix
      ./userMods/eza.nix
      ./userMods/firefox/firefox.nix
      ./userMods/foot.nix
      ./userMods/ghostty.nix
      ./userMods/git.nix
      ./userMods/gtk.nix
      ./userMods/helix.nix
      ./userMods/keepassxc.nix
      ./userMods/mpd.nix
      ./userMods/noctalia/noctalia.nix
      ./userMods/niri/niri.nix
      ./userMods/nvim/nvim.nix
      ./userMods/obsStudio.nix
      ./userMods/qt.nix
      ./userMods/ssh.nix
      ./userMods/umbriel/umbriel.nix
      ./userMods/vscode.nix
      ./userMods/zedEditor.nix
    ];
  };
}
