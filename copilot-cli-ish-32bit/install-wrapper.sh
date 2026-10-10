#!/bin/ash
# Minimal iSH installer for the safe wrapper

set -eu

HOME_DIR="${HOME:-/root}"
TARGET_DIR="${TARGET_DIR:-$HOME_DIR/.local/bin}"
WRAPPER_NAME="copilot"
SRC_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$TARGET_DIR"

if [ -f "$SRC_DIR/copilot-wrapper" ]; then
    install -m 755 "$SRC_DIR/copilot-wrapper" "$TARGET_DIR/$WRAPPER_NAME"
    echo "Installed safe compatibility wrapper to: $TARGET_DIR/$WRAPPER_NAME"
else
    echo "Error: backup wrapper not found in $SRC_DIR" >&2
    exit 1
fi

cat <<'EOF'

IMPORTANT:
Your environment is 32-bit iSH (i686), which is not supported by
GitHub Copilot CLI native binaries.

This wrapper intentionally runs in SAFE FALLBACK MODE only.

Recommended next steps:
  1. Upgrade iSH to 64-bit mode
  2. Or install / use Copilot from VS Code / JetBrains / GitHub web UI
  3. Use 'copilot help' to see safe-mode commands
EOF
