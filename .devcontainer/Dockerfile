FROM mcr.microsoft.com/devcontainers/ruby:3.4

# Isolate bundler-managed gems from the system gem path (used by ad-hoc
# `gem install`, e.g. VS Code's Ruby LSP extension) so the two can't race
# on the same native-extension build directory. Backed by the bundle_cache
# volume in docker-compose.yml.
ENV BUNDLE_PATH="/usr/local/bundle"

# System packages + Node.js (for Claude Code)
RUN apt-get update && apt-get install -y \
    tmux \
    libpq-dev \
    postgresql-client \
    build-essential \
    curl \
    wget \
    && curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Claude Code
RUN npm install -g @anthropic-ai/claude-code

USER vscode
