# Changelog

All notable changes to pro-cli-ia are documented here.

## [1.0.1] — 2026-04-02

### Security
- Added `src/tools/security.ts` — trust boundary layer addressing npm's AI risk analysis
- **Dangerous file blocklist** — blocks writes to `.bashrc`, `.env`, `.ssh/id_rsa`, `.netrc`, `passwd`, `shadow`, cloud credentials (`~/.aws`, `~/.azure`, `~/.gcloud`, `~/.kube`)
- **Dangerous directory blocklist** — blocks writes inside `.git`, `.ssh`, `.aws`, `.azure`, `.gcloud`, `.kube`
- **Command pattern detection** — regex blocklist for `sudo`, `rm -rf /*`, `curl | bash`, reverse shells (`/dev/tcp/`), fork bombs, cron persistence, env exfiltration
- **Path traversal detection** — blocks `../`, Windows NTFS Alternate Data Streams (`file:stream`), 8.3 short names (`GIT~1`), home directory credential paths
- **Risk classification** — every tool call classified as `safe` / `low` / `high` / `blocked` before execution
- **Interactive permission prompt** — high-risk tools (shell commands, global installs, MCP server additions) pause and ask `Allow? [y/N]` before executing
- **Denial tracking** — agent auto-stops after 3 consecutive or 20 total denied operations (same limits as Claude Code)
- **Hard blocks** — `blocked` tools never execute regardless of user input
- **No-TTY safe default** — when running piped/scripted (no terminal), high-risk tools are denied automatically

## [1.0.0] — 2026-04-02

### Initial release

- Multi-provider LLM chat: Anthropic, OpenAI, Gemini, Groq, Mistral, Ollama, OpenRouter, Qwen
- Code agent with 20 real tools (file system, web search, MCP management)
- Image/video generation: OpenAI, Stability AI, Replicate, PiAPI
- Persistent chat sessions per provider+model
- Persistent agents with conversation history
- MCP (Model Context Protocol) support with catalog of 16 popular servers
- Claude Code-style UI: `●` bullets, `⎿` tool results, `─` separators
- Multi-language UI: English (default) + Spanish (`AI_CONSOLE_LANG=es`)
- Clean Ctrl+C handling — no stack traces
- `/mcp <query>` in code session: autonomously searches and installs any MCP server
- Works on Windows, macOS, and Linux
