#!/bin/sh

# Exit immediately if a command fails
set -e

# Check if any files were passed
if [ "$#" -eq 0 ]; then
  echo "Error: No input files provided." >&2
  exit 1
fi

for file in "$@"; do
  if [ ! -f "$file" ]; then
    echo "Warning: '$file' is not a file or does not exist. Skipping." >&2
    continue
  fi

  tmpfile="$(mktemp)"
  if xmlstarlet fo -t "$file" > "$tmpfile"; then
    mv "$tmpfile" "$file"
    echo "Formatted: $file"
  else
    echo "Failed to format: $file" >&2
    rm -f "$tmpfile"
    exit 1
  fi
done
