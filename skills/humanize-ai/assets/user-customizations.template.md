# Your Customizations (template)

Personal rules for Humanize AI: extra words you never want, phrases you overuse, brand tone rules, client-specific exceptions, or edge cases you've decided to handle a certain way.

## Where to put them

- **Any install (claude.ai, Cowork, Claude Code):** put your rules in your project instructions or paste them into the conversation. Humanize AI reads them first.
- **Local clone (Claude Code with `--plugin-dir` or a git checkout):** run `bash scripts/setup.sh` once. It copies this template to `skills/humanize-ai/assets/user-customizations.md`, which git ignores, so `git pull` and `scripts/update.sh` never overwrite it. Edit that copy, not this template.

Humanize AI never edits this file or your copy during a run. If it suggests a new rule, it gives you the text to add yourself.

## Your notes

*(Add your rules below this line.)*
