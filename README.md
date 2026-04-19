# atrey-dev

My personal development workspace — built for GitHub Codespaces.

---

## What is this repo?

`atrey-dev` is a portable coding workspace I can open in GitHub Codespaces and immediately start working in. It comes pre-configured with a development container (devcontainer) that installs the tools and VS Code extensions I need automatically.

Think of it as my base camp for learning and building with modern AI-assisted development workflows.

---

## What is a devcontainer?

A **devcontainer** (development container) is a Docker-based environment defined in code. Instead of manually installing tools on your machine, you describe everything your workspace needs in a `.devcontainer/devcontainer.json` file. When you open the project, the container is built automatically and you get a consistent, reproducible environment every time.

No more "works on my machine" problems. The environment travels with the repo.

---

## What is a GitHub Codespace?

A **GitHub Codespace** is a cloud-hosted development environment provided by GitHub. When you open a Codespace, GitHub spins up a virtual machine in the cloud, builds your devcontainer, and gives you a full VS Code editor in your browser (or connected via your local VS Code).

You get a real Linux machine with a real terminal, your real tools, and your real editor — accessible from any device with a browser.

---

## How to open this repo in a Codespace

1. Go to this repository on GitHub
2. Click the green **Code** button
3. Select the **Codespaces** tab
4. Click **Create codespace on main** (or your current branch)

GitHub will build the container (takes ~2–3 minutes the first time) and open VS Code in your browser. After the first build, subsequent starts are much faster.

---

## How to rebuild the container

If you change `.devcontainer/devcontainer.json` or need a fresh environment:

1. Open the Command Palette: `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
2. Type: `Codespaces: Rebuild Container`
3. Press Enter and wait for the rebuild to complete

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
├── .devcontainer/
│   └── devcontainer.json   # Container definition (tools + extensions)
├── .editorconfig           # Consistent editor settings across tools
├── .gitignore              # Files to exclude from git
├── Makefile                # Helpful project commands
├── PLAN.md                 # Goals, tasks, and next steps
├── README.md               # This file
└── package.json            # Node.js project file
```

---

## Notes

- This workspace uses **zsh** as the default shell inside the container.
- `pnpm` is the preferred Node package manager (faster than npm, uses less disk space).
- `pipx` is preferred for installing Python CLI tools (keeps them isolated).
- The container is based on a stable Ubuntu LTS image.
