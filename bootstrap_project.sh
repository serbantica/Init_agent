#!/bin/bash

# 🚀 Project Bootstrap Script
# This script creates a complete project structure following the SETUP.md instructions
# Usage: ./bootstrap_project.sh [project_name]

set -e  # Exit on any error

PROJECT_NAME=${1:-"init_agent"}
PROJECT_DIR=$(pwd)

echo "🎯 Bootstrapping project: $PROJECT_NAME"
echo "📂 Working directory: $PROJECT_DIR"

# ===============================================
# 1. Create Makefile with complete content
# ===============================================
echo "📝 Creating Makefile..."
cat > Makefile << 'EOF'
.PHONY: init logs checkpoint clean setup devtools run test

# 💥 Initialize project structure
init:
	mkdir -p infra src/orchestrator src/agents src/api
	mkdir -p configs pipelines tests
	mkdir -p docs logs .checkpoints
	touch README.md
	touch docs/charter.md docs/ethics.md docs/cost_control.md
	touch docs/architecture.md docs/working_agreement.md docs/changelog.md
	echo "logs/" >> .gitignore
	echo ".checkpoints/" >> .gitignore
	echo ".venv/" >> .gitignore
	echo "__pycache__/" >> .gitignore
	echo "*.pyc" >> .gitignore
	echo "*.pyo" >> .gitignore
	echo "*.pyd" >> .gitignore
	echo ".Python" >> .gitignore
	echo "*.egg-info/" >> .gitignore
	echo "✅ Initialized project structure."

# 📓 Create today's log file
logs:
	@DATE=$$(date +%Y-%m-%d); \
	FILE=logs/$${DATE}_session.md; \
	echo "# Log — $${DATE}" > $$FILE; \
	echo "Created log file: $$FILE"

# 📌 Mark phase completion
checkpoint:
	@DATE=$$(date +%Y-%m-%d); \
	echo "✅ Phase checkpoint saved on $${DATE}" > .checkpoints/phase0_complete.md

# 🧹 Clean all non-Git files
clean:
	rm -rf logs/* .checkpoints/* docs/*.md
	echo "🧨 Cleaned logs, checkpoints, and docs"

# 🐍 Setup Python environment using uv (https://github.com/astral-sh/uv)
setup:
	@echo "🔧 Installing uv and setting up Python environment..."
	@python3 -m pip install --upgrade pip
	@python3 -m pip install uv
	@uv venv .venv
	@uv init || echo "pyproject.toml already exists"
	@uv sync
	@echo "✅ Python virtual environment set up at .venv/"

# 🧪 Install dev dependencies (optional)
devtools:
	@. .venv/bin/activate && uv pip install ruff pytest black

# 🏃 Run a script (placeholder)
run:
	@. .venv/bin/activate && python main.py

# 🧪 Run tests
test:
	@. .venv/bin/activate && python -m pytest tests/ -v

# 📋 Show available commands
help:
	@echo "Available commands:"
	@echo "  make init      - Initialize project structure"
	@echo "  make setup     - Setup Python environment with uv"
	@echo "  make logs      - Create today's log file"
	@echo "  make checkpoint- Mark phase completion"
	@echo "  make devtools  - Install development tools"
	@echo "  make run       - Run the main application"
	@echo "  make test      - Run tests"
	@echo "  make clean     - Clean temporary files"
	@echo "  make help      - Show this help message"
EOF

echo "✅ Makefile created successfully"

# ===============================================
# 2. Create SETUP.md guide
# ===============================================
echo "📝 Creating SETUP.md guide..."
cat > SETUP.md << 'EOF'
## ✅ Phase 0 — Project Bootstrap To-Do List

### 🛠 Repo & Structure
- Create a new GitHub repo (e.g. `Init_agent`)
- Add the latest `Makefile` to project root
- (Optional) Add `SETUP.md` guide to repo

### ⚙️ Local Dev Environment
- `make setup` — Install `uv`, create `.venv`, generate `pyproject.toml`
- `make init` — Create folders: `docs/`, `src/`, `infra/`, `logs/`, etc.
- `make logs` — Create today's communication log file
- `make checkpoint` — Mark Phase 0 as complete

### 🧠 Project Identity
- Customize `docs/charter.md` (problem, users, solution, metrics)
- Review and edit other docs: `ethics.md`, `cost_control.md`, `architecture.md`

### 🐍 Optional Enhancements
- `make devtools` — Install `ruff`, `pytest`, `black`, etc.
- Add `README.md` with Makefile command table
- Commit + push all changes to GitHub

### 🧪 Testing & Validation
- `make test` — Run the test suite
- `make run` — Execute the main application
- Verify all commands work correctly

### 📚 Documentation
- Update `README.md` with project-specific information
- Fill in documentation templates in `docs/`
- Add API documentation if building web services
EOF

echo "✅ SETUP.md created successfully"

# ===============================================
# 3. Create main.py file
# ===============================================
echo "📝 Creating main.py..."
cat > main.py << 'EOF'
def main():
    print("Hello from init-agent!")
    print("🚀 Project is ready for development!")


if __name__ == "__main__":
    main()
EOF

echo "✅ main.py created successfully"

# ===============================================
# 4. Create basic pyproject.toml
# ===============================================
echo "📝 Creating pyproject.toml..."
cat > pyproject.toml << 'EOF'
[project]
name = "init-agent"
version = "0.1.0"
description = "Add your description here"
readme = "README.md"
requires-python = ">=3.11"
dependencies = [
    "fastapi>=0.115.14",
    "openai>=1.93.0",
]

[dependency-groups]
dev = [
    "pytest>=8.4.1",
    "ruff>=0.12.2",
    "black>=24.0.0",
]

[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"

[tool.pytest.ini_options]
testpaths = ["tests"]
python_files = ["test_*.py", "*_test.py"]
python_classes = ["Test*"]
python_functions = ["test_*"]

[tool.ruff]
line-length = 88
target-version = "py311"

[tool.ruff.lint]
select = ["E", "F", "W", "C90", "I", "N", "D", "UP", "YTT", "ANN", "S", "BLE", "FBT", "B", "A", "COM", "C4", "DTZ", "T10", "DJ", "EM", "EXE", "FA", "ISC", "ICN", "G", "INP", "PIE", "T20", "PYI", "PT", "Q", "RSE", "RET", "SLF", "SLOT", "SIM", "TID", "TCH", "INT", "ARG", "PTH", "ERA", "PD", "PGH", "PL", "TRY", "FLY", "NPY", "AIR", "PERF", "FURB", "LOG", "RUF"]
ignore = ["D100", "D101", "D102", "D103", "D104", "D105", "D106", "D107", "ANN101", "ANN102"]

[tool.black]
line-length = 88
target-version = ['py311']
EOF

echo "✅ pyproject.toml created successfully"

# ===============================================
# 5. Execute SETUP instructions
# ===============================================
echo ""
echo "🚀 Executing SETUP instructions..."
echo ""

# Phase 1: Setup Python environment
echo "🔧 Phase 1: Setting up Python environment..."
if command -v python3 &> /dev/null; then
    make setup
    echo "✅ Python environment setup completed"
else
    echo "❌ Python3 not found. Please install Python 3.11+ first."
    exit 1
fi

# Phase 2: Initialize project structure
echo "🏗️  Phase 2: Initializing project structure..."
make init
echo "✅ Project structure initialized"

# Phase 3: Create today's log
echo "📝 Phase 3: Creating today's log..."
make logs
echo "✅ Log file created"

# Phase 4: Create basic Python package structure
echo "🐍 Phase 4: Creating Python package structure..."
echo '"""Init Agent package."""' > src/__init__.py
echo '"""Agents module."""' > src/agents/__init__.py
echo '"""API module."""' > src/api/__init__.py
echo '"""Orchestrator module."""' > src/orchestrator/__init__.py
echo '"""Test configuration and utilities."""' > tests/__init__.py

# Create a basic test
cat > tests/test_main.py << 'EOF'
"""Test main module."""
import pytest
from main import main


def test_main():
    """Test that main function runs without error."""
    try:
        main()
        assert True
    except Exception as e:
        pytest.fail(f"main() raised {e} unexpectedly!")
EOF

echo "✅ Python package structure created"

# Phase 5: Create comprehensive README
echo "📚 Phase 5: Creating comprehensive README..."
cat > README.md << 'EOF'
# Init Agent

A modern Python project for agent-based automation.

## Quick Start

```bash
# Setup the Python environment
make setup

# Install development tools
make devtools

# Run the application
make run

# Run tests
make test
```

## Available Commands

| Command | Description |
|---------|-------------|
| `make init` | Initialize project structure |
| `make setup` | Setup Python environment with uv |
| `make logs` | Create today's log file |
| `make checkpoint` | Mark phase completion |
| `make devtools` | Install development tools |
| `make run` | Run the main application |
| `make test` | Run tests |
| `make clean` | Clean temporary files |
| `make help` | Show available commands |

## Project Structure

```
├── src/                    # Source code
│   ├── agents/            # Agent implementations
│   ├── api/               # API endpoints
│   └── orchestrator/      # Orchestration logic
├── docs/                  # Documentation
│   ├── charter.md         # Project charter
│   ├── architecture.md    # Architecture documentation
│   ├── ethics.md          # Ethics guidelines
│   └── cost_control.md    # Cost control measures
├── tests/                 # Test files
├── configs/               # Configuration files
├── pipelines/             # CI/CD pipelines
├── infra/                 # Infrastructure code
├── logs/                  # Session logs
└── .checkpoints/          # Project checkpoints
```

## Development

- Uses `uv` for fast dependency management
- Follows modern Python project structure
- Includes comprehensive documentation templates
- Ready for CI/CD integration

## Dependencies

- Python 3.11+
- FastAPI for web services
- OpenAI for AI capabilities
- Pytest for testing
- Ruff for linting
- Black for code formatting

## License

MIT License
EOF

echo "✅ README.md created"

# Phase 6: Create documentation templates
echo "📖 Phase 6: Creating documentation templates..."

cat > docs/charter.md << 'EOF'
# Project Charter

## Problem Statement
*Define the problem this project aims to solve*

## Target Users
*Who will use this system?*

## Solution Overview
*High-level description of the proposed solution*

## Success Metrics
*How will we measure success?*

## Timeline
*Key milestones and deadlines*

## Resources
*Required resources and constraints*
EOF

cat > docs/architecture.md << 'EOF'
# Architecture Documentation

## System Overview
*High-level architecture diagram and description*

## Components
*Detailed description of system components*

## Data Flow
*How data moves through the system*

## API Design
*API endpoints and data models*

## Security Considerations
*Security measures and best practices*

## Performance Requirements
*Performance targets and optimization strategies*
EOF

cat > docs/ethics.md << 'EOF'
# Ethics Guidelines

## Ethical Principles
*Core ethical principles governing this project*

## Data Privacy
*How user data is handled and protected*

## Fairness and Bias
*Measures to ensure fairness and prevent bias*

## Transparency
*How decisions are made transparent to users*

## Accountability
*Who is responsible for system behavior*

## Human Oversight
*Role of human oversight in system operations*
EOF

cat > docs/cost_control.md << 'EOF'
# Cost Control Measures

## Budget Overview
*Project budget and cost breakdown*

## Resource Monitoring
*How resources are monitored and controlled*

## Cost Optimization
*Strategies for optimizing costs*

## Alerts and Thresholds
*Cost alerts and spending thresholds*

## Regular Reviews
*Schedule for cost reviews and adjustments*
EOF

cat > docs/working_agreement.md << 'EOF'
# Working Agreement

## Team Structure
*Roles and responsibilities*

## Communication
*Communication channels and protocols*

## Development Process
*Development workflow and practices*

## Quality Standards
*Code quality and review standards*

## Meeting Schedule
*Regular meetings and cadence*

## Decision Making
*How decisions are made and documented*
EOF

cat > docs/changelog.md << 'EOF'
# Changelog

## [Unreleased]
### Added
- Initial project structure
- Basic makefile with development commands
- Documentation templates

### Changed
- N/A

### Fixed
- N/A

## [0.1.0] - $(date +%Y-%m-%d)
### Added
- Project initialization
- Basic Python package structure
- Development environment setup
EOF

echo "✅ Documentation templates created"

# Phase 7: Install development tools
echo "🛠️  Phase 7: Installing development tools..."
make devtools
echo "✅ Development tools installed"

# Phase 8: Mark checkpoint
echo "📌 Phase 8: Marking phase completion..."
make checkpoint
echo "✅ Phase 0 checkpoint marked"

# Phase 9: Validation
echo "🧪 Phase 9: Validating setup..."
echo "Running tests..."
make test
echo "Running main application..."
make run
echo "✅ Validation completed"

# ===============================================
# 6. Final summary
# ===============================================
echo ""
echo "🎉 Project Bootstrap Complete!"
echo "=================================="
echo "✅ Makefile created with all commands"
echo "✅ Python environment set up with uv"
echo "✅ Project structure initialized"
echo "✅ Documentation templates created"
echo "✅ Development tools installed"
echo "✅ Tests passing"
echo "✅ Application running"
echo ""
echo "📋 Next steps:"
echo "1. Customize docs/charter.md with your project details"
echo "2. Review and edit other documentation files"
echo "3. Add your implementation in src/ directories"
echo "4. Write comprehensive tests"
echo "5. Set up CI/CD pipeline"
echo "6. Create GitHub repository and push changes"
echo ""
echo "🚀 Your project is ready for development!"
echo "Use 'make help' to see all available commands."
