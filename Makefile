# Makefile for atrey-dev
#
# Run `make help` to see available commands.
# All commands are lightweight — no heavy infrastructure required.

.DEFAULT_GOAL := help

# ── Help ──────────────────────────────────────────────────────────────────────

.PHONY: help
help: ## Show this help message
	@echo ""
	@echo "  atrey-dev — available commands"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'
	@echo ""

# ── Setup ─────────────────────────────────────────────────────────────────────

.PHONY: setup
setup: ## Install Node dependencies using pnpm
	@echo "→ Installing Node dependencies..."
	pnpm install
	@echo "✓ Done. Run 'make doctor' to verify your environment."

# ── Doctor ────────────────────────────────────────────────────────────────────

.PHONY: doctor
doctor: ## Check that all expected tools are installed and working
	@echo ""
	@echo "  Checking tools..."
	@echo ""
	@_check() { \
		if command -v $$1 > /dev/null 2>&1; then \
			printf "  \033[32m✓\033[0m %-12s %s\n" "$$1" "$$($$1 --version 2>&1 | head -1)"; \
		else \
			printf "  \033[31m✗\033[0m %-12s not found\n" "$$1"; \
		fi \
	}; \
	_check git; \
	_check node; \
	_check pnpm; \
	_check python3; \
	_check pipx; \
	_check gh; \
	_check zsh; \
	_check fzf; \
	_check rg; \
	_check jq; \
	_check tree; \
	_check bat; \
	_check eza; \
	_check fd; \
	_check make
	@echo ""

# ── Start ─────────────────────────────────────────────────────────────────────

.PHONY: start
start: ## Start the development server (runs `pnpm dev` if script exists)
	@if pnpm run | grep -q '"dev"'; then \
		echo "→ Starting dev server..."; \
		pnpm dev; \
	else \
		echo "No 'dev' script found in package.json."; \
		echo "Add a 'dev' script or edit this Makefile target to suit your project."; \
	fi
