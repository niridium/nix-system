{
  programs.opencode = {
    enable = true;
    settings = {
      provider = {
        ollama = {
          npm = "@ai-sdk/openai-compatible";
          name = "Ollama";
          options.baseURL = "https://ollama.sole-alkaid.ts.net/v1";
        };
      };
    };
  };
}
