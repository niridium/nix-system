{pkgs, ...}: {
  imports = [
    ./age.nix
    ./bash.nix
    ./dev.nix
    ./eza.nix
    ./git.nix
    ./helix.nix
    ./keepassxc.nix
    ./nh.nix
    ./ssh.nix
  ];
  home = {
    username = "nixy";
    homeDirectory = "/home/nixy";
    sessionPath = [
      "$HOME/my-scripts"
    ];
    packages = [
      pkgs.nvd
      pkgs.fastfetch
    ];
  };
  xdg.autostart.enable = true;
  programs.home-manager.enable = true;
  programs = {
    starship.enable = true;
    zoxide.enable = true;
    fzf.enable = true;
  };
}
