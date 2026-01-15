#!/bin/bash

# Claude Code Guide Installer
# https://github.com/ajjucoder/claude-code-guide

set -e

CLAUDE_DIR="$HOME/.claude"
CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"
COMPACTION_MARKER="## Compaction Instructions"

echo ""
echo "╔════════════════════════════════════════╗"
echo "║     Claude Code Guide Installer        ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Create ~/.claude directory if needed
if [ ! -d "$CLAUDE_DIR" ]; then
    echo "Creating ~/.claude directory..."
    mkdir -p "$CLAUDE_DIR"
fi

# Create CLAUDE.md if needed
if [ ! -f "$CLAUDE_MD" ]; then
    echo "Creating ~/.claude/CLAUDE.md..."
    echo "# Global Instructions" > "$CLAUDE_MD"
    echo "" >> "$CLAUDE_MD"
fi

# Install compaction fix
echo "Installing compaction fix..."
if grep -q "$COMPACTION_MARKER" "$CLAUDE_MD" 2>/dev/null; then
    echo "  ✓ Compaction fix already installed"
else
    cat >> "$CLAUDE_MD" << 'EOF'

---

## Compaction Instructions

When auto-compaction triggers or `/compact` is used, follow these rules strictly:

### MUST Preserve (Full Detail)
1. **Last 10 messages** - Keep the most recent user/assistant exchanges verbatim
2. **Current task state** - What we're actively working on, pending items, blockers
3. **All file modifications** - Every file path, what changed, and why
4. **Code snippets written** - Actual code that was created or modified
5. **Decisions made** - Technical choices, user preferences, rejected alternatives
6. **Errors encountered** - Error messages, stack traces, and their resolutions
7. **Todo list state** - All pending, in-progress, and recently completed items

### MUST Summarize (Condensed)
1. **Exploration/research** - Condense to: "Searched X, found Y in Z location"
2. **File reads** - Condense to: "Read [file] - contains [key info]"
3. **Failed attempts** - Condense to: "Tried X, failed because Y"
4. **General discussion** - Extract only actionable conclusions

### MUST Include (Structured Summary Block)
```
## Session Context (Post-Compaction)
- **Project**: [name and path]
- **Current Task**: [what we're doing now]
- **Files Modified**: [list with brief descriptions]
- **Key Decisions**: [numbered list]
- **Pending Actions**: [what's left to do]
- **User Preferences Learned**: [any stated preferences]
```

### Priority Order
If space is limited, preserve in this order:
1. Current task context and last messages
2. File changes and code written
3. Decisions and user preferences
4. Error resolutions
5. Everything else as summary

EOF
    echo "  ✓ Compaction fix installed"
fi

echo ""
echo "════════════════════════════════════════"
echo "  Installation complete!"
echo ""
echo "  Config location: $CLAUDE_MD"
echo ""
echo "  Start a new Claude Code session to"
echo "  use the improvements."
echo "════════════════════════════════════════"
echo ""
