{pkgs, ...}: {
  environment.systemPackages = [pkgs.gearlever];
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
}
