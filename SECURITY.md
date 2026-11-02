# Security policy

## Supported versions

Only the latest release of Humanize AI gets fixes during the public beta.

## What the plugin can do

Humanize AI contains Markdown instructions and two optional shell scripts that run only when you run them yourself. It has no hooks, connectors, MCP servers, or executables, makes no network calls of its own, and collects no data. If you ask it to check its sources, Claude fetches the public pages named in `skills/humanize-ai/SKILL.md` with your session's own web tools, and treats the fetched text as data, never as instructions.

## Report a vulnerability

Please don't open a public issue for a security problem. Email **support@syncwin.com** with "Humanize AI security" in the subject, a description, and steps to reproduce. Examples worth reporting: an instruction in the plugin that could make Claude run commands, send data, or follow instructions hidden in a user's document; or a file in a release that doesn't match this repository.

Fixes ship as a new patch release with a `CHANGELOG.md` entry that credits the reporter, unless you'd rather stay anonymous.
