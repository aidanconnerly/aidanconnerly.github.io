#!/bin/bash

# Development server startup script
# Starts Jekyll with live reload and npm watch for JavaScript

set -e  # Exit on error

# Set locale for UTF-8 support
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Use Homebrew Ruby if available
if [ -f "/opt/homebrew/opt/ruby/bin/ruby" ]; then
    export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
fi

echo "🚀 Starting Jekyll development server..."
echo "   Site will be available at http://localhost:4000"
echo "   Press Ctrl+C to stop"
echo ""

# Start Jekyll server in the background
bundle exec jekyll serve -l -H localhost &
JEKYLL_PID=$!

# Function to cleanup on exit
cleanup() {
    echo ""
    echo "🛑 Stopping development server..."
    kill $JEKYLL_PID 2>/dev/null || true
    exit 0
}

# Trap Ctrl+C
trap cleanup INT TERM

# Wait for Jekyll to start
sleep 3

# Start npm watch in the background (optional, can be run separately)
# Uncomment the following lines if you want automatic JS rebuilding:
# echo "👀 Watching JavaScript files for changes..."
# npm run watch:js &
# WATCH_PID=$!
# trap "kill $JEKYLL_PID $WATCH_PID 2>/dev/null || true" INT TERM

# Wait for Jekyll process
wait $JEKYLL_PID

