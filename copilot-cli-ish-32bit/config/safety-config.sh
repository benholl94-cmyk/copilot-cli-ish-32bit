#!/bin/ash
# Safety configuration for Copilot CLI compatibility wrapper
# Written for iSH Alpine Linux 32-bit environment

# Application defaults
export COPILOT_SAFE_MODE="1"
export COPILOT_WRAPPER_MODE="fallback"
export COPILOT_LOG_DIR="${HOME}/.copilot-logs"
export COPILOT_STATE_DIR="${HOME}/.copilot-state"
export COPILOT_SUPPORT_URL="https://github.com"

# Environment hardening
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
export HOME="${HOME:-/root}"
export TMPDIR="/tmp"
export TEMP="/tmp"
export TMP="/tmp"

# Resource caps (only if supported)
# The 32-bit iSH environment is heavily constrained.
export COPILOT_MAX_MEMORY_MB="512"
export COPILOT_MAX_CPU_PERCENT="80"
export COPILOT_MAX_TEMP_MB="100"

# Disable actions that require native binary execution
export COPILOT_ALLOW_NATIVE_EXEC="0"
export COPILOT_ALLOW_NETWORK="1"
export COPILOT_ALLOW_INTERACTIVE="0"

# Fallback mode markers
mkdir -p "${COPILOT_LOG_DIR}" "${COPILOT_STATE_DIR}" 2>/dev/null || true

# Ensure shell compatibility with ash
export LC_ALL="C.UTF-8"
export LANG="C.UTF-8"

# Provide compatibility info for wrappers
if [ -n "${COPILOT_DEBUG:-}" ]; then
    echo "[copilot-safety] loaded" >&2
fi
