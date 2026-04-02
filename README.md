<div align="center">

# 🤖 pro-cli-ia

**The terminal AI that actually does things.**

One CLI. Every AI provider. Real tools. No limits.

[![npm version](https://img.shields.io/npm/v/pro-cli-ia?color=00ff41&style=flat-square)](https://www.npmjs.com/package/pro-cli-ia)
[![npm downloads](https://img.shields.io/npm/dm/pro-cli-ia?color=00d4ff&style=flat-square)](https://www.npmjs.com/package/pro-cli-ia)
[![Node.js](https://img.shields.io/badge/node-%3E%3D18-brightgreen?style=flat-square)](https://nodejs.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-blue?style=flat-square)](#cross-platform)

```
╔════════════════════════════════════════════════════════════════╗
║  ◆  PRO-CLI-IA  ──  INTERACTIVE CHAT                           ║
║  provider ANTHROPIC  ·  model claude-sonnet-4-6                ║
╚════════════════════════════════════════════════════════════════╝
  ›  search for the best MCP servers and install them
  ● I'll search npm and GitHub for the most popular MCP servers...
  ● WebSearch(mcp servers development npm)
  ⎿  Found: @modelcontextprotocol/server-filesystem, server-github...
  ● MCP(filesystem)
  ⎿  Server "filesystem" added and active
```

</div>

---

## Why pro-cli-ia is different

Most AI CLIs are just chat wrappers. **pro-cli-ia is an autonomous agent** that can search the web, write and run code, manage files, and configure itself — all from your terminal.

| Feature | pro-cli-ia | Other AI CLIs |
|---------|:---:|:---:|
| 8 LLM providers in one tool | ✅ | ❌ Most support 1–2 |
| Free models (Ollama, OpenRouter, Qwen) | ✅ | ❌ Usually paid only |
| Real file system tools (read/write/edit/grep/glob) | ✅ | ❌ |
| Web search + URL fetch (no API key needed) | ✅ | ❌ |
| MCP server management + catalog | ✅ | ❌ |
| Autonomous code agent (20 tools) | ✅ | ❌ |
| Persistent chat sessions per model | ✅ | ❌ |
| Persistent agents with memory | ✅ | ❌ |
| Image + video generation (9 providers) | ✅ | ❌ |
| Multi-language UI (EN/ES) | ✅ | ❌ |
| Works on Windows, macOS, Linux | ✅ | ⚠️ Often Linux-only |
| Single binary, no config required | ✅ | ❌ |

---

## Cross-platform

pro-cli-ia runs natively on **Windows, macOS, and Linux** with zero configuration differences.

```bash
# Windows (PowerShell or CMD)
npm install -g pro-cli-ia
pro-cli-ia chat -p ollama

# macOS
npm install -g pro-cli-ia
pro-cli-ia chat -p anthropic

# Linux
npm install -g pro-cli-ia
pro-cli-ia chat -p groq
```

- **Windows**: Full support including PowerShell paths (`C:\Users\...`), forward-slash normalization
- **macOS**: Native support, works with Homebrew Node.js
- **Linux**: Full support, works in headless/SSH environments

---

## Installation

```bash
npm install -g pro-cli-ia
```

Requires **Node.js 18+**. That's it — no Python, no Rust, no Docker.

---

## Quick start

```bash
# No API key? Start with Ollama (100% local and free)
ollama pull llama3.2
pro-cli-ia chat -p ollama -m llama3.2

# Or use OpenRouter free models (no credit card)
pro-cli-ia config set   # → OpenRouter → pick a ★ FREE model
pro-cli-ia chat -p openrouter

# Or configure any provider
pro-cli-ia config set
```

---

## Language / Idioma

English is the default. Switch language interactively or via environment variable:

```bash
# Switch language interactively (recommended)
pro-cli-ia config set
# → 🌐 Language / Idioma → English or Español

# Or via environment variable
AI_CONSOLE_LANG=es pro-cli-ia chat   # Spanish session
AI_CONSOLE_LANG=en pro-cli-ia chat   # English session (default)
```

The language setting is saved in `~/.pro-cli-ia/config.json` and persists across sessions.

---

## Providers

### Anthropic Claude

```bash
export ANTHROPIC_API_KEY=sk-ant-...
pro-cli-ia chat -p anthropic
pro-cli-ia chat -p anthropic -m claude-haiku-3-5   # fastest, cheapest
pro-cli-ia chat -p anthropic -m claude-opus-4-5    # most capable
```

Models: `claude-opus-4-5`, `claude-sonnet-4-5`, `claude-haiku-3-5`

Get key: https://console.anthropic.com/

---

### OpenAI

```bash
export OPENAI_API_KEY=sk-proj-...
pro-cli-ia chat -p openai
pro-cli-ia chat -p openai -m gpt-4o-mini   # fast and cheap
pro-cli-ia chat -p openai -m o1            # reasoning model
```

Models: `gpt-4o`, `gpt-4o-mini`, `gpt-4-turbo`, `o1`, `o1-mini`, `o3-mini`

Get key: https://platform.openai.com/api-keys

---

### Google Gemini

```bash
export GEMINI_API_KEY=AIzaSy...
pro-cli-ia chat -p gemini
pro-cli-ia chat -p gemini -m gemini-2.0-flash   # fast, free tier
```

Models: `gemini-2.0-flash`, `gemini-2.0-flash-lite`, `gemini-1.5-pro`, `gemini-1.5-flash`

Get key: https://aistudio.google.com/apikey

---

### Groq (fast inference, generous free tier)

```bash
export GROQ_API_KEY=gsk_...
pro-cli-ia chat -p groq
pro-cli-ia chat -p groq -m llama-3.3-70b-versatile
```

Models: `llama-3.3-70b-versatile`, `llama-3.1-8b-instant`, `mixtral-8x7b-32768`, `gemma2-9b-it`, `deepseek-r1-distill-llama-70b`

Get key: https://console.groq.com/keys

---

### Ollama — Local Models (Free, No API Key)

Run AI models completely locally. No internet required after setup.

#### Installation

```bash
# Windows: https://ollama.com/download/windows
# macOS:
brew install ollama
# Linux:
curl -fsSL https://ollama.com/install.sh | sh
```

#### Start Ollama

```bash
ollama serve   # starts the server at http://localhost:11434
```

#### Pull models

```bash
# General purpose
ollama pull llama3.2          # 2GB — fast, good quality
ollama pull llama3.1          # 4.7GB — better quality
ollama pull mistral           # 4.1GB — excellent for code
ollama pull gemma2            # 5.4GB — Google's model
ollama pull phi4              # 9.1GB — Microsoft, very capable

# Code-focused
ollama pull codellama         # 3.8GB — Meta's code model
ollama pull deepseek-coder-v2 # 8.9GB — excellent for coding
ollama pull qwen2.5-coder     # 4.7GB — Alibaba's code model

# Lightweight (fast on CPU)
ollama pull phi3              # 2.2GB — Microsoft, fast
ollama pull gemma3            # 3.3GB — Google, efficient
ollama pull llama3.2:1b       # 1.3GB — smallest Llama

# List installed models
ollama list
```

#### Use with pro-cli-ia

```bash
pro-cli-ia chat -p ollama -m llama3.2
pro-cli-ia chat -p ollama -m codellama
pro-cli-ia do "create a Python web scraper" -p ollama -m qwen2.5-coder
pro-cli-ia code -p ollama -m codellama
```

#### Model selection guide

| Use case | Recommended model | Size |
|----------|------------------|------|
| General chat | `llama3.2` | 2GB |
| Code generation | `qwen2.5-coder` | 4.7GB |
| Code + reasoning | `deepseek-coder-v2` | 8.9GB |
| Fast responses | `phi3` | 2.2GB |
| Best quality (8B) | `llama3.1` | 4.7GB |
| Best quality (large) | `phi4` | 9.1GB |

#### Custom Ollama URL

```bash
pro-cli-ia config set
# → LLM provider → ollama → Base URL: http://192.168.1.100:11434/v1
```

#### Troubleshooting Ollama

```
Error: Ollama is not running
→ Run: ollama serve

Error: Model "xyz" not found
→ Run: ollama pull xyz

Error: Connection timeout
→ Model may still be loading. Check: ollama ps
```

---

### OpenRouter (400+ models, many free)

```bash
export OPENROUTER_API_KEY=sk-or-...
pro-cli-ia chat -p openrouter

# Free models (no cost)
pro-cli-ia chat -p openrouter -m deepseek/deepseek-r1:free
pro-cli-ia chat -p openrouter -m meta-llama/llama-3.3-70b-instruct:free
pro-cli-ia chat -p openrouter -m google/gemma-3-27b-it:free
```

When configuring, free models are shown with **★ FREE** at the top of the list.

Get key: https://openrouter.ai/workspaces/default/keys

---

### Qwen (Alibaba)

**Option A — Free OAuth (recommended):**

```bash
npm install -g @qwen-code/qwen-code
qwen   # authenticate in browser (one time only)
pro-cli-ia chat -p qwen -m qwen3-coder-plus
```

Quota: 2,000 requests/day · 60 req/min · **free**

**Option B — DashScope API Key:**

```bash
pro-cli-ia config set   # → Qwen → API Key
# Get key: https://bailian.console.alibabacloud.com/
```

---

## Code Agent — The killer feature

The `code` and `do` commands give the AI **20 real tools** to work with. It can search the web, write files, run commands, and even install MCP servers — all autonomously.

The UI shows a **live feed of tool calls** as they happen, inspired by Claude Code's design:

```
  ◆  anthropic / claude-sonnet-4-6  ·  /my-project

  ● WebSearch(n8n mcp server npm)
  ⎿  npm packages for "n8n mcp server": n8n-nodes-mcp v1.2.0...
  ● WebFetch(https://www.npmjs.com/package/n8n-nodes-mcp)
  ⎿  n8n-nodes-mcp: MCP server for n8n workflow automation...
  ● MCP(n8n-mcp)
  ⎿  Server "n8n-mcp" added successfully

  ● Done! The n8n MCP server is now configured...

  ────────────────────────────────────────────────────────────────
  ● 3 turns · 3 tool calls
```

### Interactive session

```bash
# Start an interactive code session
pro-cli-ia code -p anthropic
pro-cli-ia code -p ollama -m qwen2.5-coder -d ./my-project
pro-cli-ia code -p qwen -m qwen3-coder-plus

# Inside the session:
›  create a REST API in Express.js with CRUD endpoints
›  /mcp n8n                    ← search and install n8n MCP server
›  /mcp github                 ← search and install GitHub MCP server
›  /cwd ./src                  ← change working directory
›  /tools                      ← list all available tools
›  /exit
```

### Session commands

| Command | Action |
|---------|--------|
| `/help` | Show help and example tasks |
| `/cwd` | Show current directory |
| `/cwd <path>` | Change working directory |
| `/tools` | List all 20 available tools |
| `/mcp <query>` | Search and install an MCP server |
| `/exit` | Exit the session |

### One-shot tasks

```bash
pro-cli-ia do "create a hello world in JS and run it" -p anthropic
pro-cli-ia do "find all TODO comments and create TASKS.md" -p groq -d ./src
pro-cli-ia do "search for n8n MCP server and install it" -p ollama -m llama3.2
pro-cli-ia do "analyze the codebase and find security issues" -p openai -d ./src
pro-cli-ia do "fetch https://api.github.com/repos/microsoft/vscode and show stars" -p anthropic
```

### MCP server search & install

The code agent can find and install **any** MCP server autonomously:

```bash
# From the interactive session
pro-cli-ia code -p anthropic
›  /mcp n8n
›  /mcp github
›  /mcp sqlite
›  /mcp playwright browser automation

# Or as a one-shot task
pro-cli-ia do "find and install the best MCP server for Slack" -p anthropic
pro-cli-ia do "search for a PostgreSQL MCP server and configure it" -p qwen -m qwen3-coder-plus
```

The agent will:
1. Search npm and GitHub for the package
2. Read the README to understand configuration
3. Add it to `~/.pro-cli-ia/mcp.json` with the correct command and args
4. Confirm the installation

### Available tools

**File system (12 tools):**
`read_file` · `write_file` · `edit_file` · `delete_file` · `copy_file` · `move_file` · `list_directory` · `create_directory` · `get_file_info` · `glob` · `grep` · `run_command`

**Web (3 tools):**
`web_search` (DuckDuckGo + npm + GitHub, no API key) · `fetch_url` (HTML→Markdown) · `install_package`

**MCP (3 tools):**
`add_mcp_server` · `list_mcp_servers` · `remove_mcp_server`

---

## MCP — Model Context Protocol

Connect any external tool to your AI. Browse a catalog of 16 popular servers or add your own.

```bash
pro-cli-ia mcp catalog    # browse and install popular servers
pro-cli-ia mcp add        # add manually (stdio or HTTP/SSE)
pro-cli-ia mcp list       # list configured servers
pro-cli-ia mcp tools      # see available tools
pro-cli-ia mcp select     # interactive management menu
```

**Catalog includes:** filesystem, git, github, gitlab, brave-search, fetch, puppeteer, sqlite, postgres, slack, google-drive, google-maps, memory, sequential-thinking, and more.

Active MCP servers are **automatically loaded** into the code agent — the AI can use them without any extra configuration.

---

## Media Generation

```bash
# Interactive wizard (recommended)
pro-cli-ia media generate

# Images
pro-cli-ia media image "cyberpunk city at sunset" -p piapi-flux --model Qubico/flux1-dev
pro-cli-ia media image "minimalist logo" -p openai-image -W 1792 -H 1024 -o logo.png

# Videos
pro-cli-ia media video "ocean waves at dawn" -p piapi-kling --model kling-v2.6-pro -d 5 -a 16:9
pro-cli-ia media video "city timelapse" -p piapi-hailuo -d 6
```

**Image providers:** OpenAI DALL-E 2/3/GPT-Image-1, Stability AI (SDXL, Ultra), Replicate (FLUX), PiAPI FLUX.1

**Video providers:** Replicate, PiAPI Kling, Hailuo, Luma Dream Machine, Wanx, SkyReels

PiAPI key: https://piapi.ai/workspace/key

---

## Chat commands

Inside `pro-cli-ia chat`:

| Command | Action |
|---------|--------|
| `/help` | Show all commands |
| `/agents` | List and select agents |
| `/agent new` | Create agent inline (type `END` to finish) |
| `/code <task>` | Run code agent task |
| `/media generate` | Generate image/video |
| `/mcp` | Manage MCP servers |
| `/mcp catalog` | Install MCP servers |
| `/clear` | Clear conversation |
| `/model` | Show current model |
| `/tokens` | Show token usage |
| `/history` | Show conversation history |
| `/exit` | Exit |

---

## Persistent agents

Define reusable AI personas with custom system prompts. History is saved across sessions.

```bash
pro-cli-ia agent create          # create a new agent
pro-cli-ia agent chat reviewer   # chat with persistent history
pro-cli-ia agent select          # interactive management
```

---

## Configuration

```bash
pro-cli-ia config set   # interactive setup
pro-cli-ia config show  # view current config
```

Config stored at `~/.pro-cli-ia/config.json`. Sessions at `~/.pro-cli-ia/sessions/`.

Environment variables:

```env
ANTHROPIC_API_KEY=sk-ant-...
OPENAI_API_KEY=sk-proj-...
GEMINI_API_KEY=AIzaSy...
GROQ_API_KEY=gsk_...
OPENROUTER_API_KEY=sk-or-...
QWEN_API_KEY=sk-...
```

---

## Error reference

| Error | Cause | Fix |
|-------|-------|-----|
| `Invalid API key` | Wrong or expired key | `pro-cli-ia config set` |
| `Rate limit exceeded` | Too many requests | Wait or switch provider |
| `Model not found` | Wrong model name | `pro-cli-ia providers` |
| `Ollama is not running` | Server not started | `ollama serve` |
| `Model "x" not found` | Not pulled | `ollama pull x` |
| `Qwen OAuth token expired` | Token expired | Run `qwen` to refresh |
| `Gateway timeout (504)` | Model too slow | Use smaller model |
| `Connection refused` | Service down | Check internet/service |

---

## Sponsorship

pro-cli-ia is free and open source. If it saves you time or helps your workflow, consider sponsoring to support continued development:

**[❤️ Sponsor on GitHub](https://github.com/sponsors/pro-cli-ia)**

---

## License

MIT

**GitHub:** https://github.com/pro-cli-ia/pro-cli-ia
**npm:** https://www.npmjs.com/package/pro-cli-ia
**Issues:** https://github.com/pro-cli-ia/pro-cli-ia/issues
