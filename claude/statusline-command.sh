#!/bin/bash
# Claude Code status line
# Shows: model name | git branch | context window usage
# Styled with the Catppuccin Mocha palette (see dotfiles/starship.toml)

input=$(cat)

# Catppuccin Mocha (truecolor, ANSI-C quoted so escapes are literal bytes)
MAUVE=$'\033[38;2;203;166;247m'
YELLOW=$'\033[38;2;249;226;175m'
GREEN=$'\033[38;2;166;227;161m'
RED=$'\033[38;2;243;139;168m'
SUBTEXT=$'\033[38;2;166;173;200m'
RESET=$'\033[0m'

SEP="${SUBTEXT} · ${RESET}"

# --- Model name ---
model=$(echo "$input" | jq -r '.model.display_name // "unknown"')
segment_model="${MAUVE}${model}${RESET}"

# --- Git branch ---
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // "."')
branch=$(git -C "$cwd" --no-optional-locks branch --show-current 2>/dev/null)
segment_branch=""
if [ -n "$branch" ]; then
  segment_branch="${YELLOW} ${branch}${RESET}"
fi

# --- Context window usage ---
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
segment_context=""
if [ -n "$used" ]; then
  used_int=$(printf '%.0f' "$used")
  ctx_color="$GREEN"
  if [ "$used_int" -ge 80 ]; then
    ctx_color="$RED"
  elif [ "$used_int" -ge 50 ]; then
    ctx_color="$YELLOW"
  fi
  segment_context="${ctx_color}Ctx ${used_int}%${RESET}"
fi

out="$segment_model"
if [ -n "$segment_branch" ]; then
  out="${out}${SEP}${segment_branch}"
fi
if [ -n "$segment_context" ]; then
  out="${out}${SEP}${segment_context}"
fi

printf "%s" "$out"
