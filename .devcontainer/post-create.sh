#!/bin/bash
set -e

cd /workspace

# Named volumes can be created root-owned on first mount; fix so vscode can write to them
sudo chown -R vscode:vscode /home/vscode/.config/gh

# Bundle install if Gemfile exists
if [ -f Gemfile ]; then
  bundle install
fi

# DB setup if Rails app exists
if [ -f bin/rails ]; then
  bin/rails db:prepare 2>/dev/null || true
fi

echo "Dev container ready!"
