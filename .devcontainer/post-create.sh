#!/usr/bin/env bash
# .devcontainer/post-create.sh
#
# This script runs once after the devcontainer is first created.
# It installs tools that aren't available as official devcontainer features.
#
# Keep this script idempotent (safe to run multiple times).

set -euo pipefail

echo "→ Running post-create setup..."

# ── System packages ──────────────────────────────────────────────────────────
echo "→ Installing system packages..."
sudo apt-get update -qq
sudo apt-get install -y --no-install-recommends \
  ripgrep \
  fd-find \
  bat \
  tree \
  jq \
  unzip \
  make

# ── eza (modern ls replacement) ───────────────────────────────────────────────
# eza is not yet in Ubuntu's default apt repos, so we install from GitHub.
if ! command -v eza &>/dev/null; then
  echo "→ Installing eza..."
  EZA_VERSION=$(curl -s "https://api.github.com/repos/eza-community/eza/releases/latest" \
    | grep '"tag_name"' | sed 's/.*"tag_name": *"\(.*\)".*/\1/')
  curl -sSL "https://github.com/eza-community/eza/releases/download/${EZA_VERSION}/eza_x86_64-unknown-linux-gnu.tar.gz" \
    | sudo tar -xz -C /usr/local/bin eza
  echo "  eza installed: $(eza --version | head -1)"
fi

# ── pnpm ─────────────────────────────────────────────────────────────────────
if ! command -v pnpm &>/dev/null; then
  echo "→ Installing pnpm..."
  npm install -g pnpm
fi
echo "  pnpm: $(pnpm --version)"

# ── pipx ─────────────────────────────────────────────────────────────────────
if ! command -v pipx &>/dev/null; then
  echo "→ Installing pipx..."
  python3 -m pip install --user --quiet pipx
  python3 -m pipx ensurepath
fi
echo "  pipx: $(pipx --version)"

# ── fzf ──────────────────────────────────────────────────────────────────────
if ! command -v fzf &>/dev/null; then
  echo "→ Installing fzf..."
  sudo apt-get install -y --no-install-recommends fzf
fi
echo "  fzf: $(fzf --version)"

# ── Shell aliases (added to ~/.zshrc) ────────────────────────────────────────
# NOTE: We intentionally do NOT alias 'cat' or 'find' to bat/fd, as that
# would break scripts and tools that rely on their standard behaviour.
# Use 'bat' and 'fd' directly when you want their enhanced output.
ALIASES_BLOCK="
# ── atrey-dev aliases ──────────────────────────────────────────────────────
alias ls='eza --icons'
alias ll='eza -lh --icons'
alias la='eza -lah --icons'
alias lt='eza --tree --level=2 --icons'
# Use 'bat' for syntax-highlighted viewing; 'cat' remains the standard tool
# Use 'fd' for fast file finding; 'find' remains the standard tool
"

if ! grep -q "atrey-dev aliases" ~/.zshrc 2>/dev/null; then
  echo "$ALIASES_BLOCK" >> ~/.zshrc
  echo "→ Shell aliases added to ~/.zshrc"
fi

echo ""
echo "✓ Post-create setup complete."
echo "  Run 'make doctor' to verify all tools are available."
