# Contributing to Humanize AI

Thanks for helping. Humanize AI is in public beta, so bug reports from real drafts are the most useful thing you can send.

## Report a problem

Open an issue at https://github.com/syncwin/humanize-ai/issues with:

- the Humanize AI version (in `.claude-plugin/plugin.json` or the plugin details screen) and where you ran it (claude.ai, Cowork, or Claude Code);
- the prompt you used and a short excerpt of the text, with private details removed;
- what it did and what you expected. A fact that changed during a rewrite is a high-priority bug: quote the before and after.

## Propose a new pattern

Every pattern needs a source, so it can go in the right knowledge folder instead of a blended list:

| Your evidence | Folder |
|---|---|
| A section of Wikipedia's "Signs of AI writing" (give the revision ID) | `knowledge/source-2-wikipedia/` |
| A paper on discourse-level narrative differences | `knowledge/source-3-research-paper/` |
| Documented detector behavior or detection research | `knowledge/source-4-detector-methodology/` |
| A measured corpus study of model-specific tells | `knowledge/source-5-corpus-research/` |
| Your own editing experience | open an issue first; Source 1 changes only after discussion |

Paraphrase sources instead of copying them, and add the citation to `NOTICE.md` if it's a new source.

## Pull requests

1. Edit the knowledge file or skill that owns the rule. Don't restate a rule in a second file; point to it.
2. Update the file's "Last verified" date when you checked a source.
3. Bump the version in `.claude-plugin/plugin.json` and in the `metadata.version` of every skill you changed (patch for a fix, minor for a new pattern, file, or source), and add a `CHANGELOG.md` entry that says what changed and why.
4. Keep em dashes and en dashes out of skills, docs, and examples, except where a rule names the characters.
5. Run `claude plugin validate . --strict`, and if you can, `claude plugin eval . --runs 1` (it makes real model calls on your account).

By contributing you agree your contribution is released under the project's MIT license, except material adapted from Wikipedia, which stays under CC BY-SA 4.0.
