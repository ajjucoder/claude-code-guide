# Exa MCP

Web search and code context search powered by Exa.ai - a search engine designed for AI.

**Source:** [Exa MCP](https://github.com/exa-labs/exa-mcp)

## What It Does

| Tool | Description |
|------|-------------|
| `web_search_exa` | Search the web with AI-optimized results |
| `get_code_context_exa` | Search for code examples and implementations |

## Why Exa Over Built-in WebSearch?

| Feature | Built-in WebSearch | Exa MCP |
|---------|-------------------|---------|
| AI-optimized results | No | Yes |
| Code-specific search | No | Yes |
| Semantic understanding | Basic | Advanced |
| Result quality | Standard | Higher relevance |
| Rate limits | Stricter | More generous |

## Installation

### Prerequisites

- Node.js 18+ or Bun
- Claude Code CLI
- Exa API key (get one at [exa.ai](https://exa.ai))

### Step 1: Get Your Exa API Key

1. Go to [exa.ai](https://exa.ai)
2. Sign up for an account
3. Get your API key from the dashboard

### Step 2: Install the MCP Package

```bash
# Using npm
npm install -g @anthropic/mcp-exa

# Or using bun
bun add -g @anthropic/mcp-exa
```

### Step 3: Add to Claude Code Settings

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

**Alternative using Bun:**

```json
{
  "mcpServers": {
    "exa": {
      "command": "bunx",
      "args": ["@anthropic/mcp-exa"],
      "env": {
        "EXA_API_KEY": "your-exa-api-key-here"
      }
    }
  }
}
```

### Step 4: Verify Installation

```bash
# List available MCPs
mcp-cli servers

# Check the tools
mcp-cli tools exa

# Should show:
# exa/web_search_exa
# exa/get_code_context_exa
```

## Usage

### Web Search

```bash
# Check the schema first (REQUIRED)
mcp-cli info exa/web_search_exa

# Search the web
mcp-cli call exa/web_search_exa '{"query": "Next.js 15 server actions best practices"}'
```

### Code Context Search

```bash
# Check the schema first
mcp-cli info exa/get_code_context_exa

# Search for code examples
mcp-cli call exa/get_code_context_exa '{"query": "React useOptimistic hook example"}'
```

### Parameters

#### web_search_exa

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `query` | string | Yes | Search query |

#### get_code_context_exa

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `query` | string | Yes | Code-related search query |

## Auto-Detection in CLAUDE.md

Add this to your `~/.claude/CLAUDE.md` to make Claude automatically use Exa:

```markdown
### Web Search - Use `exa` MCP (NOT built-in WebSearch)

**ALWAYS use Exa for web searches:**
| Action | MCP Command |
|--------|-------------|
| Web search | `mcp-cli call exa/web_search_exa '{"query": "search terms here"}'` |
| Code context | `mcp-cli call exa/get_code_context_exa '{"query": "code search terms"}'` |

**When to use Exa:**
- User asks to search the web
- User asks "find", "search for", "look up" something online
- Need current information beyond knowledge cutoff
- Researching libraries, frameworks, or documentation
- Finding code examples or implementations

**NEVER use built-in WebSearch - always use Exa MCP**
```

## Use Cases

### 1. Documentation Search

```bash
mcp-cli call exa/web_search_exa '{"query": "Supabase RLS policies examples 2024"}'
```

### 2. Finding Code Examples

```bash
mcp-cli call exa/get_code_context_exa '{"query": "Next.js middleware authentication example"}'
```

### 3. Research Latest Practices

```bash
mcp-cli call exa/web_search_exa '{"query": "React 19 new features and best practices"}'
```

### 4. Troubleshooting

```bash
mcp-cli call exa/web_search_exa '{"query": "Vercel deployment error module not found solution"}'
```

## Troubleshooting

### "Invalid API key"

1. Check your API key at [exa.ai dashboard](https://exa.ai)
2. Make sure the key is set in `settings.json`:
   ```json
   "env": {
     "EXA_API_KEY": "your-actual-key-here"
   }
   ```
3. Restart Claude Code after updating settings

### "MCP not found"

```bash
# Reinstall
npm install -g @anthropic/mcp-exa

# Or try with npx directly
npx -y @anthropic/mcp-exa
```

### "Rate limit exceeded"

Exa has generous rate limits, but if you hit them:
- Wait a few seconds between requests
- Consider upgrading your Exa plan

## Pricing

Exa offers:
- Free tier with generous limits
- Paid tiers for higher usage

Check [exa.ai/pricing](https://exa.ai/pricing) for current pricing.

## License

MIT
