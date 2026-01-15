# Compaction Fix

Fixes the issue where Claude Code auto-compacts conversations too aggressively, losing important context.

## The Problem

Claude Code auto-compacts when context reaches ~95% capacity (~155K tokens with thinking models). The default compaction can lose important context from your conversation.

**Symptoms:**
- Conversations auto-compact after 10-15 minutes of detailed work
- Claude "forgets" what you were working on
- Lost context about file changes, decisions, and current tasks

## The Solution

Add these instructions to your `~/.claude/CLAUDE.md` file:

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

---

## Quick Install

```bash
curl -sSL https://raw.githubusercontent.com/ajjucoder/claude-code-guide/main/install.sh | bash
```

## Manual Install

1. Open your global Claude config:
   ```bash
   nano ~/.claude/CLAUDE.md
   ```

2. Paste the "Compaction Instructions" section above

3. Save and restart Claude Code
