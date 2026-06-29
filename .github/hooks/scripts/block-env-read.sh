#!/usr/bin/env bash
# Block agent from reading .env files (any variant: .env, .env.local, .env.production, etc.)
# Hook event: PreToolUse

set -euo pipefail

input=$(cat)

tool_name=$(echo "$input" | python3 -c "
import sys, json
d = json.load(sys.stdin)
print(d.get('toolName', ''))
" 2>/dev/null || echo "")

deny() {
  python3 -c "
import json
print(json.dumps({
  'hookSpecificOutput': {
    'hookEventName': 'PreToolUse',
    'permissionDecision': 'deny',
    'permissionDecisionReason': '.env files may contain secrets and cannot be read by the agent. Ask the user to share specific values if needed.'
  }
}))
"
  exit 0
}

# Returns 0 (true) if value looks like a .env file path or glob
matches_env() {
  echo "$1" | grep -qiE '(^|[/\\])\.env([._-]|$)'
}

case "$tool_name" in
  read_file)
    file_path=$(echo "$input" | python3 -c "
import sys, json
d = json.load(sys.stdin)
print(d.get('toolInput', {}).get('filePath', ''))
" 2>/dev/null || echo "")
    if matches_env "$file_path"; then
      deny
    fi
    ;;

  grep_search)
    include=$(echo "$input" | python3 -c "
import sys, json
d = json.load(sys.stdin)
print(d.get('toolInput', {}).get('includePattern', ''))
" 2>/dev/null || echo "")
    if matches_env "$include"; then
      deny
    fi
    ;;

  file_search|semantic_search)
    query=$(echo "$input" | python3 -c "
import sys, json
d = json.load(sys.stdin)
print(d.get('toolInput', {}).get('query', ''))
" 2>/dev/null || echo "")
    if matches_env "$query"; then
      deny
    fi
    ;;

  run_in_terminal)
    command=$(echo "$input" | python3 -c "
import sys, json
d = json.load(sys.stdin)
print(d.get('toolInput', {}).get('command', ''))
" 2>/dev/null || echo "")
    # Block shell commands that print/read .env file contents
    if echo "$command" | grep -qiE '(cat|head|tail|less|more|bat|type|open|print)\s[^|]*\.env([._-]|\s|$|"|\x27)'; then
      deny
    fi
    ;;
esac

# Allow all other tool calls
exit 0
