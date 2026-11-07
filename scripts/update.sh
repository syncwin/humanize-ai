#!/usr/bin/env bash
# Pulls the latest version of a cloned Humanize AI checkout. Safe to run any time:
# skills/humanizeai/assets/user-customizations.md is git-ignored, so git pull never touches it.
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

if [ -f "skills/humanizeai/assets/user-customizations.md" ]; then
  echo "Found your customizations file. It's git-ignored, so this pull won't touch it."
else
  echo "No customizations file yet. Run scripts/setup.sh afterwards if you want one."
fi

git pull --ff-only

echo "Done. Current version:"
grep '"version"' .claude-plugin/plugin.json | head -1
