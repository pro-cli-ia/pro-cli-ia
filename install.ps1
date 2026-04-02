#Requires -Version 5.1
<#
.SYNOPSIS
    Installs pro-cli-ia — Universal AI console for your terminal.
.DESCRIPTION
    Installs Node.js (if needed) and pro-cli-ia via npm.
.EXAMPLE
    irm https://raw.githubusercontent.com/pro-cli-ia/pro-cli-ia/main/install.ps1 | iex
#>

$ErrorActionPreference = 'Stop'

$PACKAGE    = 'pro-cli-ia'
$MIN_NODE   = 18
$REPO_URL   = 'https://github.com/pro-cli-ia/pro-cli-ia'
$NODE_URL   = 'https://nodejs.org/en/download/'
$WINGET_ID  = 'OpenJS.NodeJS.LTS'

function Write-Banner {
    Write-Host ""
    Write-Host "  ╔════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "  ║       pro-cli-ia  installer        ║" -ForegroundColor Cyan
    Write-Host "  ║   One CLI. Every AI. Real tools.   ║" -ForegroundColor Cyan
    Write-Host "  ╚════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

function Write-Info    ($msg) { Write-Host "  ◆  $msg" -ForegroundColor Cyan }
function Write-Success ($msg) { Write-Host "  ✔  $msg" -ForegroundColor Green }
function Write-Warn    ($msg) { Write-Host "  ⚠  $msg" -ForegroundColor Yellow }
function Write-Err     ($msg) { Write-Host "  ✖  $msg" -ForegroundColor Red }

function Get-NodeVersion {
    try {
        $v = (node -e "process.stdout.write(String(process.versions.node.split('.')[0]))" 2>$null)
        return [int]$v
    } catch {
        return 0
    }
}

function Test-Command ($cmd) {
    return [bool](Get-Command $cmd -ErrorAction SilentlyContinue)
}

# ── Node.js check ─────────────────────────────────────────────────────────────
function Invoke-CheckNode {
    $ver = Get-NodeVersion
    if ($ver -ge $MIN_NODE) {
        Write-Success "Node.js $ver found"
        return
    }

    if ($ver -gt 0) {
        Write-Warn "Node.js $ver found, but $MIN_NODE+ is required. Upgrading..."
    } else {
        Write-Warn "Node.js not found. Installing..."
    }

    Invoke-InstallNode
}

function Invoke-InstallNode {
    # Try winget first (Windows 10 1709+ / Windows 11)
    if (Test-Command winget) {
        Write-Info "Installing Node.js via winget..."
        winget install --id $WINGET_ID --accept-source-agreements --accept-package-agreements -e
        # Refresh PATH
        $env:Path = [System.Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' +
                    [System.Environment]::GetEnvironmentVariable('Path', 'User')
        Write-Success "Node.js installed"
        return
    }

    # Try Scoop
    if (Test-Command scoop) {
        Write-Info "Installing Node.js via Scoop..."
        scoop install nodejs-lts
        Write-Success "Node.js installed"
        return
    }

    # Try Chocolatey
    if (Test-Command choco) {
        Write-Info "Installing Node.js via Chocolatey..."
        choco install nodejs-lts -y
        Write-Success "Node.js installed"
        return
    }

    Write-Err "Could not install Node.js automatically."
    Write-Host ""
    Write-Host "  Please install Node.js 18+ from: $NODE_URL" -ForegroundColor Cyan
    Write-Host ""
    exit 1
}

# ── npm check ─────────────────────────────────────────────────────────────────
function Invoke-CheckNpm {
    if (-not (Test-Command npm)) {
        Write-Err "npm not found. Please install Node.js from https://nodejs.org"
        exit 1
    }
    $v = npm -v
    Write-Success "npm $v found"
}

# ── Install pro-cli-ia ────────────────────────────────────────────────────────
function Invoke-InstallPackage {
    Write-Info "Installing $PACKAGE globally..."
    npm install -g $PACKAGE --loglevel=error
    if ($LASTEXITCODE -ne 0) {
        Write-Err "npm install failed. Try running this script as Administrator."
        exit 1
    }
}

# ── Verify install ────────────────────────────────────────────────────────────
function Invoke-Verify {
    # Refresh PATH so the new binary is visible in this session
    $env:Path = [System.Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' +
                [System.Environment]::GetEnvironmentVariable('Path', 'User')

    if (Test-Command pro-cli-ia) {
        $ver = (pro-cli-ia --version 2>$null); if (-not $ver) { $ver = 'installed' }
        Write-Success "$PACKAGE $ver installed successfully"
    } else {
        Write-Warn "'pro-cli-ia' command not found in current session."
        Write-Host "  Restart your terminal and run: pro-cli-ia config set" -ForegroundColor Cyan
    }
}

# ── Next steps ────────────────────────────────────────────────────────────────
function Write-NextSteps {
    Write-Host ""
    Write-Host "  Next steps:" -ForegroundColor White
    Write-Host ""
    Write-Host "  ▸  pro-cli-ia config set          " -NoNewline -ForegroundColor Green
    Write-Host "— configure your API keys" -ForegroundColor Gray
    Write-Host "  ▸  pro-cli-ia chat -p ollama      " -NoNewline -ForegroundColor Green
    Write-Host "— free local chat (no key needed)" -ForegroundColor Gray
    Write-Host "  ▸  pro-cli-ia chat -p openrouter  " -NoNewline -ForegroundColor Green
    Write-Host "— 400+ models, free tier" -ForegroundColor Gray
    Write-Host "  ▸  pro-cli-ia code                " -NoNewline -ForegroundColor Green
    Write-Host "— autonomous code agent" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  Docs: $REPO_URL" -ForegroundColor Cyan
    Write-Host ""
}

# ── Main ──────────────────────────────────────────────────────────────────────
Write-Banner
Invoke-CheckNode
Invoke-CheckNpm
Invoke-InstallPackage
Invoke-Verify
Write-NextSteps
