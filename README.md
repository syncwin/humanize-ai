# Humanize AI

Humanize AI is a Claude plugin that finds the patterns that make a draft read as AI-written, then rewrites only what is safe to change, so the text sounds like a person wrote it. Your facts stay put. Names, numbers, quotes, and dates are listed before the rewrite starts and checked against the original after it ends.

**Download:** [humanize-ai.plugin](https://github.com/syncwin/humanize-ai/releases/latest/download/humanize-ai.plugin) (always the latest release)

**Version** 0.6.0 (public beta) · **Author** @wasimness · **Company** SyncWin · **Contact** support@syncwin.com · **License** MIT (Wikipedia-derived material: CC BY-SA 4.0)

## Why it exists

Most AI humanizers swap words ("utilize" becomes "use") and leave the sentence structure and rhythm as predictable as before. That's the predictability detectors start from. Readers feel it too. Aggressive rewriting has the opposite problem: it can quietly round a number, soften a claim, or paraphrase a quote.

I used this tool privately for several months before releasing it. The earlier single-file version loaded every rule for every request, so this version splits the work into three stages and keeps the research in separate, cited knowledge files.

## What it does

- It detects AI-writing tells and ranks them by how much they prove. Leftover chatbot text ("I hope this helps!", `oaicite` tags, "[Your Name]") is near-certain. A single "delve" proves almost nothing.
- It filters every finding through one question: **could a stranger fake this exact detail without effort?** Generic claims get edited. Oddly specific, costly details stay, even when they look like a pattern.
- It rewrites clause structure, rhythm, and transitions along with the vocabulary, matched to your voice sample if you give one.
- It audits the result: no em or en dashes, a counted sentence-rhythm check, a checklist scoped to the content type, and a fact-lock check against the original.
- It reports what it checked and changed in a short scratchpad, so you don't have to reread the whole piece.

## What's new in this beta

- Graphite's 2026 AI Tells research is now Source 5: measured tells for GPT, Claude, and Gemini, with Claude Opus 5.5 included.
- Wikipedia's 2025 and 2026 additions are in: vague "associated with" phrasing, canned media-coverage claims, chatbot citation markup from ChatGPT, Gemini, Grok, DeepSeek, and Perplexity, and the guide's list of signs that don't work.
- Em dashes now count only as weak evidence. Current models barely use them. The no-dash rule stays for delivered text because readers still associate dashes with AI. A voice sample that uses dashes can override it.

Full details are in `CHANGELOG.md`.

## Install

**Claude (web, desktop, or Cowork).** Open **Customize > Plugins**, click **Add**, choose **Add marketplace**, then **Add from a repository**, and enter `syncwin/humanize-ai`. Install **Humanize AI** from that marketplace. Or download `Humanize AI v0.5.0.plugin` from the [v0.5.0 release](https://github.com/syncwin/humanize-ai/releases/tag/v0.5.0) and upload it as a custom plugin. Once Humanize AI is listed in Anthropic's directory, you'll be able to add it from the **Discover** tab.

**Claude Code.**

```
claude plugin marketplace add syncwin/humanize-ai
claude plugin install humanize-ai@syncwin-humanize-ai
```

Plugins added on claude.ai also sync to Claude Code (v2.1.273 or later) when you sign in with the same account.

## Use it

```
/humanizeai [paste your draft, or point to the file]
```

That runs the full workflow: detect, rewrite, audit. Phrasing picks a lighter mode on its own:

| You say | What runs |
|---|---|
| "Humanize this," "make this sound less like AI" | detect, rewrite, audit |
| "Does this sound AI-written? Don't rewrite it." | detect and audit only; you get a findings report |
| "Fix what you flagged" | rewrite and audit, using findings already in the chat |

To run a single stage, call it directly: `/humanize-ai:ai-pattern-detector`, `/humanize-ai:ai-pattern-remover`, or `/humanize-ai:humanize-ai-auditor`. Each one runs only its own stage, and every run ends with an audit scratchpad covering what ran.

**Tips**

- Paste 2 or 3 paragraphs of your own writing as a voice sample. The rewrite will match your sentence length, word choice, and punctuation, including dashes if you really use them.
- Tell it which model drafted the text if you know. It checks that model family's known tells first.
- Name the facts that must not move ("keep the pricing table exactly as is").
- Put standing rules (words your brand never uses, client exceptions) in your project instructions. Humanize AI reads them before every run.

## Companion prompt

`prompts/humanize-ai.json` is a ready-made form for [Prompt Builder](https://promptbuilder.syncwin.com/). Import it under **Settings > Import**, choose a step (Full Workflow, Detect Only, Rewrite Only, Audit Only), paste your content, and send. It's attached to each release too.

### Renamed in 0.6.0

| Old | New |
|---|---|
| `/humanize-ai` | `/humanizeai` |
| `/humanize-ai:humanize-ai` | `/humanize-ai:humanizeai` |
| `skills/humanize-ai/` | `skills/humanizeai/` |

The plugin id, repository and the other three skills are unchanged.

## How it works

```
/humanizeai  (router: picks the mode and content type)
  1. ai-pattern-detector   finds tells, tiers them, marks safe to edit or leave alone
  2. ai-pattern-remover    builds the fact-lock list, rewrites only what's safe to edit
  3. humanize-ai-auditor   dash and rhythm gates, checklist, fact-lock check, scratchpad
                           (runs in every mode)
```

The research lives in five knowledge folders, kept separate because each answers a different question:

| Source | Question it answers | Folder |
|---|---|---|
| 1. Own research | Is this detail costly to fake? (the Specificity Gradient) | `knowledge/source-1-own-research/` |
| 2. Wikipedia, "Signs of AI writing" | Which patterns do editors see, and which signs don't work? | `knowledge/source-2-wikipedia/` |
| 3. StoryScope (COLM 2026) | What narrative choices give AI fiction away? | `knowledge/source-3-research-paper/` |
| 4. Detector methodology | What do detectors measure, and how far can a score be trusted? | `knowledge/source-4-detector-methodology/` |
| 5. Graphite AI Tells (2026) | Which frames does each model family overuse? | `knowledge/source-5-corpus-research/` |

Every knowledge file carries a "Last verified" date. Ask "check for updates" and Humanize AI will offer to re-check its sources. It tells you which pages it will fetch, and it changes nothing without your yes.

## What it runs, reads, and sends

Humanize AI is Markdown instructions plus two optional shell scripts, all readable in this repository.

- No network calls of its own. It has no connectors, MCP servers, hooks, or executables. It fetches something only when you ask it to check its sources. Claude then tells you which public pages it will fetch (Wikipedia, arXiv, detector vendors' documentation, Graphite's research hub, the EU AI Act text) and uses the web tools your session already has.
- It reads the content you give it and, in local clones, an optional `skills/humanizeai/assets/user-customizations.md`.
- It writes nothing into its own folder during a run. Suggested rule changes come back to you as text.
- `scripts/setup.sh` and `scripts/update.sh` run only if you run them, in a local clone. They copy a template file and run `git pull --ff-only`.
- It collects no data. SyncWin receives nothing from your use of the plugin.

## Limitations

- No detector score is reliable on its own. Detectors make mistakes on human writing, and they're biased against non-native English writers. Humanize AI edits for human readers. It doesn't promise any score, and it won't edit away a real detail to chase one.
- It finds signs of AI writing, and signs can mislead: even heavy LLM users identify AI text correctly only about 90% of the time.
- Pattern lists go stale. Graphite found 55% to 72% of a model's tells change between versions, so every source carries a date showing how current it is.
- Story-structure checks run only on fiction and story-driven pieces.
- Two checks stay with you: any third-party detector run, and a final human read before publishing. Suspect citations get flagged for you to verify; the plugin can't verify them itself.

## Use it responsibly

Humanize AI improves writing; the rules about where AI-assisted text may be used still apply. Check your own rules. If your school, publisher, or platform bans AI assistance or requires you to disclose it, follow that rule. The same goes for Wikipedia, and for public-interest publishing in the EU under Article 50 of the AI Act when there's no editorial review. Wikipedia's own guide asks people to fix the underlying problems behind the visible signs, and Humanize AI works that way too. Unsupported claims get sourced or cut, and suspicious citations get flagged for you to check.

## Contributing

Issues and pull requests are welcome. See `CONTRIBUTING.md`. If you're proposing a new pattern, cite where it comes from (a Wikipedia section and revision, a paper, a measured study, or documented detector behavior), so it lands in the right source folder. Security reports: `SECURITY.md`.

## Credits and license

- [Wikipedia:Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing), WikiProject AI Cleanup (CC BY-SA 4.0)
- Graphite's [AI Tells](https://graphite.io/five-percent/research/ai-tells) and [Opus 5.5 update](https://graphite.io/five-percent/research/ai-tells-opus-5-5-update) by Gregory Druck, Jose Luis Paredes, and Ethan Smith
- Russell, Rajendhran, Pham, Iyyer, and Wieting, [StoryScope](https://arxiv.org/abs/2604.03136) (COLM 2026)
- Structural ideas from [blader/humanizer](https://github.com/blader/humanizer) (MIT, Siqi Chen)

Code and original text are under the MIT license (`LICENSE`). Material adapted from Wikipedia stays under CC BY-SA 4.0. Full attribution is in `NOTICE.md`.

Humanize AI is an independent project by [SyncWin](https://syncwin.com). No affiliation. Anthropic, Wikipedia, and Graphite haven't endorsed or reviewed it in any way. For a quick, no-install check in your browser, try SyncWin's free [AI Text Detector & Humanizer](https://syncwin.com/tool/ai-text-detector-humanizer/). It runs locally and is a lighter tool built for a different job.
