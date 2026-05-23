{
  age.secrets."opencode-web".file = ../../secrets/opencode-web.age;
  programs.opencode = {
    enable = true;
    web = {
      enable = true;
      environmentFile = null;
      extraArgs = [
        "--hostname"
        "0.0.0.0"
        "--port"
        "4096"
      ];
    };
  };
}
