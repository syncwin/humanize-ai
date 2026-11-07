#!/usr/bin/env bash
# Run once after cloning: creates your personal, git-ignored customizations file.
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REAL="$DIR/skills/humanizeai/assets/user-customizations.md"
TEMPLATE="$DIR/skills/humanizeai/assets/user-customizations.template.md"

if [ -f "$REAL" ]; then
  echo "user-customizations.md already exists; leaving it alone."
else
  cp "$TEMPLATE" "$REAL"
  echo "Created skills/humanizeai/assets/user-customizations.md. Edit that file, not the template."
fi
