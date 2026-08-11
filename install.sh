#!/usr/bin/env zsh
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

symlink() {
    local src="$1" dst="$2"

    # A tracked file that is itself a symlink usually means the link was once
    # made in reverse (repo -> ~/.config). Linking dst -> src on top of that
    # produces a mutual loop that makes the config unreadable, so refuse.
    if [[ -L "$src" ]]; then
        echo "  ERROR: $src is a symlink (-> $(readlink "$src"))." >&2
        echo "         Replace it with the real file before running install.sh." >&2
        return 1
    fi
    if [[ ! -e "$src" ]]; then
        echo "  ERROR: $src does not exist" >&2
        return 1
    fi

    # Already pointing where we want it -- nothing to do.
    if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
        echo "  ok:     $dst"
        return 0
    fi

    # If dst already resolves to src, a parent directory is a symlink into the
    # repo and src/dst are the same file. Moving dst aside would delete the
    # real config and leave a symlink pointing at itself, so stop.
    if [[ -e "$dst" ]] && [[ "$dst" -ef "$src" ]]; then
        echo "  ok:     $dst (already provided via a parent symlink)"
        return 0
    fi

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
symlink "$DOTFILES/starship" "$HOME/.config/starship"

echo "==> ghostty"
symlink "$DOTFILES/ghostty" "$HOME/.config/ghostty"

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

echo "==> herdr agent integrations"
# herdr generates and version-stamps these hook scripts itself, so they are not
# tracked in this repo -- installing them is a provisioning step instead. Only
# missing targets are installed, so re-running never rewrites a hook that herdr
# already manages, and never touches the agent's settings file twice.
if command -v herdr >/dev/null 2>&1; then
    herdr_status="$(herdr integration status 2>/dev/null || true)"
    for target in claude codex; do
        if [[ -z "$herdr_status" ]]; then
            echo "  skipped: $target (could not read herdr integration status)"
        elif print -r -- "$herdr_status" | grep -q "^${target}: not installed"; then
            if herdr integration install "$target" >/dev/null 2>&1; then
                echo "  installed: $target"
            else
                echo "  WARNING: herdr integration install $target failed" >&2
            fi
        else
            echo "  ok:     $target"
        fi
    done
else
    # herdr comes from nix-config's shared/home.nix, so it is absent on
    # standalone hosts. Not an error.
    echo "  skipped: herdr not on PATH"
fi

echo ""
echo "Done. Start a new shell or run: source ~/.zshrc"
