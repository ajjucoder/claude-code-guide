# Custom MCPs

Custom MCP (Model Context Protocol) servers that extend Claude Code's capabilities.

## Available MCPs

| MCP | Description | Documentation |
|-----|-------------|---------------|
| [document-loader-mcp](./document-loader-mcp/) | Read PDF, Word, Excel, PowerPoint, and image files | [Docs](./document-loader-mcp/README.md) |
| [exa-mcp](./exa-mcp/) | AI-powered web search and code context search | [Docs](./exa-mcp/README.md) |

## Quick Setup

### Install All MCPs

```bash
# Document Loader (no API key needed)
npm install -g @anthropic/mcp-document-loader

# Exa (requires API key from exa.ai)
npm install -g @anthropic/mcp-exa
```

### Configure Claude Code

Add to your `~/.claude/settings.json`:

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

### Verify Installation

```bash
# List all MCPs
mcp-cli servers

# List tools
mcp-cli tools document-loader-mcp
mcp-cli tools exa
```

---

## MCP Comparison

### Document Reading

| Feature | Built-in Read | document-loader-mcp |
|---------|---------------|---------------------|
| Text files | ✅ | ✅ |
| PDF | Basic | ✅ Full extraction |
| Word (.docx) | ❌ | ✅ |
| Excel (.xlsx) | ❌ | ✅ |
| PowerPoint (.pptx) | ❌ | ✅ |
| Images | ✅ | ✅ |

### Web Search

| Feature | Built-in WebSearch | Exa MCP |
|---------|-------------------|---------|
| Basic search | ✅ | ✅ |
| AI-optimized results | ❌ | ✅ |
| Code-specific search | ❌ | ✅ |
| Semantic understanding | Basic | Advanced |

---

## Adding New MCPs

1. Create a folder: `mcps/your-mcp-name/`
2. Include:
   - `README.md` - Documentation
   - `mcp.json` - MCP configuration
   - Installation instructions
3. Update this README with your MCP

## MCP File Structure

```
mcps/
├── README.md                    # This file
├── document-loader-mcp/
│   ├── README.md               # Full documentation
│   └── mcp.json                # Configuration
└── exa-mcp/
    ├── README.md               # Full documentation
    └── mcp.json                # Configuration
```

---

## Using MCPs

### Check Schema First (Required)

Before calling any MCP tool, check its schema:

```bash
mcp-cli info document-loader-mcp/read_document
mcp-cli info exa/web_search_exa
```

### Call MCP Tools

```bash
# Read a PDF
mcp-cli call document-loader-mcp/read_document '{"file_path": "/path/to/file.pdf", "file_type": "pdf"}'

# Search the web
mcp-cli call exa/web_search_exa '{"query": "your search query"}'
```

---

## Troubleshooting

### MCP not found

```bash
# Reinstall
npm install -g @anthropic/mcp-document-loader

# Check if installed
npm list -g @anthropic/mcp-document-loader
```

### Timeout errors

Add timeout parameter:

```bash
mcp-cli call document-loader-mcp/read_document '{"file_path": "/path/to/large.pdf", "file_type": "pdf", "timeout_seconds": 120}'
```

### API key errors

Check your `~/.claude/settings.json` has the correct API key in the `env` section.
