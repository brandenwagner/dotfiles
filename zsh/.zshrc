# Reevaluate the prompt string each time it's displaying a prompt
setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit

# Starship Prompt
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
export LANG=en_US.UTF-8

# Activate `fnm`: https://github.com/Schniz/fnm
if command -v fnm >/dev/null; then
    eval "$(fnm env --use-on-cd)"
fi

# Activate `direnv`: https://direnv.net/
if command -v direnv >/dev/null; then
    eval "$(direnv hook zsh)"
fi

# Add Nix profile to path
export PATH="$HOME/.nix-profile/bin:$PATH"

# Add Homebrew to path
export PATH="/opt/homebrew/bin:$PATH"


alias docker=podman
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
