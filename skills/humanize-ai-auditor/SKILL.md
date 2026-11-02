---
name: humanize-ai-auditor
description: Third and final stage of Humanize AI, and the one that always runs. Checks text against two hard gates (no em or en dashes; a counted sentence-rhythm check), a checklist scoped to the content type, and fact-lock verification (numbers, names, quotes, dates, and claims unchanged from the original unless the change was intended), then writes the delivery scratchpad. Use when someone wants a final check, such as "audit this before I publish", "run the humanize checklist on this", or "did the rewrite change any facts?", and when /humanize-ai closes a run. Also explains the checklist, the dash rule, or the scratchpad format. On its own it audits the text as given, with no detection or rewrite in that run.
license: MIT
metadata:
  displayName: Humanize AI Auditor
  version: '0.5.0'
  author: "@wasimness"
  company: SyncWin
---

# Humanize AI Auditor

The confirmation layer, and the stage that runs in every mode. By now `ai-pattern-remover` should have fixed most issues section by section; this pass expects to find little. If it finds something in a rewrite, fix it and re-scan before delivering. Knowledge paths are under `${CLAUDE_PLUGIN_ROOT}/knowledge/`.

**Contents:** Hard gates · Checklist and matrix · Fact-lock verification · Scratchpad · Scoping by run · Manual items

## The two hard gates (every mode, every content type)

A matched voice sample can override Gate 1 only, never Gate 2.

**Gate 1: no em dashes or en dashes.** Rule, rationale, and replacement order: `source-2-wikipedia/formatting-tells.md`. Scan for the literal `—` (U+2014) and `–` (U+2013), and for ` - ` or ` -- ` used between words as a dash. Hyphens inside compound words are fine. This is a house rule based on how readers react, not a claim that dashes prove AI authorship; current models rarely use them (Source 5). Run the rest of the formatting scan in the same pass: bold overuse, labelled lists, heading hygiene, tiny tables, emoji, mixed curly and straight quotes, and leftover chatbot markup or placeholders (`source-2-wikipedia/chatbot-leakage.md`).

**Gate 2: rhythm, counted.** Rationale: `source-4-detector-methodology/statistical-detector-signals.md`. Count words per sentence: no more than two consecutive sentences within about 4 words of each other; every paragraph of 3 or more sentences has one sentence under 8 words and one over 20 where length allows; content-carrying phrasing checked for a default-predictable choice where a specific one exists. A literal count, never an impression. On very short pieces (under about 3 sentences) run the lighter version.

If either gate fails in a rewrite, fix it inline and re-scan. Never deliver on a known failure. In detect-only and standalone audits, report the failure; don't rewrite.

## Checklist and applicability matrix

Open `references/checklist.md` at the start of every run; the scratchpad's pass counts come from it. It holds the matrix (which checks apply to long-form, short-form, email, fiction, sales, reference) and every AI-verifiable item. Use the content type from the router or detector; if it doesn't map, use the long-form column. Run only what the matrix marks for that type.

## Fact-lock verification

Runs whenever a rewrite happened. Meaning drift is the failure this plugin is built to prevent, and it outranks any detector score.

1. **Get the list.** Use the fact-lock list `ai-pattern-remover` built from the original. If it's missing (for example a standalone remove step), build it now from the original. With no original available, say plainly that fact-lock couldn't run.
2. **Compare** every item against the rewrite: numbers and statistics, proper names, dates, direct quotes, URLs and citations, specific claims, and each claim's degree of certainty.
3. **Fix unintended drift before finishing:** a number rounded differently, a qualifier softened or strengthened, a name misspelled, a quote paraphrased, a citation pointing somewhere new. Don't hand drift to the person to catch.
4. **Intended changes** (the person asked for an update or a correction) are fine; list them as intentional.
5. **Fiction:** only the real-world framing is locked, not invented plot.

## Scratchpad (every real run)

Deliver it with every real piece; in detect-only mode it *is* the deliverable. Structure: `assets/scratchpad-template.md`.

- One line per applicable checklist category with a pass count (`Vocabulary and formatting: 6/6 pass`).
- Full detail only for items fixed during the run, borderline calls, and failures.
- Omit categories the matrix marks as not applying.
- Content type, run scope, and voice notes at the top.
- Notes are specific ("changed 'serves as' to 'is' in four places"), never canned ("refined for clarity and flow"). Canned change summaries are themselves an AI tell.

The person should be able to read only the scratchpad and know what was checked, what applied, and what changed.

## Scoping the scratchpad by run

The full workflow gets the complete scratchpad. A single-stage run (a stage skill called directly, or the router's detect-only or rewrite-only mode) gets only what happened in that run. Same template and checklist, inapplicable sections left out:

- **Detect step:** the detector's findings and this skill's gate and checklist results on the original. No rewrite section, no fact-lock.
- **Remove step:** what the remover changed, gate results, and fact-lock verification. If detector findings came from earlier in the conversation, a one-line pointer to them is enough.
- **Audit step alone:** start with `Standalone audit: no detection or rewrite ran in this pass.` Then gate and checklist results on the text as given. No fact-lock (no before and after in this run).

## Manual items (the author checks these)

- **Detector score, optional.** If the workflow uses an AI detector, check more than one; they weigh signals differently and disagree. Treat a score as one noisy signal: don't edit for it, and don't read a low score as proof of anything (Source 4). Never mark this as passed: it needs a tool this skill doesn't run.
- **Suspect citations** listed by the remover: the author verifies them.
- **Final human read-through** before publishing.

## Handoff

Return the scratchpad to `humanize-ai` (or to the person, in a standalone run) as the closing artifact.
