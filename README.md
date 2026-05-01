# atrey-dev

My personal development workspace.

---

## What is this repo?

`atrey-dev` is a coding workspace for learning and building with modern AI-assisted development workflows.

---

## Tools included

| Tool | Purpose |
|------|---------|
| `git` | Version control |
| `node` (LTS) | JavaScript runtime |
| `pnpm` | Fast, disk-efficient Node package manager |
| `python3` | Python runtime |
| `pipx` | Install Python CLI tools in isolated environments |
| `gh` | GitHub CLI — manage repos, PRs, and more from the terminal |
| `zsh` | Better shell with tab completion and plugins |
| `fzf` | Fuzzy file/command finder |
| `ripgrep` (`rg`) | Fast code search |
| `jq` | Parse and query JSON from the terminal |
| `tree` | Visualise directory structure |
| `bat` | `cat` with syntax highlighting |
| `eza` | Modern `ls` replacement with colour and icons |
| `fd` | Simpler, faster `find` replacement |
| `unzip` | Extract ZIP archives |
| `make` | Run project commands via Makefile |

VS Code extensions installed automatically:

- **GitHub Copilot** — AI code completions
- **GitHub Copilot Chat** — AI chat assistant in the editor
- **Prettier** — Opinionated code formatter
- **ESLint** — JavaScript/TypeScript linting
- **Python** — Python language support
- **Markdown All in One** — Markdown editing, preview, and shortcuts

---

## Getting started

Once your Codespace is open, try these commands in the terminal:

```bash
# See available Makefile commands
make help

# Check that your tools are working
make doctor

# Install Node dependencies (from package.json)
make setup

# Search for a file quickly
fzf

# Search code content
rg "some text"

# Browse files visually
eza --tree --level=2

# Pretty-print a JSON file
cat some-file.json | jq

# Check Node version
node --version

# Check Python version
python3 --version

# Use the GitHub CLI
gh repo view
```

---

## Project structure

```
atrey-dev/
├── .editorconfig           # Consistent editor settings across tools
├── .gitignore              # Files to exclude from git
├── Makefile                # Helpful project commands
├── PLAN.md                 # Goals, tasks, and next steps
├── README.md               # This file
└── package.json            # Node.js project file
```

---

## Notes

- `pnpm` is the preferred Node package manager (faster than npm, uses less disk space).
- `pipx` is preferred for installing Python CLI tools (keeps them isolated).
