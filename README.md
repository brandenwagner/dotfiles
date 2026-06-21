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
- [Ghostty](https://ghostty.org) — terminal emulator
- JetBrains Mono Nerd Font — required by Ghostty and tmux status bar
