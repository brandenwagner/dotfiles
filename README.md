# dotfiles

Personal dotfiles for macOS. Managed with symlinks via `install.sh`.

## Contents

| Directory | Config for |
|-----------|-----------|
| `zsh/` | Zsh (`.zshrc`) |
| `tmux/` | tmux + TPM plugins |
| `nvim/` | Neovim (LazyVim) |
| `nvim-notes/` | Neovim notes profile (Obsidian) |
| `starship/` | Starship prompt |
| `ghostty/` | Ghostty terminal |
| `ssh/` | SSH client config |
| `herdr/` | herdr terminal workspace manager (`config.toml`) |
| `vscode/` | VSCode custom CSS/JS (requires Custom CSS and JS Loader extension) |

## Install

```zsh
git clone https://github.com/brandenwagner/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

`install.sh` symlinks each config to the correct location, backs up any existing files as `.bak`, bootstraps TPM for tmux plugins, and installs the herdr agent integrations. It is idempotent — re-running reports `ok:` and changes nothing.

After running, open tmux and press `prefix + I` to install tmux plugins.

### herdr

The herdr binary comes from `nix-config`. Its agent hooks
(`~/.claude/hooks/herdr-agent-state.sh`, `~/.codex/…`) are **not** tracked here:
herdr generates and version-stamps them itself, so committing them would pin a
version the tool expects to upgrade. `install.sh` runs
`herdr integration install` for any target that reports `not installed`, and
skips the rest.

The settings file lives here as `herdr/config.toml`, and `zshrc` exports
`HERDR_CONFIG_PATH` to point at it — the same pattern `STARSHIP_CONFIG` uses.
It is reached by env var rather than a symlink because herdr keeps its sockets,
logs and session state in `~/.config/herdr/` too, so that directory can't be
linked wholesale. Anything herdr writes back lands directly in the repo, where
`git status` will show it.

Because the path comes from `zshrc`, herdr must be launched from a shell that
sourced it; started from anywhere else it falls back to
`~/.config/herdr/config.toml`. Check with `herdr config check` and
`echo $HERDR_CONFIG_PATH`.

## Relationship to `nix-config`

These two repos split along one rule: **nix installs programs, dotfiles
configures them.** Nothing is configured in both places.

On the nix hosts (`ares`, `poseidon`, `zeus`), the tools below come from
`shared/home.nix` in [nix-config](https://github.com/brandenwagner/nix-config),
not from Homebrew — `which starship` resolves to
`/etc/profiles/per-user/$USER/bin`, and `brew list --formula` is empty. This
repo still owns every config file: `tmux/`, `nvim/`, `ghostty/`, `ssh/`,
`zsh/`, and the starship theme. nix-config installs the starship binary but
deliberately carries no starship settings.

Elsewhere (a plain Mac, or a server like `astraeus`) nothing is preinstalled,
so use the standalone list.

## Prerequisites

### On a nix host

Already provided by `nix-config`: starship, tmux, neovim, fzf, fd, eza,
zoxide, bat, delta, gh, git, lazygit, ripgrep, zsh-autosuggestions.

Not provided by nix, install separately if you want them:

- [Ghostty](https://ghostty.org) — terminal emulator, installed as an `.app`
- [Podman](https://podman.io) — aliased over `docker`/`docker-compose`; the
  official installer puts it in `/opt/podman/bin`, which `zshrc` adds to `PATH`
- [fnm](https://github.com/Schniz/fnm) and [direnv](https://direnv.net) —
  referenced by `zshrc` but currently installed on none of the hosts. Both
  lookups are guarded by `command -v`, so their absence is harmless.

### Standalone (no nix)

- [Homebrew](https://brew.sh)
- [Starship](https://starship.rs) — `brew install starship`
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) — `brew install zsh-autosuggestions`
- [eza](https://github.com/eza-community/eza) — `brew install eza`
- [zoxide](https://github.com/ajeetdsouza/zoxide) — `brew install zoxide`
- [fzf](https://github.com/junegunn/fzf) — `brew install fzf` (0.48+, for `fzf --zsh`)
- [fd](https://github.com/sharkdp/fd) — `brew install fd`
- [fnm](https://github.com/Schniz/fnm) — `brew install fnm`
- [direnv](https://direnv.net) — `brew install direnv`
- [Neovim](https://neovim.io) — `brew install neovim` (0.11+, for LazyVim)
- [tmux](https://github.com/tmux/tmux) — `brew install tmux` (3.4+, for `extended-keys`)
- [Podman](https://podman.io) — `brew install podman`
- [Ghostty](https://ghostty.org) — terminal emulator

### Fonts

Ghostty is configured for `JetBrains Mono`, and the tmux status bar uses Nerd
Font glyphs. Install the patched build so both render:

```zsh
brew install --cask font-jetbrains-mono-nerd-font
```

If you install the Nerd Font variant, set `font-family = JetBrainsMono Nerd Font`
in `ghostty/config`. `nix-config` does not currently install any font, and
`~/Library/Fonts/HomeManager` is empty on `ares`, so this is a manual step on
every host.
