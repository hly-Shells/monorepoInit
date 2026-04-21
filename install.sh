#!/usr/bin/env bash
set -euo pipefail

REPO_RAW_URL="${REPO_RAW_URL:-https://raw.githubusercontent.com/<your-org-or-user>/monorepo-ci/main/create-monorepo.sh}"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"
TARGET="$INSTALL_DIR/monorepo-ci"

if ! command -v curl >/dev/null 2>&1; then
  echo "Error: curl is required but not found."
  exit 1
fi

mkdir -p "$INSTALL_DIR"

echo "Downloading monorepo-ci..."
curl -fsSL "$REPO_RAW_URL" -o "$TARGET"
chmod +x "$TARGET"

ensure_path() {
  case ":$PATH:" in
    *":$INSTALL_DIR:"*) return 0 ;;
  esac

  local shell_name profile_file
  shell_name="$(basename "${SHELL:-}")"
  case "$shell_name" in
    zsh) profile_file="$HOME/.zshrc" ;;
    bash) profile_file="$HOME/.bashrc" ;;
    *) profile_file="$HOME/.profile" ;;
  esac

  {
    echo ""
    echo "# monorepo-ci"
    echo "export PATH=\"$INSTALL_DIR:\$PATH\""
  } >> "$profile_file"

  echo "Added $INSTALL_DIR to PATH in $profile_file"
  echo "Run: source $profile_file"
}

ensure_path

echo "Install complete."
echo "Run: monorepo-ci --help"
