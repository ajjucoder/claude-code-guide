# Document Loader MCP

Read PDF, Word, Excel, PowerPoint, and image files directly in Claude Code.

**Source:** [AWS Labs - Document Loader MCP](https://github.com/awslabs/mcp/tree/main/src/document-loader)

## What It Does

| Tool | File Types | Description |
|------|------------|-------------|
| `read_document` | PDF, Word, Excel, PowerPoint | Extract text content from documents |
| `read_image` | PNG, JPG, GIF, BMP, TIFF, WEBP | Load images for visual analysis |

## Installation

### Prerequisites

- Node.js 18+ or Bun
- Claude Code CLI

### Step 1: Install the MCP Package

```bash
# Using npm
npm install -g @anthropic/mcp-document-loader

# Or using bun
bun add -g @anthropic/mcp-document-loader
```

### Step 2: Add to Claude Code Settings

Edit your Claude Code settings file:

```bash
# macOS/Linux
~/.claude/settings.json

# Or open via Claude Code
claude config
```

Add this to the `mcpServers` section:

```json
{
  "mcpServers": {
    "document-loader-mcp": {
      "command": "npx",
      "args": ["-y", "@anthropic/mcp-document-loader"],
      "env": {}
    }
  }
}
```

**Alternative using Bun:**

```json
{
  "mcpServers": {
    "document-loader-mcp": {
      "command": "bunx",
      "args": ["@anthropic/mcp-document-loader"],
      "env": {}
    }
  }
}
```

### Step 3: Verify Installation

```bash
# List available MCPs
mcp-cli servers

# Check the tools
mcp-cli tools document-loader-mcp

# Should show:
# document-loader-mcp/read_document
# document-loader-mcp/read_image
```

## Usage

### Reading Documents

```bash
# Check the schema first (REQUIRED)
mcp-cli info document-loader-mcp/read_document

# Read a PDF
mcp-cli call document-loader-mcp/read_document '{"file_path": "/path/to/file.pdf", "file_type": "pdf"}'

# Read a Word document
mcp-cli call document-loader-mcp/read_document '{"file_path": "/path/to/file.docx", "file_type": "docx"}'

# Read an Excel file
mcp-cli call document-loader-mcp/read_document '{"file_path": "/path/to/file.xlsx", "file_type": "xlsx"}'

# Read a PowerPoint
mcp-cli call document-loader-mcp/read_document '{"file_path": "/path/to/file.pptx", "file_type": "pptx"}'
```

### Reading Images

```bash
# Check the schema first
mcp-cli info document-loader-mcp/read_image

# Read an image
mcp-cli call document-loader-mcp/read_image '{"file_path": "/path/to/image.png"}'
```

### Parameters

#### read_document

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `file_path` | string | Yes | Absolute path to the document |
| `file_type` | string | Yes | One of: `pdf`, `docx`, `doc`, `xlsx`, `xls`, `pptx`, `ppt` |
| `timeout_seconds` | integer | No | Timeout (default: 30, min: 5, max: 300) |

#### read_image

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `file_path` | string | Yes | Absolute path to the image |
| `timeout_seconds` | integer | No | Timeout (default: 30, min: 5, max: 300) |

## Auto-Detection in CLAUDE.md

Add this to your `~/.claude/CLAUDE.md` to make Claude automatically use this MCP:

```markdown
### Document Reading - Use `document-loader-mcp` (NOT built-in Read tool)

| File Extension | MCP Command |
|----------------|-------------|
| `.pdf` | `mcp-cli call document-loader-mcp/read_document '{"file_path": "/path/to/file.pdf", "file_type": "pdf"}'` |
| `.doc`, `.docx` | `mcp-cli call document-loader-mcp/read_document '{"file_path": "/path/to/file.docx", "file_type": "docx"}'` |
| `.ppt`, `.pptx` | `mcp-cli call document-loader-mcp/read_document '{"file_path": "/path/to/file.pptx", "file_type": "pptx"}'` |
| `.xls`, `.xlsx` | `mcp-cli call document-loader-mcp/read_document '{"file_path": "/path/to/file.xlsx", "file_type": "xlsx"}'` |

**Auto-detection rules:**
1. File path ends in .pdf, .doc, .docx, .ppt, .pptx, .xls, .xlsx → USE document-loader-mcp IMMEDIATELY
2. File path ends in .png, .jpg, .jpeg, .gif, .bmp, .tiff, .webp → USE document-loader-mcp/read_image
3. **NEVER ask "should I read this?"** - just read it automatically
```

## Troubleshooting

### "MCP not found"

```bash
# Reinstall
npm install -g @anthropic/mcp-document-loader

# Or try with npx directly
npx -y @anthropic/mcp-document-loader
```

### "Timeout" errors

Increase the timeout for large files:

```bash
mcp-cli call document-loader-mcp/read_document '{"file_path": "/path/to/large.pdf", "file_type": "pdf", "timeout_seconds": 120}'
```

### "File not found"

Always use absolute paths, not relative:

```bash
# Wrong
mcp-cli call document-loader-mcp/read_document '{"file_path": "file.pdf", "file_type": "pdf"}'

# Correct
mcp-cli call document-loader-mcp/read_document '{"file_path": "/Users/you/Documents/file.pdf", "file_type": "pdf"}'
```

## Why Use This Instead of Built-in Read?

| Feature | Built-in Read | document-loader-mcp |
|---------|---------------|---------------------|
| PDF extraction | Basic | Full text + structure |
| Word documents | No | Yes |
| Excel files | No | Yes |
| PowerPoint | No | Yes |
| Image analysis | Yes | Yes |
| Large files | Limited | Better handling |

## License

Apache 2.0 (AWS Labs)
