{
  imports = [
    ./age.nix
    ./bash.nix
    ./btop.nix
    ./dev.nix
    ./eza.nix
    ./ghostty.nix
    ./git.nix
    ./helix.nix
    ./keepassxc.nix
    ./nh.nix
    ./ssh.nix
    ./yazi.nix
  ];
  home = {
    username = "nixy";
    homeDirectory = "/home/nixy";
  };
  xdg.autostart.enable = true;
  programs = {
    home-manager.enable = true;
    starship.enable = true;
    zoxide.enable = true;
    fzf.enable = true;
    fastfetch.enable = true;
  };
}
