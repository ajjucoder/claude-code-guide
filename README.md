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

---

## Featured MCPs

### Document Loader MCP

Read PDF, Word, Excel, PowerPoint, and image files directly in Claude Code.

```bash
# Install
npm install -g @anthropic/mcp-document-loader

# Usage
mcp-cli call document-loader-mcp/read_document '{"file_path": "/path/to/file.pdf", "file_type": "pdf"}'
```

[Full Documentation →](./mcps/document-loader-mcp/)

### Exa MCP

AI-powered web search and code context search.

```bash
# Install
npm install -g @anthropic/mcp-exa

# Usage
mcp-cli call exa/web_search_exa '{"query": "Next.js 15 best practices"}'
```

[Full Documentation →](./mcps/exa-mcp/)

---

## MCP-First Configuration

Make Claude Code automatically use your MCPs instead of built-in tools.

### Step 1: Install MCPs

```bash
# Document Loader
npm install -g @anthropic/mcp-document-loader

# Exa (requires API key from exa.ai)
npm install -g @anthropic/mcp-exa
```

### Step 2: Configure settings.json

Copy the settings template:

```bash
cp config/settings.json ~/.claude/settings.json
```

Or manually add to your `~/.claude/settings.json`:

```json
{
  "mcpServers": {
    "document-loader-mcp": {
      "command": "npx",
      "args": ["-y", "@anthropic/mcp-document-loader"],
      "env": {}
    },
    "exa": {
      "command": "npx",
      "args": ["-y", "@anthropic/mcp-exa"],
      "env": {
        "EXA_API_KEY": "your-exa-api-key-here"
      }
    }
  }
}
```

### Step 3: Configure CLAUDE.md

Copy the CLAUDE.md template to make Claude automatically use MCPs:

```bash
cp config/CLAUDE.md.template ~/.claude/CLAUDE.md
```

This template includes:
- **MCP-First Policy**: Claude will use document-loader-mcp for documents, exa for web search
- **Auto-detection rules**: No need to tell Claude to "use MCP" - it does it automatically
- **Compaction fix**: Preserves important context during auto-compaction
- **Coding preferences**: TypeScript defaults, no comments, etc.

### Step 4: Verify Installation

```bash
# List MCPs
mcp-cli servers

# Expected output:
# document-loader-mcp
# exa

# Test document reading
mcp-cli call document-loader-mcp/read_document '{"file_path": "/path/to/test.pdf", "file_type": "pdf"}'

# Test web search
mcp-cli call exa/web_search_exa '{"query": "test query"}'
```

---

## Features

### Compaction Fix

Fixes the issue where Claude Code auto-compacts conversations too aggressively, losing important context.

[Learn more →](./config/compaction-fix.md)

### Custom MCPs

MCP servers that extend Claude Code's capabilities.

| MCP | Description | Documentation |
|-----|-------------|---------------|
| document-loader-mcp | Read PDF, Word, Excel, PowerPoint, images | [Docs](./mcps/document-loader-mcp/) |
| exa-mcp | AI-powered web and code search | [Docs](./mcps/exa-mcp/) |

[Browse all MCPs →](./mcps/)

### Custom Skills

Specialized skills for common workflows.

[Browse Skills →](./skills/)

### Custom Agents

Agent personas for different tasks.

[Browse Agents →](./agents/)

### Custom Commands

Slash commands for quick actions.

[Browse Commands →](./commands/)

---

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

---

## For New Machines

When setting up Claude Code on a new machine:

```bash
# 1. Clone this repo
git clone https://github.com/ajjucoder/claude-code-guide.git
cd claude-code-guide

# 2. Run the installer
./install.sh

# 3. Add your API keys
# Edit ~/.claude/settings.json and add your Exa API key

# 4. Verify
mcp-cli servers
mcp-cli tools
```

---

## Configuration Files

| File | Location | Purpose |
|------|----------|---------|
| `settings.json` | `~/.claude/settings.json` | MCP server configuration |
| `CLAUDE.md` | `~/.claude/CLAUDE.md` | Global instructions for Claude |
| Project `CLAUDE.md` | `./CLAUDE.md` | Project-specific instructions |

---

## Troubleshooting

### MCPs not showing up

```bash
# Check if MCPs are configured
cat ~/.claude/settings.json

# Reinstall MCPs
npm install -g @anthropic/mcp-document-loader @anthropic/mcp-exa

# Restart Claude Code
```

### "Permission denied" errors

```bash
# Fix permissions
chmod +x install.sh
```

### API key errors (Exa)

1. Get your key from [exa.ai](https://exa.ai)
2. Add it to `~/.claude/settings.json`:
   ```json
   "env": {
     "EXA_API_KEY": "your-actual-key"
   }
   ```

---

## Contributing

Found something useful? Add it!

1. Fork this repo
2. Add your MCP/skill/agent/command
3. Update the relevant README
4. Open a PR

---

## License

MIT - Use freely, modify as needed.
