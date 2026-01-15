# Custom Skills

Custom skills for specialized workflows in Claude Code.

## Available Skills

| Skill | Description | Status |
|-------|-------------|--------|
| *Coming soon* | Add your skills here | - |

## Adding a Skill

1. Create a folder for your skill: `skills/your-skill-name/`
2. Include:
   - `SKILL.md` - Main skill instructions
   - `README.md` - Documentation
   - Any supporting files

## Using Skills

Skills are invoked by reading their instructions. Add them to your `~/.claude/commands/` for quick access:

```bash
cp -r skills/your-skill ~/.claude/commands/your-skill.md
```

Then use with `/your-skill` in Claude Code.
