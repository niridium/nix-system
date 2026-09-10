{pkgs, ...}: {
  home.packages = with pkgs; [
    immich-cli
    gelly
    tutanota-desktop
  ];
  programs.rclone = {
    enable = true;
    remotes = {
      storage-box-1.config = {
        type = "sftp";
        host = "u651371.your-storagebox.de";
        user = "u651371";
        port = 23;
        shell_type = "unix";
        md5sum_command = "md5sum";
        sha1sum_command = "sha1sum";
        known_hosts_file = "/home/callisto/.ssh/known_hosts";
      };
      storage-box-1-crypted = {
        config = {
          type = "crypt";
          remote = "storage-box-1:encrypted";
        };
        secrets = {
          password = "/home/callisto/.config/rclone/storage-box-1-crypted.pswd";
        };
      };
      cronos-box = {
        config = {
          type = "webdav";
          url = "https://webdav.sole-alkaid.ts.net";
          vendor = "other";
        };
        mounts."/" = {
          enable = true;
          mountPoint = "/home/callisto/cronos-box";
        };
      };
    };
  };
  glaciux = {
    firefox.enable = true;
    zed-editor.enable = true;
    qt.enable = true;
    noctalia.enable = true;
    gtk.enable = true;
    cava.enable = true;
    niri.enable = true;
    # umbriel.enable = true;
    beets.enable = false;
  };
}
