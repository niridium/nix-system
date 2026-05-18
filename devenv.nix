{pkgs, ...}: {
  packages = with pkgs; [
    git
    # git-conventional-commits
    # pre-commit
  ];

  languages.nix.enable = true;

  git-hooks.hooks = {
    alejandra.enable = true;
  };
}
