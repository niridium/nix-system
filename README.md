# GlaciuxOS

Personal NixOS flake — multi-host, multi-user, composable feature flags.

## Structure

```
├── flake.nix              # Flake entry point; exports nixosConfigurations
├── os.nix                 # Defines hosts/users lists, timezone; imports hosts + users + glaciux/nixos.nix + glaciux/home.nix
├── hosts/<name>/          # Per-host NixOS configuration
│   ├── default.nix        # Configures glaciux NixOS modules for this host
│   └── hardware-configuration.nix
├── glaciux/
│   ├── nixos.nix          # Imports shared NixOS modules
│   ├── homeBase.nix       # Extracted shared HM config (nix settings, basic programs)
│   ├── mods/              # Stores NixOS feature modules
│   ├── userMods/          # Stores Home Manager shared modules
│   └── home.nix           # Imports Home Manager modules
├── users/<name>.nix       # Per-user Home Manager config (configures glaciux HM modules)
│   └── default.nix        # Applies userFactory for each user in the users list
└── lib/userFactory.nix    # Wraps each user's HM config
```

## Conventions

- NixOS module config live in **host files** (`hosts/<host>/default.nix`).
- HM module config live in **user files** (`users/<name>.nix`).
- Each host (`hosts/<name>/default.nix`) and user (`users/<name>.nix`) can also configure regular NixOS and Home Manager modules alongside glaciux modules.

## Enabled by default

These modules have `enable = mkDefault true`:

**NixOS** — `appimage`, `fancontrol`, `flatpak`, `hardware`, `nh`, `nixLd`, `oom`, `tailscale`
**Home Manager** — `btop`, `direnv`, `eza`, `foot`, `git`, `keepassxc`, `neovim`, `ssh`


