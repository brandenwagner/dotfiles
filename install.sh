#!/usr/bin/env zsh
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

symlink() {
    local src="$1" dst="$2"
    mkdir -p "$(dirname "$dst")"
    if [[ -e "$dst" && ! -L "$dst" ]]; then
        echo "  backup: $dst -> $dst.bak"
        mv "$dst" "$dst.bak"
    fi
    ln -sfn "$src" "$dst"
    echo "  linked: $dst"
}

echo "==> zsh"
symlink "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"

echo "==> tmux"
symlink "$DOTFILES/tmux" "$HOME/.config/tmux"

echo "==> nvim"
symlink "$DOTFILES/nvim" "$HOME/.config/nvim"
symlink "$DOTFILES/nvim-notes" "$HOME/.config/nvim-notes"

echo "==> starship"
symlink "$DOTFILES/starship/starship.toml" "$HOME/.config/starship/starship.toml"

echo "==> ghostty"
symlink "$DOTFILES/ghostty/config" "$HOME/.config/ghostty/config"

echo "==> ssh"
symlink "$DOTFILES/ssh/config" "$HOME/.ssh/config"
chmod 600 "$HOME/.ssh/config"

echo "==> tmux plugin manager (TPM)"
TPM_DIR="$HOME/.config/tmux/plugins/tpm"
if [[ ! -d "$TPM_DIR" ]]; then
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
    echo "  cloned TPM — run prefix+I inside tmux to install plugins"
else
    echo "  TPM already present"
fi

echo ""
echo "Done. Start a new shell or run: source ~/.zshrc"
