# Changelog: 1.0.0 → 1.1.0 

## Features

- **Neovim module** — Full HM module with `nvim/init.lua` configuration [`a71771d`](https://github.com/niridium/nix-system/commit/a71771d)
- **Foot terminal module** — Terminal emulator with dark/light blur support [`0674835`](https://github.com/niridium/nix-system/commit/0674835) [`288588e`](https://github.com/niridium/nix-system/commit/288588e)
- **Obs-studio module** — Video recording and streaming support [`e3ebc1a`](https://github.com/niridium/nix-system/commit/e3ebc1a)
- **MPD server module** — Music Player Daemon with PipeWire output, extracted as user module [`4400f9e`](https://github.com/niridium/nix-system/commit/4400f9e) [`579cffe`](https://github.com/niridium/nix-system/commit/579cffe)
- **LLama.cpp server** — Vulkan and CUDA packages, localhost binding, 100k context, CPU offloading, flash-attn [`b4dd834`](https://github.com/niridium/nix-system/commit/b4dd834) [`d89077b`](https://github.com/niridium/nix-system/commit/d89077b) [`2d5cefb`](https://github.com/niridium/nix-system/commit/2d5cefb) [`bc0b84a`](https://github.com/niridium/nix-system/commit/bc0b84a) [`5f3e236`](https://github.com/niridium/nix-system/commit/5f3e236) [`01c0fbf`](https://github.com/niridium/nix-system/commit/01c0fbf)
- **Noctalia greeter** — Systemd bar, screenshot system, dock, hot corners, bar widget styling [`b64515f`](https://github.com/niridium/nix-system/commit/b64515f) [`054d0c6`](https://github.com/niridium/nix-system/commit/054d0c6) [`e10c005`](https://github.com/niridium/nix-system/commit/e10c005) [`288588e`](https://github.com/niridium/nix-system/commit/288588e)
- **Umbriel compositor** — Blur, touchpad, drag edge-scroll, wheel workspace switching [`9681974`](https://github.com/niridium/nix-system/commit/9681974) [`dfaad30`](https://github.com/niridium/nix-system/commit/dfaad30)
- **VS Code module** — Editor support [`31239a3`](https://github.com/niridium/nix-system/commit/31239a3)
- **Eclipse IDE** — Eclipse Java enabled for user callisto [`4faeb6b`](https://github.com/niridium/nix-system/commit/4faeb6b)
- **WayvNC** — Remote desktop server [`30416f4`](https://github.com/niridium/nix-system/commit/30416f4)
- **WebDAV module** — New NixOS module for WebDAV shares [`5b0ca14`](https://github.com/niridium/nix-system/commit/5b0ca14)
- **Rclone** — Global install with user configuration [`5ee797c`](https://github.com/niridium/nix-system/commit/5ee797c) [`56e29b9`](https://github.com/niridium/nix-system/commit/56e29b9)
- **Typst tools** — Typesetting support [`02f9728`](https://github.com/niridium/nix-system/commit/02f9728)
- **Draw.io** — Diagramming tool [`b76681d`](https://github.com/niridium/nix-system/commit/b76681d)
- **Java SDK** — Installed globally [`a2eb347`](https://github.com/niridium/nix-system/commit/a2eb347)
- **Gamemode** — Enabled globally [`754e0cc`](https://github.com/niridium/nix-system/commit/754e0cc)
- **Git alias `lg`** — Pretty log in shared git config [`2d1da10`](https://github.com/niridium/nix-system/commit/2d1da10)

## Refactoring

- **Modularize eclipse, extract base HM config** — New `homeBase.nix` separating shared config from per-user configuration [`58096fb`](https://github.com/niridium/nix-system/commit/58096fb)
- **Enable flags on 4 modules** — `system.nix` merged into `nixos.nix`, four modules gained enable flags [`ef1de45`](https://github.com/niridium/nix-system/commit/ef1de45)
- **Disable features-by-default** — Modules now opt-in via `lib.mkDefault` in shared modules [`fd8c2b3`](https://github.com/niridium/nix-system/commit/fd8c2b3)
- **Move to unstable** — Noctalia/greeter moved to nixpkgs modules, each flake input uses its own nixpkgs [`d42475b`](https://github.com/niridium/nix-system/commit/d42475b) [`9a5058c`](https://github.com/niridium/nix-system/commit/9a5058c)

## Bug Fixes

- Fixed broken option on cronos [`e3c40e7`](https://github.com/niridium/nix-system/commit/e3c40e7)
- Prevented system freezing after suspend [`a4dd5b2`](https://github.com/niridium/nix-system/commit/a4dd5b2)
- Allow GTK2 package with deprecation warning [`b884071`](https://github.com/niridium/nix-system/commit/b884071)
- Fixed missing umbriel input configuration [`2f11e36`](https://github.com/niridium/nix-system/commit/2f11e36)
- Fixed missing eza config value [`134cd64`](https://github.com/niridium/nix-system/commit/134cd64)
- Fixed typo in callisto rclone config [`8c82c63`](https://github.com/niridium/nix-system/commit/8c82c63)

## Chores

- **Callisto** — Package refreshes, GNOME calculator, Pi agent [`cfe253d`](https://github.com/niridium/nix-system/commit/cfe253d) [`a9bb28f`](https://github.com/niridium/nix-system/commit/a9bb28f) [`184dfcc`](https://github.com/niridium/nix-system/commit/184dfcc)
- **Cronos** — NVIDIA open driver; IPv4/IPv6 forwarding; disable GUI, gaming, ollama; enable virtualization [`1f2b802`](https://github.com/niridium/nix-system/commit/1f2b802) [`b1a2fd1`](https://github.com/niridium/nix-system/commit/b1a2fd1) [`0c13ab6`](https://github.com/niridium/nix-system/commit/0c13ab6) [`aad462e`](https://github.com/niridium/nix-system/commit/aad462e) [`a3e0dd5`](https://github.com/niridium/nix-system/commit/a3e0dd5)
- **Niri** — Ghostty autostart, configuration updates [`c90b434`](https://github.com/niridium/nix-system/commit/c90b434) [`8b3923a`](https://github.com/niridium/nix-system/commit/8b3923a) [`c9b6863`](https://github.com/niridium/nix-system/commit/c9b6863)
- **Zed editor** — Configuration updates, user-dependent signing key [`fe60952`](https://github.com/niridium/nix-system/commit/fe60952) [`c9b6863`](https://github.com/niridium/nix-system/commit/c9b6863)
- **Firefox** — Remove userChrome.css, trim search engines, add SearXNG, enable PDF editor [`aa102a6`](https://github.com/niridium/nix-system/commit/aa102a6) [`967cf97`](https://github.com/niridium/nix-system/commit/967cf97)

- **Virtualization** — Docker enabled then replaced with Podman/compose, software TPM [`a084dd1`](https://github.com/niridium/nix-system/commit/a084dd1) [`e2de68a`](https://github.com/niridium/nix-system/commit/e2de68a) [`77c3ad6`](https://github.com/niridium/nix-system/commit/77c3ad6)
- **DNS** — Replaced Mullvad with Quad9 [`3da53cb`](https://github.com/niridium/nix-system/commit/3da53cb)
- **Flake.lock** — Dependency updates
- **Keyboard** — Spanish layout, Euro variant, toggle with Alt+Space, default to Qwerty [`e909d38`](https://github.com/niridium/nix-system/commit/e909d38) [`e961f45`](https://github.com/niridium/nix-system/commit/e961f45) [`bbfe137`](https://github.com/niridium/nix-system/commit/bbfe137)
- **Lingering** — Enabled for user amalthea [`a75804e`](https://github.com/niridium/nix-system/commit/a75804e)

## Documentation

- AGENTS.md — Project conventions, refactored to project-specific section [`9445631`](https://github.com/niridium/nix-system/commit/9445631) [`2bb6648`](https://github.com/niridium/nix-system/commit/2bb6648) [`2f6c0d7`](https://github.com/niridium/nix-system/commit/2f6c0d7)
- README.md — Updated to reflect current project state [`280b01b`](https://github.com/niridium/nix-system/commit/280b01b)
