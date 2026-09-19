#!/bin/bash
# Claude Code status line
# Shows: directory | git branch | model name | context window usage | time
# Styled with the Catppuccin Mocha palette, mirroring the fish/starship
# prompt config at ~/.config/starship.toml (fish has no plain PS1 — the
# interactive prompt is rendered by starship, so segments/colors below are
# adapted from that config instead of a literal PS1 string).

input=$(cat)

# Catppuccin Mocha (truecolor, ANSI-C quoted so escapes are literal bytes)
PEACH=$'\033[38;2;250;179;135m'
MAUVE=$'\033[38;2;203;166;247m'
YELLOW=$'\033[38;2;249;226;175m'
GREEN=$'\033[38;2;166;227;161m'
RED=$'\033[38;2;243;139;168m'
LAVENDER=$'\033[38;2;180;190;254m'
SUBTEXT=$'\033[38;2;166;173;200m'
RESET=$'\033[0m'

SEP="${SUBTEXT} · ${RESET}"

# --- Directory (mirrors starship [directory] truncation_length = 3) ---
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // "."')
dir_display=$(printf '%s' "$cwd" | awk -F/ '{
  n = NF
  if (n <= 3) { print; exit }
  out = ""
  for (i = n - 2; i <= n; i++) out = out "/" $i
  print "…" out
}')
segment_dir="${PEACH}${dir_display}${RESET}"

# --- Git branch (mirrors starship [git_branch], skips optional locks) ---
branch=$(git -C "$cwd" --no-optional-locks branch --show-current 2>/dev/null)
segment_branch=""
if [ -n "$branch" ]; then
  dirty=""
  if [ -n "$(git -C "$cwd" --no-optional-locks status --porcelain 2>/dev/null)" ]; then
    dirty=" *"
  fi
  segment_branch="${YELLOW} ${branch}${dirty}${RESET}"
fi

# --- Model name ---
model=$(echo "$input" | jq -r '.model.display_name // "unknown"')
segment_model="${MAUVE}${model}${RESET}"

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

# --- Time (mirrors starship [time], %R = 24h HH:MM) ---
segment_time="${LAVENDER}$(date +%R)${RESET}"

out="$segment_dir"
for seg in "$segment_branch" "$segment_model" "$segment_context" "$segment_time"; do
  if [ -n "$seg" ]; then
    out="${out}${SEP}${seg}"
  fi
done

printf "%s" "$out"
