# Claude Code Guide

A comprehensive setup guide and toolkit for Claude Code CLI. Includes configuration fixes, custom MCPs, skills, agents, and commands to supercharge your Claude Code experience.

## Quick Install

```bash
curl -sSL https://raw.githubusercontent.com/ajjucoder/claude-code-guide/main/install.sh | bash
```

## What's Included

| Directory | Contents |
|-----------|----------|
| `config/` | Configuration fixes and templates (compaction fix, settings, CLAUDE.md template) |
| `mcps/` | Custom MCP servers for enhanced functionality |
| `skills/` | Custom skills for specialized tasks |
| `agents/` | Custom agent personas |
| `commands/` | Custom slash commands |

## Features

### Compaction Fix
Fixes the issue where Claude Code auto-compacts conversations too aggressively, losing important context. [Learn more](./config/compaction-fix.md)

### Custom MCPs
MCP servers that extend Claude Code's capabilities. [Browse MCPs](./mcps/)

### Custom Skills
Specialized skills for common workflows. [Browse Skills](./skills/)

### Custom Agents
Agent personas for different tasks. [Browse Agents](./agents/)

### Custom Commands
Slash commands for quick actions. [Browse Commands](./commands/)

## Manual Installation

### 1. Compaction Fix Only

```bash
# Append compaction instructions to your CLAUDE.md
cat config/compaction-fix.md >> ~/.claude/CLAUDE.md
```

### 2. Full Setup

```bash
# Clone the repo
git clone https://github.com/ajjucoder/claude-code-guide.git
cd claude-code-guide

# Run installer
./install.sh
```

### 3. Individual Components

```bash
# Install specific MCP
cp -r mcps/your-mcp ~/.claude/mcps/

# Install specific skill
cp -r skills/your-skill ~/.claude/commands/

# Install specific agent
cp agents/your-agent.md ~/.claude/commands/
```

## Configuration

### Recommended Settings

See [`config/settings.json`](./config/settings.json) for recommended Claude Code settings.

### CLAUDE.md Template

See [`config/CLAUDE.md.template`](./config/CLAUDE.md.template) for a full CLAUDE.md configuration template.

## Contributing

Found something useful? Add it!

1. Fork this repo
2. Add your MCP/skill/agent/command
3. Update the relevant README
4. Open a PR

## License

MIT - Use freely, modify as needed.
