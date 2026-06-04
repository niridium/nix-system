{
  flake.modules.homeManager.base = {lib, ...}: {
    services.gnome-keyring.enable = lib.mkForce false;
    programs.keepassxc = {
      enable = true;
      autostart = true;
      settings = {
        General = {
          ConfigVersion = 2;
          SingleInstance = true;
          RememberLastDatabases = true;
          NumberOfRememberedLastDatabases = 5;
          RememberLastKeyFiles = true;
          OpenPreviousDatabasesOnStartup = true;
          AutoSaveAfterEveryChange = true;
          AutoReloadOnChange = true;
          AutoSaveOnExit = true;
          AutoSaveNonDataChanges = true;
          BackupBeforeSave = true;
          BackupFilePathPattern = "/home/nixy/Keepass/{DB_FILENAME}.old.kdbx";
          SearchLimitGroup = false;
          MinimizeOnOpenUrl = false;
          HideWindowOnCopy = false;
          MinimizeOnCopy = true;
          MinimizeAfterUnlock = false;
          DropToBackgroundOnCopy = false;
          UseGroupIconOnEntryCreation = true;
          AutoTypeEntryTitleMatch = true;
          AutoTypeEntryURLMatch = true;
          AutoTypeDelay = 25;
          AutoTypeStartDelay = 500;
          AutoTypeHideExpiredEntry = false;
          GlobalAutoTypeKey = 0;
          GlobalAutoTypeModifiers = 0;
          GlobalAutoTypeRetypeTime = 15;
          FaviconDownloadTimeout = 10;
          UpdateCheckMessageShown = false;
        };
        GUI = {
          HideMenubar = false;
          HideToolbar = false;
          MovableToolbar = false;
          HidePreviewPanel = false;
          AlwaysOnTop = false;
          LaunchAtStartup = true;
          ShowTrayIcon = true;
          TrayIconAppearance = "colorful";
          MinimizeToTray = true;
          MinimizeOnStartup = true;
          MinimizeOnClose = true;
          ColorPasswords = false;
          CompactMode = false;
          CheckForUpdates = true;
        };
        Security = {
          ClearClipboard = true;
          ClearClipboardTimeout = 60;
          ClearSearch = false;
          HideNotes = false;
          LockDatabaseIdle = false;
          LockDatabaseMinimize = false;
          LockDatabaseScreenLock = true;
          NoConfirmMoveEntryToRecycleBin = false;
        };
        Browser = {
          Enabled = true;
          UpdateBinaryPath = false;
        };
        PasswordGenerator.Type = 1;
        SSHAgent.Enabled = true;
        FdoSecrets.Enabled = true;
        KeeShare = {
          Active = ''"<?xml version=\"1.0\"?><KeeShare><Active><Import/><Export/></Active></KeeShare>\n"'';
          QuietSuccess = true;
        };
      };
    };
  };
}
