#!/usr/bin/env bash
set -e

BOLD="\033[1m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[0;33m"
RED="\033[0;31m"
RESET="\033[0m"

PACKAGE="pro-cli-ia"
MIN_NODE=18

print_banner() {
  printf "\n${CYAN}${BOLD}"
  printf "╔════════════════════════════════════╗\n"
  printf "║       pro-cli-ia  installer        ║\n"
  printf "║   One CLI. Every AI. Real tools.   ║\n"
  printf "╚════════════════════════════════════╝\n"
  printf "${RESET}\n"
}

info()    { printf "  ${CYAN}◆${RESET}  %s\n" "$1"; }
success() { printf "  ${GREEN}✔${RESET}  %s\n" "$1"; }
warn()    { printf "  ${YELLOW}⚠${RESET}  %s\n" "$1"; }
error()   { printf "  ${RED}✖${RESET}  %s\n" "$1" >&2; }

command_exists() { command -v "$1" &>/dev/null; }

# ── Node.js check ────────────────────────────────────────────────────────────
check_node() {
  if ! command_exists node; then
    warn "Node.js not found. Installing via nvm..."
    install_node
    return
  fi

  local version
  version=$(node -e "process.stdout.write(String(process.versions.node.split('.')[0]))")
  if [ "$version" -lt "$MIN_NODE" ]; then
    warn "Node.js $version found, but $MIN_NODE+ is required. Upgrading via nvm..."
    install_node
  else
    success "Node.js $version found"
  fi
}

install_node() {
  if command_exists nvm; then
    nvm install --lts
    nvm use --lts
  elif command_exists brew; then
    info "Installing Node.js via Homebrew..."
    brew install node
  elif command_exists apt-get; then
    info "Installing Node.js via apt..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
  elif command_exists dnf; then
    info "Installing Node.js via dnf..."
    sudo dnf install -y nodejs npm
  elif command_exists pacman; then
    info "Installing Node.js via pacman..."
    sudo pacman -Sy nodejs npm --noconfirm
  else
    error "Could not install Node.js automatically."
    printf "\n  Please install Node.js 18+ from: ${CYAN}https://nodejs.org${RESET}\n\n"
    exit 1
  fi
  success "Node.js installed"
}

# ── npm check ────────────────────────────────────────────────────────────────
check_npm() {
  if ! command_exists npm; then
    error "npm not found. Please install Node.js from https://nodejs.org"
    exit 1
  fi
  success "npm $(npm -v) found"
}

# ── Install pro-cli-ia ───────────────────────────────────────────────────────
install_package() {
  info "Installing ${PACKAGE} globally..."
  if npm install -g "$PACKAGE" --loglevel=error 2>&1 | grep -v "npm warn" ; then
    :
  else
    # Retry with sudo if permission denied
    warn "Retrying with sudo (permission issue)..."
    sudo npm install -g "$PACKAGE" --loglevel=error
  fi
}

# ── Verify install ───────────────────────────────────────────────────────────
verify() {
  if command_exists pro-cli-ia; then
    local ver
    ver=$(pro-cli-ia --version 2>/dev/null || echo "installed")
    success "${PACKAGE} ${ver} installed successfully"
  else
    error "Installation may have failed — '${PACKAGE}' command not found."
    printf "\n  Try manually: ${CYAN}npm install -g ${PACKAGE}${RESET}\n\n"
    exit 1
  fi
}

# ── Next steps ───────────────────────────────────────────────────────────────
print_next_steps() {
  printf "\n${BOLD}  Next steps:${RESET}\n\n"
  printf "  ${GREEN}▸${RESET}  ${CYAN}pro-cli-ia config set${RESET}            — configure your API keys\n"
  printf "  ${GREEN}▸${RESET}  ${CYAN}pro-cli-ia chat -p ollama${RESET}        — free local chat (no key needed)\n"
  printf "  ${GREEN}▸${RESET}  ${CYAN}pro-cli-ia chat -p openrouter${RESET}    — 400+ models, free tier\n"
  printf "  ${GREEN}▸${RESET}  ${CYAN}pro-cli-ia code${RESET}                  — autonomous code agent\n"
  printf "\n  Docs: ${CYAN}https://github.com/pro-cli-ia/pro-cli-ia${RESET}\n\n"
}

# ── Main ─────────────────────────────────────────────────────────────────────
main() {
  print_banner
  check_node
  check_npm
  install_package
  verify
  print_next_steps
}

main
