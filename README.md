# Next Level GitHub Copilot - Workshop Solution

This repository contains the solution and example skills for the [Next Level GitHub Copilot Workshop](https://alexop.dev/posts/vs-code-copilot-workshop/).

## About the Workshop

The workshop teaches how to transform GitHub Copilot from a basic code completion tool into an intelligent agent system. It covers:

- **Context Engineering** - The art of filling the context window with the right information
- **AGENTS.md** - An open standard for agent-specific documentation
- **Subagents** - Specialized agents for focused tasks like file searches and web research
- **Skills** - Portable, on-demand workflow files that extend AI capabilities

## Project Structure

```
.github/skills/
├── skill-creator/       # Meta-skill for creating other skills
│   ├── SKILL.md
│   └── scripts/         # Python tools for skill management
├── frontend-design/     # UI/UX creation skill
├── vue-ai-assistant/    # Vue.js knowledge assistant
├── code-simplifier/     # Code refinement skill
├── excalidraw/          # Diagram visualization skill
└── hello/               # Minimal example skill
```

## Included Skills

| Skill | Description |
|-------|-------------|
| **skill-creator** | Guide for building effective AI skills with validation and packaging tools |
| **frontend-design** | Creates distinctive, production-grade web interfaces |
| **vue-ai-assistant** | Answers Vue.js and AI-related questions |
| **code-simplifier** | Refines code for clarity and consistency |
| **excalidraw** | Manages diagram and architecture visualization |
| **hello** | Minimal template skill |

## Getting Started

1. Clone this repository
2. Open in VS Code with GitHub Copilot enabled
3. Enable agent skills in VS Code settings
4. Use `/skill-creator` to explore or create new skills

## Creating Your Own Skill

Each skill follows this structure:

```
skill-name/
├── SKILL.md           # Required - frontmatter + instructions
├── scripts/           # Optional - executable code
├── references/        # Optional - documentation
└── assets/            # Optional - templates, icons
```

Run the skill creator to initialize a new skill:

```bash
python .github/skills/skill-creator/scripts/init_skill.py my-skill
```

## Resources

- [Workshop Post](https://alexop.dev/posts/vs-code-copilot-workshop/)
- [AGENTS.md Standard](https://agents-md.github.io/)

## License

See individual skill directories for license information.
