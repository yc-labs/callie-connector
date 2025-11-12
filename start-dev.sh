#!/bin/bash

# n8n Development Startup Script
echo "Starting n8n development environment..."

# Set environment variables
export NODE_OPTIONS="--max-old-space-size=16384"
export N8N_PORT=5679
export N8N_HOST=localhost
export N8N_PROTOCOL=http
export N8N_EDITOR_BASE_URL=http://localhost:5679
export WEBHOOK_URL=http://localhost:5679
export DB_TYPE=sqlite
export DB_SQLITE_DATABASE=~/.n8n/database-dev.sqlite
export NODE_ENV=development
export N8N_LOG_LEVEL=debug

# Ensure dependencies are installed
echo "Checking dependencies..."
if [ ! -d "node_modules" ]; then
    echo "Installing dependencies..."
    pnpm install --ignore-scripts --prefer-offline
fi

# Start development server
echo "Starting n8n on port 5679..."
echo "Note: Production n8n is running on port 5678 via Docker"
echo ""
echo "To develop:"
echo "1. Production: http://localhost:5678"
echo "2. Development: http://localhost:5679 (once built)"
echo ""

# Try to start with turbo first
if command -v turbo &> /dev/null; then
    echo "Starting with turbo dev..."
    pnpm dev
else
    echo "Turbo not found, trying direct start..."
    cd packages/cli
    node bin/n8n start
fi