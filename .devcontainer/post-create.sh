#!/bin/bash
set -e

cd /workspaces/rails-book-shelf

# Named volumes can be created root-owned on first mount; fix so vscode can write to them
sudo chown -R vscode:vscode /home/vscode/.config/gh

# Bundle install if Gemfile exists
# --jobs=1: parallel installation of native extension gems has been observed
# to race and fail intermittently in this container, so install serially.
if [ -f Gemfile ]; then
  bundle install --jobs=1
fi

# DB setup if Rails app exists
if [ -f bin/rails ]; then
  bin/rails db:prepare 2>/dev/null || true
fi

echo "Dev container ready!"
