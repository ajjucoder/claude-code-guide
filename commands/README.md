# Custom Commands

Custom slash commands for quick actions in Claude Code.

## Available Commands

| Command | Description | Status |
|---------|-------------|--------|
| *Coming soon* | Add your commands here | - |

## Adding a Command

1. Create a markdown file: `commands/your-command.md`
2. Include the command instructions

## Installing Commands

```bash
# Copy to Claude commands folder
cp commands/your-command.md ~/.claude/commands/

# Now use with /your-command in Claude Code
```

## Command Format

Commands are markdown files with instructions that Claude follows when invoked:

```markdown
# Your Command Name

When this command is invoked, do the following:

1. Step one
2. Step two
3. Step three
```
