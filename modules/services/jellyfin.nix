{pkgs, ...}: {
  services.jellyfin = {
    enable = true;
    dataDir = "/home/nixy/storage/services/jellyfin";
    user = "nixy";
    group = "users";
  };
  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
