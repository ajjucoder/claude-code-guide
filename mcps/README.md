# Custom MCPs

Custom MCP (Model Context Protocol) servers that extend Claude Code's capabilities.

## Available MCPs

| MCP | Description | Status |
|-----|-------------|--------|
| *Coming soon* | Add your MCPs here | - |

## Adding an MCP

1. Create a folder for your MCP: `mcps/your-mcp-name/`
2. Include:
   - `README.md` - Documentation
   - Source code or installation instructions
   - `mcp.json` - MCP configuration (if applicable)

## Installing MCPs

### Manual Installation

```bash
# Copy MCP to your Claude config
cp -r mcps/your-mcp ~/.claude/mcps/

# Add to your settings.json
```

### Using mcp-cli

```bash
# Check available MCPs
mcp-cli servers

# Test an MCP
mcp-cli info your-mcp/tool-name
```
