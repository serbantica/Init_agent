# Init Agent

A modern Python project for agent-based automation.

## Setup

```bash
# Setup the Python environment
make setup

# Install development tools
make devtools

# Run the application
make run
```

## Project Structure

- `src/` - Source code
  - `agents/` - Agent implementations
  - `api/` - API endpoints
  - `orchestrator/` - Orchestration logic
- `docs/` - Documentation
- `tests/` - Test files
- `configs/` - Configuration files
- `pipelines/` - CI/CD pipelines
- `infra/` - Infrastructure code

## Development

- Uses `uv` for fast dependency management
- Follows modern Python project structure
- Includes comprehensive documentation templates


### 🚀 Deployment Commands

- `make deploy-azure RESOURCE_GROUP=<your-group>` — Deploy infra to Azure using Bicep and parameters.json
- `make deploy-aws` — Placeholder for future Terraform support (not yet implemented)

### ♻️ Project Reuse

- `make template-clone NAME=<your-new-project>` — Clone this blueprint into a new project folder with the specified name

### 🧼 Cleanup Utilities

- `make reset` — Clean runtime-generated logs and checkpoint directories for a fresh run