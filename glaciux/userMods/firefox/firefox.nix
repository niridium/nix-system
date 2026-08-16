{
  config,
  lib,
  ...
}: let
  profile = lib.map (mod: ./profiles/${mod});
  cfg = config.glaciux.firefox;
in {
  imports = profile ["eros.nix"];
  options.glaciux.firefox.enable = lib.mkEnableOption "firefox";
  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      configPath = "${config.xdg.configHome}/mozilla/firefox";
      languagePacks = ["en-GB" "es-ES"];
      policies = {
        AIControls = {
          Default = {
            Value = "blocked";
            Locked = true;
          };
          Translations = {
            Value = "available";
            Locked = false;
          };
        };
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        CaptivePortal = false;
        Cookies.Behavior = "reject-tracker-and-partition-foreign";
        DisableAccounts = true;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxScreenshots = true;
        DisableFirefoxStudies = true;
        DisableForgetButton = true;
        DisableFormHistory = true;
        DisplayBookmarksToolbar = "never";
        DisplayMenuBar = "never";
        DNSOverHTTPS = {
          Enabled = false;
          Locked = true;
        };
        DontCheckDefaultBrowser = true;
        DownloadDirectory = "\${home}/Downloads";
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Category = "strict";
          BaselineExceptions = true;
          ConvenientExceptions = true;
        };
        EncryptedMediaExtensions = {
          Enabled = false;
          Locked = true;
        };
        ExtensionSettings = let
          mozilla = name: "https://addons.mozilla.org/firefox/downloads/latest/${name}/latest.xpi";
          force = {installation_mode = "force_installed";};
          pin = {default_area = "navbar";};
          pb = {private_browsing = true;};
        in {
          "uBlock0@raymondhill.net" =
            {install_url = mozilla "ublock-origin";}
            // force
            // pin
            // pb;
          "{aecec67f-0d10-4fa7-b7c7-609a2db280cf}" =
            {install_url = mozilla "violentmonkey";}
            // force
            // pin
            // pb;
          "keepassxc-browser@keepassxc.org" =
            {install_url = mozilla "keepassxc-browser";}
            // force
            // pin;
          "addon@darkreader.org" =
            {install_url = mozilla "darkreader";}
            // force
            // pin;
          "pywalfox@frewacom.org" =
            {install_url = mozilla "pywalfox";}
            // force
            // pin;
          "{61a05c39-ad45-4086-946f-32adb0a40a9d}" =
            {install_url = mozilla "linkding-extension";}
            // force
            // pin;
        };
        FirefoxHome = {
          Search = false;
          TopSites = true;
          SponsoredTopSites = false;
          Highlights = false;
          Stories = false;
          Locked = true;
        };
        FirefoxSuggest = {
          WebSuggestions = false;
          SponsorSuggestions = false;
          ImproveSuggest = false;
          Locked = true;
        };
        GenerativeAI.Chatbot = false;
        Homepage = {
          StartPage = "previous-session";
          Locked = true;
        };
        HttpsOnlyMode = "force_enabled";
        NetworkPrediction = true;
        OfferToSaveLogins = false;
        PasswordManagerEnabled = false;
        # PDFjs.Enabled = false;
        PictureInPicture = {
          Enabled = true;
          Locked = true;
        };
        PopupBlocking = {
          Default = true;
          Locked = true;
        };
        PrintingEnabled = false;
        PromptForDownloadLocation = true;
        SearchEngines = {
          PreventInstalls = true;
          Default = "DuckDuckGo";
          Remove = [
            "Bing"
            "Google"
            "Perplexity"
          ];
        };
        SearchSuggestEnabled = false;
        SkipTermsOfUse = true;
        StartDownloadsInTempDirectory = true;
        TranslateEnabled = true;
        UserMessaging = {
          ExtensionRecommendations = false;
          FeatureRecommendations = false;
          UrlbarInterventions = false;
          SkipOnboarding = true;
          MoreFromMozilla = false;
          FirefoxLabs = false;
          Locked = true;
        };
      };
    };
  };
}
