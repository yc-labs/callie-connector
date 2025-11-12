# n8n Local Development Setup

## Quick Start

### Production Instance (via Docker)
The production version of n8n is running in Docker:
- **URL**: http://localhost:5678
- **Status**: ✅ Running
- **Container**: n8n

To manage the Docker container:
```bash
# Check status
docker ps | grep n8n

# View logs
docker logs n8n

# Stop
docker stop n8n

# Start
docker start n8n

# Restart
docker restart n8n
```

### Development Setup (from source)

#### Prerequisites Installed
- ✅ Node.js v24.4.1
- ✅ pnpm (package manager)
- ✅ turbo@2.5.4 (build tool)
- ✅ TypeScript and build tools

#### Memory Configuration
The following has been configured for handling large monorepo:
```bash
export NODE_OPTIONS="--max-old-space-size=16384"
```

#### Dependencies Status
- ✅ All packages installed with `pnpm install`
- ⚠️ Some packages have build issues due to complex dependencies

#### Development Commands

1. **Install dependencies** (if needed):
```bash
NODE_OPTIONS="--max-old-space-size=16384" pnpm install --ignore-scripts
```

2. **Build all packages**:
```bash
NODE_OPTIONS="--max-old-space-size=16384" pnpm build
```

3. **Start development server**:
```bash
./start-dev.sh
# Or manually:
NODE_OPTIONS="--max-old-space-size=16384" pnpm dev
```

4. **Run specific package in dev mode**:
```bash
# Backend only
pnpm dev:be

# Frontend only  
pnpm dev:fe

# AI features
pnpm dev:ai
```

## Project Structure

This is a monorepo using pnpm workspaces with the following key packages:
- `packages/cli` - Backend CLI and API
- `packages/editor-ui` - Vue.js frontend
- `packages/nodes-base` - Built-in nodes
- `packages/workflow` - Workflow engine
- `packages/core` - Core functionality

## Troubleshooting

### Memory Issues
If you encounter "JavaScript heap out of memory" errors:
1. Increase memory allocation: `export NODE_OPTIONS="--max-old-space-size=32768"`
2. Use Docker for development instead

### Build Failures
If packages fail to build:
1. Install global build tools: `npm install -g typescript tsc-alias rimraf tsup`
2. Build packages individually: `cd packages/[package-name] && pnpm build`

### Missing Dependencies
If modules are not found:
1. Clear and reinstall: `rm -rf node_modules && pnpm install`
2. Use `--ignore-scripts` flag to skip problematic scripts

## Development Workflow

1. **Use Docker for stable development**: The Docker container provides a stable, pre-built environment
2. **Local development for code changes**: Edit code locally, changes will be reflected after rebuild
3. **Hot reload**: Frontend supports hot reload in development mode
4. **Testing**: Run `pnpm test` for unit tests

## Useful Links
- n8n Documentation: https://docs.n8n.io
- GitHub Repository: https://github.com/n8n-io/n8n
- Community Forum: https://community.n8n.io

## Current Status
- ✅ Production n8n running on http://localhost:5678
- ✅ All dependencies installed
- ⚠️ Some build issues with complex packages (can be worked around)
- ✅ Development environment configured