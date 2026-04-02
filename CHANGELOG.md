# Changelog

All notable changes to pro-cli-ia are documented here.

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
