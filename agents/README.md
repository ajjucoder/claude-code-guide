# Custom Agents

Custom agent personas for different types of tasks.

## Available Agents

| Agent | Description | Status |
|-------|-------------|--------|
| *Coming soon* | Add your agents here | - |

## Adding an Agent

1. Create a markdown file: `agents/your-agent.md`
2. Include:
   - Agent name and description
   - Persona instructions
   - Capabilities and limitations
   - Example interactions

## Using Agents

### Via /agent command

```bash
# Copy agent to commands folder
cp agents/your-agent.md ~/.claude/commands/agent-your-agent.md
```

Then use with `/agent your-agent` in Claude Code.

### Inline

Read the agent file and Claude will adopt the persona:
```
Read agents/your-agent.md and act as that agent
```
