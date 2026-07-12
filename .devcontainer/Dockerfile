FROM mcr.microsoft.com/devcontainers/ruby:3.4

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
