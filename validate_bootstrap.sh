#!/bin/bash

# 🔍 Bootstrap Project Validation Script
# This script validates that the bootstrap_project.sh script would run successfully
# Usage: ./validate_bootstrap.sh

set -e

echo "🔍 Validating Bootstrap Project Requirements..."
echo "==============================================="

# Check if we're in a git repository
if [ -d ".git" ]; then
    echo "✅ Git repository detected"
else
    echo "❌ Not in a git repository"
    echo "💡 Run 'git init' to initialize a git repository"
    exit 1
fi

# Check Python installation
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version 2>&1 | cut -d' ' -f2 | cut -d'.' -f1-2)
    echo "✅ Python 3 found: $(python3 --version)"
    
    # Check if Python version is 3.11 or higher
    if python3 -c "import sys; sys.exit(0 if sys.version_info >= (3, 11) else 1)"; then
        echo "✅ Python version is 3.11 or higher"
    else
        echo "⚠️  Python version is less than 3.11, some features may not work"
    fi
else
    echo "❌ Python 3 not found"
    echo "💡 Install Python 3.11+ from https://python.org"
    exit 1
fi

# Check if pip is available
if command -v pip3 &> /dev/null; then
    echo "✅ pip3 is available"
else
    echo "❌ pip3 not found"
    echo "💡 Install pip3 or use 'python3 -m ensurepip'"
    exit 1
fi

# Check if make is available
if command -v make &> /dev/null; then
    echo "✅ make is available"
else
    echo "❌ make not found"
    echo "💡 Install make (usually comes with Xcode Command Line Tools on macOS)"
    exit 1
fi

# Check if we have write permissions
if [ -w "." ]; then
    echo "✅ Write permissions in current directory"
else
    echo "❌ No write permissions in current directory"
    exit 1
fi

# Check available disk space (at least 1GB)
if command -v df &> /dev/null; then
    AVAILABLE_KB=$(df . | tail -1 | awk '{print $4}')
    if [ "$AVAILABLE_KB" -gt 1048576 ]; then
        echo "✅ Sufficient disk space available"
    else
        echo "⚠️  Low disk space (less than 1GB available)"
    fi
else
    echo "⚠️  Could not check disk space"
fi

# Check if bootstrap_project.sh exists
if [ -f "bootstrap_project.sh" ]; then
    echo "✅ bootstrap_project.sh found"
    if [ -x "bootstrap_project.sh" ]; then
        echo "✅ bootstrap_project.sh is executable"
    else
        echo "⚠️  bootstrap_project.sh is not executable"
        echo "💡 Run 'chmod +x bootstrap_project.sh' to make it executable"
    fi
else
    echo "❌ bootstrap_project.sh not found in current directory"
    exit 1
fi

echo ""
echo "🎉 Validation Complete!"
echo "======================="
echo "✅ All requirements met for running bootstrap_project.sh"
echo ""
echo "🚀 To run the bootstrap script:"
echo "   ./bootstrap_project.sh [project_name]"
echo ""
echo "📋 What the script will do:"
echo "   1. Create a comprehensive Makefile"
echo "   2. Set up Python virtual environment with uv"
echo "   3. Initialize project structure"
echo "   4. Create documentation templates"
echo "   5. Install development tools"
echo "   6. Run tests to validate setup"
echo ""
echo "⚠️  Note: The script will modify files in the current directory"
echo "   Make sure you're in the right location before running it!"
