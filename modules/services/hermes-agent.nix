{config, ...}: {
  age.secrets."hermes-env".file = ../../secrets/hermes-env.age;
  services.hermes-agent = {
    enable = true;
    environmentFiles = [config.age.secrets."hermes-env".path];
    addToSystemPackages = true;

    settings = {
      model = {
        base_url = "https://ollama.sole-alkaid.ts.net/v1";
        default = "";
      };
    };
  };
}
