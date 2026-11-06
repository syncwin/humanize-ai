# Changelog: Humanize AI (humanize-ai)

## Unreleased

**Added**
- GitHub Actions workflow `release-plugin.yml` builds `humanize-ai.plugin` and attaches it to each release for a one-click download link (README).

## 0.5.2: Update

**Changed**
- Standing rule: research before building. Check current official docs and widely recommended, secure practice before choosing an approach, file, tool, config or dependency; cite the source; mark anything unverified; never guess; keep research scoped to the task.

## 0.5.1: Update

**Changed**
- Security audit (light): no hooks, connectors, MCP servers or network calls; both shell scripts are quoted and run with set -euo pipefail; fetched text is already treated as data. No code change needed.

## v0.5.0: 2026-10-05 (public beta)

**First public beta. Folded in three new research sources, fixed every issue the pre-release audit found, and prepared the plugin for GitHub and Anthropic's directory.** Minor bump: one new knowledge source and new detection and rewriting capability; the `/humanize-ai` entry point and the three stage skill names are unchanged. Still pre-1.0.

### Added

- **Source 5, corpus research** (`knowledge/source-5-corpus-research/model-specific-tells.md`): Graphite's "AI Tells" (2026-09-16) and "AI Tells: Opus 5.5 Update" (2026-10-01) by Gregory Druck, Jose Luis Paredes, and Ethan Smith. Frame families (definition by contrast, importance flagging, tradeoff avoidance, transitions, evaluative adjectives), per-family tells for GPT, Claude, and Gemini, stylistic features, human-writing markers, mannered prose, trends, and the study's own limitations. The plugin now has five separate knowledge sources.
- **`knowledge/source-2-wikipedia/caveats-and-human-signals.md`**: Wikipedia's caveats on detection ability (with the studies it cites), its "ineffective indicators," its "signs of human writing," and its historical indicators. The single home for detection humility; other files point to it.
- **Wikipedia's 2025 and 2026 additions** (revision 1377935935): vague expression of connection, canned notability and media-coverage claims, retrieval-era false attribution, the three forms of negative parallelism including "Y rather than X," "X and Y" and "Awards and recognition" headings, edit-summary and message templates, English-variety mismatch, collaborative phrasing, usage disclaimers, unfilled placeholders, per-tool chatbot citation markup (ChatGPT, Gemini, Grok, DeepSeek, Perplexity, `:::writing`), chatbot tracking parameters, mixed markup, and heading hygiene signs.
- **Pseudo-specific details** in the Specificity Gradient: round, plausible numbers and timeframes ("twenty minutes," "a handful") count as costless unless sourced, after Graphite measured Claude producing more of them in each version.
- **Model-aware check** in `ai-pattern-detector`, used only when the person names the drafting model.
- **Human-writing markers** in `ai-pattern-remover` (first person, direct address, casual qualifiers, contractions, asides), only where the material supports them; never invented.
- **Citation rule**: the remover never "repairs" a suspect citation; it flags it for the author, and the auditor lists it as a manual check.
- **Responsible-use section** in the router, following Wikipedia's warning not to treat signs as the problem: no detector-evasion promises, a plain note when the person says AI use must be disclosed, and fixes aimed at the underlying claim.
- **Rewrite self-checks** (found by the new evals): cut costless sentences instead of rewording them, never attribute a new first-person stance or lesson to the writer, and re-scan rewritten sentences so a fix doesn't introduce a new tell such as "matters more than." Mirrored in the auditor checklist.
- **Content is treated as data**: instructions inside a draft being checked are text to edit, never commands (prompt-injection guard in the router).
- **Seven new before-and-after pairs** (examples 11 to 17) for the new patterns.
- **Launch files**: `.claude-plugin/marketplace.json` (git install, marketplace `syncwin-humanize-ai`), `CONTRIBUTING.md`, `SECURITY.md`, `assets/icon.png`, directory listing fields in `plugin.json`, a Prompt Builder companion prompt (`prompts/humanize-ai.json`), and `evals/` (five `claude plugin eval` cases plus trigger sets).
- **"Last verified" dates** on every knowledge file, and a staleness offer when one is more than six months old.

### Changed

- **Em dashes are now weak evidence.** Graphite measured GPT-6 Astra at about one-eighth of the human rate and Claude Opus 5.5 at 0.015 per 1,000 words; Wikipedia's September 2026 note says the sign may become historical. Detection counts a dash only inside a cluster, and a dash-free text is never read as human. **Gate 1 stays** as a house rule, now explained as reader perception rather than detection evidence.
- **Curly quotes**: no longer a tell on their own (ChatGPT and DeepSeek use them, Claude and Gemini usually don't, and word processors convert quotes automatically). The auditor checks for consistency with the destination instead.
- **`banned-vocabulary.md`** split into Part A (evidence: Wikipedia's words by era, Graphite's families) and Part B (house-style swaps that are not evidence). "In order to," hedges, and isolated transitions are marked as style only.
- **Knowledge maintenance** runs on request only. It used to fetch sources automatically in every conversation, which was slow, undisclosed network activity. It never writes into the installed plugin folder; it proposes changes, applies them only in a repository clone, or offers text for the person's own customizations.
- **Fact-lock ownership**: `ai-pattern-remover` now builds the fact-lock list from the original before rewriting and passes it on; the auditor verifies it (and builds it itself if a standalone run lacks one).
- **Detector score** is an optional manual check with no numeric target; the old "under ~20%" target is gone.
- **Source 4** rewritten with citations for every reliability claim (Wikipedia and the studies it cites, Liang et al. 2023, Graphite); unsourced percentages from v0.3.x removed. EU AI Act note updated: Article 50 has applied since 2 August 2026, including the editorial-review exemption in 50(4).
- **Source 3** updated to StoryScope v6 (61,608 stories, 68.4% six-way attribution, per-model narrative fingerprints).
- **Knowledge paths** in skills now use `${CLAUDE_PLUGIN_ROOT}/knowledge/...`, so they resolve from any skill folder.
- **Metadata**: `displayName` "Humanize AI"; author `@wasimness` and company SyncWin on the manifest (`author.company` plus a `metadata` block, replacing the undocumented `author.organization`) and on every skill; `license` moved to top-level skill frontmatter; repository URL updated to `github.com/syncwin/humanize-ai`.
- **Descriptions** rewritten with real trigger phrases and a "when to use" clause; standalone behavior of each stage made consistent with the step controller.
- **Customizations**: rules from the conversation or project instructions come first; the git-ignored `user-customizations.md` is optional and only for local clones. `scripts/update.sh` uses `git pull --ff-only`.

### Fixed

- **Duplicate `/humanize-ai`.** `commands/humanize-ai.md` and the router skill shared the name `humanize-ai`, so `claude plugin details` listed it twice and the five-line command could shadow the router. Removed the command; the skill answers to `/humanize-ai`.
- **`formatting-tells.md` damaged by an earlier dash replacement:** the em-dash "before" example had no dashes left, the scan rule told the auditor to search for a plain hyphen (which would fail every compound word), and the curly-quote example used straight quotes on both sides. Rewritten.
- **Stage numbering**: descriptions said first, third, and fourth stage (left from the four-skill era). Now first, second, third.
- **Stale cross-references** to the single-skill era ("Part 1," "Part 3," "Activation Behavior," "main SKILL.md," `references/` paths in `NOTICE.md`, `.skill` files and `npx skills` in the customizations file).
- **Private references removed**: a named personal skill in the router description, and `skill-creator-plus` references that public users can't follow.
- **Contradiction** between the stage descriptions ("never chains into the final gate") and the step controller ("every run closes with the auditor's scratchpad"). Single-step runs now always close with a scoped auditor scratchpad.
- **Examples that changed meaning or invented facts** in `before-after-examples.md` (an "after" that reversed the claim, others that added unstated outcomes), and wrong word counts in the rhythm example.
- **`user-customizations.md` shipped in the zip but git-ignored in the repo**, so GitHub and directory installs lacked a file the router said to read. The router now treats it as optional.
- **Duplicated statements** of the Specificity Gradient and the detection caveat across files: one canonical home each, with pointers.
- **File permissions** in the old zip (three knowledge files were owner-only) and non-executable scripts.
- **This changelog**: the v0.4.3 entry had copies of the v0.4.2 and v0.4.1 text pasted into it. Moved the v0.4.1 details back under v0.4.1 and removed the duplicate v0.4.2 copy. No history deleted.

### Removed

- `commands/humanize-ai.md` (see Fixed). Migration: nothing to change; `/humanize-ai` still runs the complete workflow. In Claude Code the full form is `/humanize-ai:humanize-ai`.
- `skills/humanize-ai/assets/user-customizations.md` from the package (the template stays; `scripts/setup.sh` creates the personal copy).

### Verified

- `claude plugin validate --strict` (Claude Code 2.1.289) passes for the plugin manifest and the marketplace file.
- `claude plugin eval` (Claude Code 2.1.289; 5 cases, 2 runs each, with and without the plugin): 10 of 10 runs pass with the plugin and 5 of 10 without it (mean delta +0.5). The router triggered from a plain-language request and stayed out of an unrelated one.
- AI Extender's validator (`validate_extension.py --target all --require-meta author,company`): no errors.
- Every path in every skill and knowledge file resolves inside the plugin; no file over 256 KiB; no binary files besides the PNG icon.
- No em or en dashes in skills, README, or launch copy, except inside rules that name the characters and inside eval inputs that test the rule.

---

## v0.4.3: 2026-08-25

**Ran the plugin through `/skill-creator`'s structural validator and `skill-creator-plus`'s de-duplication pass (Part 1) as a dedicated audit step, not just a manual review.**

### Fixed

- `ai-pattern-remover`'s SKILL.md had a section header, "Before starting: read the classifier's annotations", left over from before `humanize-classifier` was merged into `ai-pattern-detector`. The body text under that header already correctly said `ai-pattern-detector`, only the header itself was stale. Corrected to "Before starting: read the detector's annotations".
- `humanize-ai`'s own table-of-contents line ("Contents:") was missing "Deliverable Format", a section that exists in the file but wasn't listed. Added.
- Removed development-history narrative embedded in four places across `ai-pattern-detector`'s and `humanize-ai`'s SKILL.md bodies (phrases like "these were two skills in an earlier version" and a full version-by-version history parenthetical), per `skill-creator-plus` Part 1.2's meta-commentary rule: this kind of narrative documents the build process rather than changing agent behavior, and belongs in `CHANGELOG.md`, not a live SKILL.md. No operational instruction was removed, only the historical framing around it; the underlying behavior (detection and filtering run as one pass, knowledge-sync lives in the router, sources are knowledge not skills) is stated exactly as before, just without the "why we used to do it differently" narration.

### Verified, no change needed

- All four skills pass `/skill-creator`'s structural validator (`quick_validate.py`): exactly one `SKILL.md` per skill folder, valid frontmatter, no structural errors.
- Cross-skill de-duplication check (`skill-creator-plus` Part 1.2): the em-dash rule, the Specificity Gradient, perplexity/burstiness detail, and scratchpad format each have exactly one canonical home (`humanize-ai-auditor`, `ai-pattern-detector`, `knowledge/source-4-detector-methodology/`, and `humanize-ai-auditor` respectively); every other mention elsewhere is a short pointer, not a restatement.
- All four `description` fields comfortably under the Agent Skills spec's 1024-character limit (662-846 characters) after this pass.
- No other stale cross-references to a prior skill name found anywhere outside the intentional historical mapping note in `humanize-ai`'s Backward Compatibility section and `CHANGELOG.md` itself.

---

## v0.4.2: 2026-08-24

**Final pre-publication audit for public GitHub release.** Full compliance re-verification against current official Claude plugin documentation, plus corrections found during that pass.

### Corrections made

- `ai-pattern-detector`'s frontmatter `description` was 999 characters, uncomfortably close to the Agent Skills spec's 1024-character limit. Trimmed to 805 characters for real safety margin, no content meaning lost, just tightened wording.
- `README.md` fully rewritten. The previous version had accumulated internal architecture-decision narrative (why skills were merged, a running "what changed in vX" log) that duplicated `CHANGELOG.md` and made the file harder to use as an actual getting-started document. The new version covers what the plugin does, key capabilities, installation, usage (both the complete workflow and single-step options), a workflow diagram, skill structure, inputs/outputs, scratchpad behavior, requirements, limitations, examples, contribution notes, and license, the design-history narrative now lives only in `CHANGELOG.md`, linked from the README's closing section rather than duplicated inline.
- Verified `.claude-plugin/plugin.json` contains exactly the eight officially documented top-level fields (`name`, `description`, `version`, `author`, `homepage`, `repository`, `license`, `keywords`) with nothing extra at the top level, confirmed against current official schema documentation, which explicitly limits `plugin.json` to these fields and states that some marketplace validators reject any additional top-level property outright.

### Verified, no change needed

- Directory structure: `.claude-plugin/` contains only `plugin.json`; `commands/`, `skills/`, `knowledge/`, `scripts/` all sit at the plugin root, matching the official requirement that only `plugin.json` lives inside `.claude-plugin/` and every other component directory must be at the plugin root.
- Every skill folder name matches its frontmatter `name` field exactly (`humanize-ai`, `ai-pattern-detector`, `ai-pattern-remover`, `humanize-ai-auditor`).
- Every path any skill or knowledge file references resolves to a real file within the plugin's own directory tree, nothing references a path outside the plugin (which would break after Claude Code's install-time cache-copy step).
- No obsolete skill names remain anywhere except the intentional historical mapping table in `humanize-ai/SKILL.md`'s Backward Compatibility section and this changelog's own version history.
- `/humanize-ai` backward compatibility unaffected, still resolves to the same skill, still runs the complete workflow by default.
- All four AI-pattern sources still fully represented under `/knowledge/`, none merged, none dropped.
- The knowledge-update mechanism is still owned by `humanize-ai` (not a standalone skill), unchanged since the v0.3.0 audit that put it there.

### Individual-step controller prompt

Rebuilt to match the format and quality of a reference sample provided for this audit (a `{{variable}}`-based, Inputs-and-Routing structured prompt), adapted specifically to this plugin's own three steps and skill names rather than copied. Distributed as a standalone file (`humanize-ai-step-controller.md`) outside this package, consistent with the v0.4.1 decision to keep it out of the zip; a matching JSON export in the same schema as the reference sample is also provided for direct import into prompt-management tooling. Contains no detection, rewriting, or checklist instructions of its own, it only selects and invokes one skill.

---

## v0.4.1: 2026-08-23

**Removed `commands/humanize-ai-step.md` from the packaged plugin per explicit instruction: the step-controller prompt is a separate, standalone artifact distributed outside this package, not something bundled with the plugin.**

### Changed

- `commands/humanize-ai-step.md` deleted from this package. It still exists as a standalone Markdown prompt distributed separately; the plugin no longer references it as a bundled file.
- Every place that referenced the bundled command by path (`humanize-ai`'s "Default invocation" section, `ai-pattern-detector`'s and `ai-pattern-remover`'s descriptions, `humanize-ai-auditor`'s description and its "Scoping the scratchpad to a single step" section, and `commands/humanize-ai.md`) was rewritten to describe standalone/direct skill invocation generically, instead of pointing at a specific file that's no longer part of the package. Each of the three workflow skills now states plainly, in its own description, that when invoked directly rather than through the router, it performs only its own step and doesn't chain into the others on its own initiative.
- No behavior lost: a single step still runs correctly whether triggered by direct mention, by another tool, or by the external step-selector prompt, and `humanize-ai-auditor` still produces a scratchpad scoped to only what ran. The only change is that this correctness no longer depends on a file this package ships, since it doesn't ship that file anymore.

### Backward compatibility, reconfirmed

`/humanize-ai` is unaffected, it never depended on the step-controller command to run the complete workflow. Anyone who separately has the standalone `humanize-ai-step` prompt can keep using it exactly as before, since the three skills it calls are unchanged in behavior, only this package's own internal documentation of them changed.

### Manifest metadata corrected

- `author.name` was `"wasimness (SyncWin)"`, folding the company name into the author name string. Split into `author.organization: "SyncWin"` as its own distinct field, sibling to `author.name` and `author.url`, so the company name isn't textually merged with the person's name.
- Added `homepage` (`https://syncwin.com`), an officially documented top-level field that was missing, distinct from `repository` (the GitHub source).
- `organization` was deliberately nested inside the `author` object rather than added as a new top-level key. The official `plugin.json` schema documents exactly eight top-level fields (`name`, `description`, `version`, `author`, `homepage`, `repository`, `license`, `keywords`, plus component-path overrides), and at least one plugin marketplace's CI is known to reject unrecognized top-level properties outright. `organization` isn't a documented property of `author` either, but nesting it there is lower-risk than adding an unrecognized top-level key, given this plugin already failed upload validation once on a strict, undocumented limit. If a future upload rejects this too, moving `organization` to a plain top-level field is the fallback.
- Every skill's own `metadata` block already carried `version`, `license`, `author`, and `organization` as separate fields (this was correct before this pass, `SKILL.md` frontmatter's `metadata` object is freeform per the Agent Skills spec, not bound by `plugin.json`'s fixed schema), reverified rather than changed.

### Validated against `/skill-creator` and `skill-creator-plus`

- **De-duplication (Part 1)**: rechecked that the generalized standalone-invocation language added to each of the four skill files says something different in each place (detector: don't chain into rewrite/gate; remover: act only on available findings, don't trigger detection/gate; auditor: scratchpad scoping; router: single-step invocation is out of its scope) rather than repeating one paragraph four times.
- **Versioning discipline (Part 2)**: recorded as a patch bump (0.4.0 → 0.4.1), this removes a bundled file and adjusts documentation to match, it doesn't add or remove any pattern knowledge, rewriting rule, gate, or workflow capability.
- **Manifest and frontmatter**: reverified `.claude-plugin/plugin.json` and all four skills' `metadata` blocks after the version bump, all in lockstep.

---

## v0.4.0: 2026-08-23

**Renamed the three workflow skills to their final names, added an explicit step-controller command, and made the complete-workflow guarantee for `/humanize-ai` explicit rather than implicit.**

### Renamed

| Previous name | Final name |
|---|---|
| `humanize-ai-identifier` (itself renamed from `humanize-analyzer`, which absorbed `humanize-classifier`, in earlier versions) | `ai-pattern-detector` |
| `humanize-ai-implementor` (itself renamed from `humanize-humanizer`) | `ai-pattern-remover` |
| `humanize-ai-reviewer` (itself renamed from `humanize-reviewer`, gaining the fact-lock and scratchpad-scoping capability along the way) | `humanize-ai-auditor` |
| `humanize-ai` | unchanged |

Applied as a full find-and-replace across folder names, every `name:` frontmatter field, every cross-reference in every skill and knowledge file, and both command files. No architecture, responsibility, or underlying content changed, this and the prior naming pass are packaging-identity changes only.

### Added

- **`commands/humanize-ai-step.md`** (new): a director-only command letting a user select and run exactly one workflow step (`detect`, `remove`, or `audit`) instead of the complete pipeline. It contains no detection rules, rewriting instructions, or checklist content of its own, it reads the requested step, invokes the one matching skill, and asks `humanize-ai-auditor` for a scratchpad scoped to that single step. Titled "Humanize AI" at the top to match the plugin's own name, with "Step Controller" as its specific role.
- **`humanize-ai-auditor`'s "Scoping the scratchpad to a single step" section** (new): defines exactly what a detect-only, remove-only, and standalone-audit scratchpad each include and omit, reusing the existing scratchpad template and delivery principles rather than introducing a second format. The template itself (`assets/scratchpad-template.md`) gained a **Run scope** line at the top and omission notes on the drafting-related and fact-lock sections for runs where those don't apply.
- **Explicit "Default invocation" section in `humanize-ai`'s SKILL.md**: states plainly that a bare `/humanize-ai` call always runs the complete three-stage workflow (`ai-pattern-detector` → `ai-pattern-remover` → `humanize-ai-auditor`), rather than leaving this to be inferred from the mode-selection table. This was already the router's behavior in practice (full-pipeline was already the default mode), the change makes the guarantee explicit rather than implicit.
- **`commands/humanize-ai.md`** updated to state its complete-workflow guarantee explicitly and point to `/humanize-ai-step` for single-step selection.

### Fixed

- `humanize-ai`'s SKILL.md said detection/rewriting logic "live in the two workflow-stage skills it calls," a leftover miscount from an earlier version, corrected to three.

### Backward compatibility, reconfirmed

`/humanize-ai` is unaffected by any change in this version, it still runs the complete workflow by default, exactly as before, now stated explicitly rather than left implicit. Anything naming the previous internal skill names should be updated per the mapping table above; only the `/humanize-ai` entry point itself carries a cross-version stability guarantee.

### Validated against `/skill-creator` and `skill-creator-plus`

- **Frontmatter**: all four skills carry `name` matching their folder, a trigger-scoped `description` (each updated to cross-reference the new step-controller command where relevant), and `metadata` (version 0.4.0, license, author, organization) in lockstep.
- **De-duplication (Part 1)**: the new step-controller command was checked against this requirement specifically, it does not restate any pattern knowledge, rewriting rule, or checklist item, it only names which skill to invoke and reads that skill's own output. The scratchpad-scoping addition lives in exactly one place (`humanize-ai-auditor`), not copied into the command file or the router.
- **Versioning discipline (Part 2)**: recorded as a minor bump (0.3.2 → 0.4.0), consistent with adding genuine new capability (the step-controller command, the scoped-scratchpad logic) rather than a pure naming/metadata pass, which was the previous patch-level bump.
- **Command frontmatter**: `commands/humanize-ai-step.md` carries `description` and `argument-hint`, matching the convention already used in `commands/humanize-ai.md`.

---

## v0.3.2: 2026-08-23

**Fixed plugin upload validation failure and aligned the manifest with official Claude plugin packaging requirements.**

- `.claude-plugin/plugin.json`'s `description` was 543 characters, exceeding the platform's documented 500-character hard limit (recommended range is 50-200). Rewritten to 244 characters, well within both.
- `author.organization` was not a documented field of the official `plugin.json` author object (only `name`, `email`, `url` are specified); moved the company name into `author.name` as `"wasimness (SyncWin)"` to guarantee compatibility with strict validators, since unrecognized nested fields aren't part of the documented schema even where top-level unrecognized fields are merely warned about. Skill-level `metadata.organization` fields are unaffected, `metadata` in SKILL.md frontmatter is a freeform object per the Agent Skills spec, not subject to the same fixed schema as `plugin.json`.
- Verified against the full official manifest schema: `name` kebab-case and within length limits, `version` valid semver, `description` under the hard cap, `author` as a valid object, `repository`/`license`/`keywords` all documented fields with no unrecognized properties, all component directories (`skills/`, `commands/`) at plugin root rather than inside `.claude-plugin/`, and each skill's `name`/`description` within the Agent Skills spec's own length limits (name ≤64 chars, description ≤1024 chars, both comfortably satisfied by all four skills, 20-23 and 397-846 characters respectively).

### Preserved

No architecture, content, or skill-name change in this pass, packaging metadata only.

---

## v0.3.1: 2026-08-23

**Naming finalized; author/organization metadata completed.**

- Skill names confirmed by the user: `humanize-analyzer` → `ai-pattern-detector`, `humanize-humanizer` → `ai-pattern-remover`, `humanize-reviewer` → `humanize-ai-auditor`. `humanize-ai` (the router) keeps its name. Applied as a full find-and-replace across folder names, every `name:` frontmatter field, and every cross-reference in every skill, `README.md`, and this file, no architecture, responsibility, or content changed.
- `.claude-plugin/plugin.json` now carries an explicit `author.organization` field ("SyncWin") alongside the existing `author.name` ("wasimness"), matching the `author`/`organization` fields already present in every skill's own `metadata` block. All four skills and the plugin manifest now consistently carry author, organization, and version.
- Per-skill versions bumped to 0.3.1 in lockstep with the plugin version, this is a naming/metadata pass, not a structural change, so it's recorded as a patch bump rather than the minor bump used for the v0.2.0/v0.3.0 restructurings.

### Backward compatibility, reconfirmed

`/humanize-ai` is unaffected, its own name didn't change. Anything naming the older internal skills (`humanize-analyzer`, `humanize-humanizer`, `humanize-reviewer`, or the even earlier `humanize-classifier`/`humanize-knowledge-sync`) should be updated to the confirmed names above.

---

## v0.3.0: 2026-08-22

**Audit and minimization pass.** Re-evaluated the v0.2.0 four-workflow-skill architecture against actual usage patterns and found two genuine overlaps, both corrected by merging rather than by justifying the extra skill count after the fact.

### Merged / removed

| Removed skill | Merged into | Why |
|---|---|---|
| `humanize-classifier` | `ai-pattern-detector` | Never invoked independently, every detection finding immediately got a Specificity Gradient filter pass in the same request. No decision point ever separated the two; keeping them apart meant paying for a skill invocation that added no branching, no skip logic, and no independent trigger. |
| `humanize-knowledge-sync` | `humanize-ai` (new "Knowledge Maintenance" section) | A once-per-session check that has to run before any workflow stage does. The router is the only place in the plugin already guaranteed to run on every single request; putting the sync logic there removes an invocation instead of adding one, with identical cadence, ask-first protocol, and coverage of Sources 2/3/4. |

Net: 6 skills → 3 (`humanize-ai`, `ai-pattern-detector`, `ai-pattern-remover`, `humanize-ai-auditor` was already present; `humanize-classifier` and `humanize-knowledge-sync` are gone, folded rather than deleted). The `/knowledge/` reference layer (four sources, unchanged since v0.2.0) is untouched by this pass, since it was never a skill to begin with, this version's correction was about skill count, not the knowledge/execution split, which was already validated in the prior round.

### Skill-name note

Per explicit instruction, skill names in this version (`ai-pattern-detector`, `ai-pattern-remover`, `humanize-ai-auditor`, `humanize-ai`) are **provisional**, pending final confirmation. The architecture, responsibilities, and file boundaries are the deliverable this round; a subsequent rename is a find-and-replace across cross-references and frontmatter `name:` fields, not a restructuring, and won't affect `/humanize-ai`'s external contract either way.

### Content changes within merged skills

- `ai-pattern-detector`'s SKILL.md now contains, in one file: fast-pass/escalation detection logic (unchanged from v0.2.0), all three detection knowledge-module pointers (Sources 2-4), and the full Specificity Gradient filtering test, application steps, and second-order check (previously `humanize-classifier`'s entire content). No detection or filtering rule was shortened or dropped in the merge, only cross-references between the two were collapsed since they now live in the same file (e.g., "return to `humanize-classifier`" became "the filter below").
- `humanize-ai`'s SKILL.md gained a full "Knowledge Maintenance (Sync)" section carrying over, verbatim in substance, everything from the former `humanize-knowledge-sync`: per-source check lists, cadence, the five-step comparison protocol, the finding-classification rules, the ask-first rule with its example prompt, where findings land, versioning tie-in, and the exact non-git save steps. Internal `humanize-classifier` mentions inside the old file's ask-first example were updated to the current skill name.
- Three stale `humanize-classifier` cross-references inside `ai-pattern-remover`'s SKILL.md (its opening framing, the "leave alone" rule, and the meaning-drift section) were corrected to point at `ai-pattern-detector`'s filtering output directly.

### Validated against `/skill-creator` and `skill-creator-plus`

Checked directly, not asserted:

- **Frontmatter**: all three remaining skills plus the router carry `name`, a trigger-scoped `description`, and `metadata` (version, license, author, organization); versions bumped in lockstep to 0.3.0 for every file touched by this pass, and left at their prior version only where genuinely untouched (none, in this pass, every skill needed at least a cross-reference fix).
- **Progressive disclosure / size**: `humanize-ai` (120 lines), `ai-pattern-detector` (92 lines), `ai-pattern-remover` (67 lines), `humanize-ai-auditor` (59 lines), all comfortably under the size where splitting into `references/` becomes necessary; `ai-pattern-detector`'s merge roughly doubled its line count from the pre-merge `humanize-classifier` addition, still well within a single readable file.
- **De-duplication (Part 1)**: checked for restated rules across files, none found; gate thresholds live only in `humanize-ai-auditor`, the fabrication-cost test lives only in `ai-pattern-detector`, knowledge-sync mechanics live only in `humanize-ai`. Cross-references point rather than restate throughout.
- **Versioning discipline (Part 2)**: this is a structural rework (merging two skills into two others), a major-class change conceptually; following the same pre-1.0 convention used since v0.1.0's reset, it's recorded as a minor bump (0.2.0 → 0.3.0) with this full changelog entry, consistent with how the v0.1.0 → v0.2.0 restructuring was logged.
- **Naming/packaging**: `.claude-plugin/plugin.json` description and version updated to match; `commands/humanize-ai.md` required no change, it already referenced the skill by its stable name rather than any internal detail that moved.

### Backward compatibility, reconfirmed

`/humanize-ai` still resolves to `humanize-ai` exactly as before, no external caller needs to change anything. Anything that named `humanize-classifier` or `humanize-knowledge-sync` directly (not `/humanize-ai` itself) needs updating per the mapping table above, this is the second time an internal rename has happened; only the `/humanize-ai` entry point itself carries a stability guarantee across versions.

### Preserved (zero content loss)

Every rule, threshold, banned word, worked example, checklist item, piece of research, and workflow instruction from every prior version. This pass moved and merged file boundaries; it did not shorten, generalize, or remove any of the underlying knowledge or logic. Full content mapping back to v1.0.0 is cumulative across this file's earlier entries below.

---

## v0.2.0: 2026-08-22

Architecture change from nine source-organized skills to a four-stage workflow architecture (`ai-pattern-detector`, `humanize-classifier`, `ai-pattern-remover`, `humanize-ai-auditor`) plus a shared `/knowledge/` layer holding the four AI-pattern sources as reference material instead of skills. Added fact-lock verification and analyzer escalation logic. Full mapping and research citations preserved in this project's version history.

## v0.1.0: 2026-08-22

Version number deliberately reset from 2.0.0 to 0.1.0 at the user's explicit request. Added `humanize-detector-science` and `humanize-knowledge-sync`, renamed `humanize-router` to `humanize-ai`, added `commands/humanize-ai.md`.

## v2.0.0 / v1.0.0 (superseded)

Prior restructuring history (single skill → seven-skill plugin) preserved in this project's version history.
