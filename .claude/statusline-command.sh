#!/bin/sh
input=$(cat)
echo "$input" >> /tmp/statusline-debug.json
model=$(echo "$input" | jq -r '.model.display_name // "Claude"')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

if [ -n "$used" ]; then
  filled=$(printf "%.0f" "$(echo "$used * 10 / 100" | bc -l)")
  empty=$((10 - filled))
  bar=""
  i=0
  while [ $i -lt $filled ]; do
    bar="${bar}█"
    i=$((i + 1))
  done
  i=0
  while [ $i -lt $empty ]; do
    bar="${bar}░"
    i=$((i + 1))
  done
  pct=$(printf "%.0f" "$used")
  printf "%s  [%s] %s%%" "$model" "$bar" "$pct"
else
  printf "%s" "$model"
fi
