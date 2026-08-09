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
| `vscode/` | VSCode custom CSS/JS (requires Custom CSS and JS Loader extension) |

## Install

```zsh
git clone https://github.com/brandenwagner/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

`install.sh` symlinks each config to the correct location, backs up any existing files as `.bak`, and bootstraps TPM for tmux plugins.

After running, open tmux and press `prefix + I` to install tmux plugins.

## Prerequisites

- [Homebrew](https://brew.sh)
- [Starship](https://starship.rs) — `brew install starship`
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) — `brew install zsh-autosuggestions`
- [eza](https://github.com/eza-community/eza) — `brew install eza`
- [zoxide](https://github.com/ajeetdsouza/zoxide) — `brew install zoxide`
- [fzf](https://github.com/junegunn/fzf) — `brew install fzf`
- [fd](https://github.com/sharkdp/fd) — `brew install fd`
- [fnm](https://github.com/Schniz/fnm) — `brew install fnm`
- [direnv](https://direnv.net) — `brew install direnv`
- [Neovim](https://neovim.io) — `brew install neovim` (0.11+, for LazyVim)
- [tmux](https://github.com/tmux/tmux) — `brew install tmux` (3.4+, for `extended-keys`)
- [Podman](https://podman.io) — `brew install podman`, aliased over `docker`/`docker-compose`
- [Ghostty](https://ghostty.org) — terminal emulator

### Fonts

Ghostty is configured for `JetBrains Mono`, and the tmux status bar uses Nerd
Font glyphs. Install the patched build so both render:

```zsh
brew install --cask font-jetbrains-mono-nerd-font
```

If you install the Nerd Font variant, set `font-family = JetBrainsMono Nerd Font`
in `ghostty/config`. (On a Nix/home-manager machine the font may already be
provided outside `~/Library/Fonts` — check before installing a second copy.)
