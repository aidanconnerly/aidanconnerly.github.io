#!/bin/bash

# Setup script for local Jekyll development environment
# This script checks prerequisites and installs dependencies

set -e  # Exit on error

echo "🔍 Checking prerequisites..."

# Check Ruby
if ! command -v ruby &> /dev/null; then
    echo "❌ Ruby is not installed. Please install Ruby first."
    echo "   On macOS: brew install ruby"
    exit 1
fi
RUBY_VERSION=$(ruby --version | cut -d' ' -f2)
echo "✅ Ruby $RUBY_VERSION found"

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    echo "   On macOS: brew install node"
    exit 1
fi
NODE_VERSION=$(node --version)
echo "✅ Node.js $NODE_VERSION found"

# Check npm
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. npm should come with Node.js."
    exit 1
fi
NPM_VERSION=$(npm --version)
echo "✅ npm $NPM_VERSION found"

# Set locale for UTF-8 support
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Use Homebrew Ruby if available
if [ -f "/opt/homebrew/opt/ruby/bin/ruby" ]; then
    export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
    echo "✅ Using Homebrew Ruby"
fi

# Install Bundler if not present
if ! command -v bundle &> /dev/null; then
    echo "📦 Installing Bundler..."
    gem install bundler
fi
echo "✅ Bundler found"

echo ""
echo "📦 Installing Ruby dependencies..."
bundle config set --local path 'vendor/bundle'
bundle install

echo ""
echo "📦 Installing Node.js dependencies..."
npm install

echo ""
echo "🔨 Building JavaScript assets..."
npm run build:js

echo ""
echo "✅ Setup complete! You can now run './dev.sh' to start the development server."

