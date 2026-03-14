#!/bin/bash
mkdir -p ~/.claude/agents
cp "$(dirname "$0")/.claude/agents/"* ~/.claude/agents/
echo "Claude subagents installed to ~/.claude/agents/"
