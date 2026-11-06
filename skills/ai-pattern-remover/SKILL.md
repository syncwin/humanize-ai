---
name: ai-pattern-remover
description: Second stage of Humanize AI. Rewrites the parts of a text the detector marked safe to edit so it reads like a person wrote it, matching the writer's voice and keeping every fact, name, number, quote, and date. Use when someone wants the rewrite itself, such as "fix the AI-sounding parts", "rewrite what you flagged", "make this match my voice", or "humanize this paragraph without changing the facts", and when /humanize-ai runs it. Also answers how to structure a personal story, calibrate to a voice sample, or avoid overcorrecting. On its own it acts only on findings that already exist (or asks to run detection first), and humanize-ai-auditor still checks the result.
license: MIT
metadata:
  displayName: AI Pattern Remover
  version: '0.5.2'
  author: "@wasimness"
  company: SyncWin
---

# AI Pattern Remover

Plans, then rewrites, in one skill: the plan is a short decision (voice, fit, facts) that stays current because it sits next to the rewrite. Runs on the findings list from `ai-pattern-detector`. Knowledge paths are under `${CLAUDE_PLUGIN_ROOT}/knowledge/`.

**Contents:** Before starting · Phase 1 Plan · Phase 2 Execute (what to put in, human writing, craft constraints, citations) · Anti-overcorrection · Handoff

## Before starting

- **Findings:** every "leave alone" item is off-limits, even if it matches a pattern below. "Safe to edit" items are where the work goes. Narrative findings are structural revision targets, not line edits.
- **No findings available** (standalone run with nothing earlier in the conversation): say so and ask whether to run `ai-pattern-detector` first. Don't detect on your own.
- **Leakage always goes:** Tier 1 leakage (chatbot phrasing, placeholders, citation markup) is removed whatever else changes.

## Phase 1: Plan

**Fact-lock list (before any rewriting).** From the *original* text, list every number, statistic, proper name, date, direct quote, URL, citation, and specific factual claim, plus the degree of certainty on each claim ("may," "will," "about"). This list goes to `humanize-ai-auditor` with the rewrite. For invented fiction, lock only the real-world framing (author bio, real places or facts stated as real).

**Voice calibration** (when a writing sample is provided). Read it first: sentence-length habits, word-choice level, paragraph openings, punctuation, contractions, exclamation marks, asides, recurring tics, transitions, and English variety (spelling, date format, idiom). Match the voice; don't just strip patterns and fall back to a generic "human" register. Short sentences stay short; "stuff" stays "stuff." A sample that shows habitual dash use overrides Gate 1 (dashes) in the auditor. Nothing overrides Gate 2 (rhythm). No sample: use the defaults in Phase 2 and keep the text's existing English variety.

**Content-type fit.** Reference, technical, and encyclopedic content skips the Experience Hierarchy and story guidance: a neutral, plain voice is correct there. Short-form skips the story-structure and analogy-frequency guidance. Fiction routes narrative findings into structural revision before line work.

**Section by section.** For anything over about 150 words or with sections, rewrite one section at a time and check its rhythm and dashes before moving on. The auditor confirms at the end; it shouldn't be the first check.

## Phase 2: Execute

### What to put in

**The Experience Hierarchy** (most important rule here). Level 1, personal experience: the writer did it, lived it, or watched it, always strongest. Level 2, researched and verified, attributed clearly ("from what I've seen"). Level 3, unknown territory: skip it instead of faking experience the author doesn't have.

**Personal story structure:** brief context (when, what, what was at stake), then what happened, honestly, including where the writer was wrong, then the insight, then the link back to the reader. Short-form compresses each to a sentence; long-form gets real detail (names, dates, what was said). Admitting a mistake is more memorable than proving a point. Never invent or embellish: find a real story or skip it.

**Human-writing markers (Graphite, Source 5),** used only where the voice and the material support them: first person, direct reader address, casual qualifiers ("pretty," "sort of"), small real anecdotes, contractions, parenthetical asides, the occasional exclamation mark. People use all of these far more than current models do. Never invent an anecdote, a relative, or a "last year" to add one.

**Opinions that sound human:** state the belief, then the reason or experience behind it. Don't soften to avoid pushback. When disagreeing with a common view, say so and why. "I think" for perspective, not for facts; don't hedge what you're sure of.

**Endings that push:** something the reader can do, decide, or feel. Never a restatement or a vague look ahead.

**Vulnerability without oversharing:** past mistakes relevant to the piece, struggles the reader likely shares, honestly held unpopular opinions, real uncertainty. Not unrelated private details, backstory longer than the point, or bids for sympathy.

**The one-person test:** does this read as written for one specific person with a specific problem?

**Personality:** avoiding patterns is half the job; sterile writing is just as obvious. Where the content and voice call for it (blog, essay, opinion, personal), have opinions, react to facts, vary rhythm, allow a tangent or a half-formed thought. Not in encyclopedic, technical, legal, or reference writing.

### Human writing principles

Natural variation (mix sentence lengths on purpose, allow fragments, avoid symmetry) · authentic voice (clarity over polish; an informed person, not a publication) · strong communication (get to the point, swap a vague claim for a number, name, or situation the material supplies, cut filler) · conversational flow (prefer "and," "but," "so," "because" to "furthermore" and "consequently"; if a sentence was never meant to be spoken, rewrite it). Plain verbs over stiff ones: *wrote*, *used*, *tried*, *moved*, *is*, *has*.

### Craft constraints

**Patterns to rewrite on sight** (when safe to edit): the six sentence templates and negative parallelism in `source-2-wikipedia/ai-patterns-deep.md`; Graphite's frame families (definition by contrast, importance flagging, tradeoff avoidance, helpfulness phrasing, evaluative adjectives, superlatives) in `source-5-corpus-research/model-specific-tells.md`; Part A words in `source-2-wikipedia/banned-vocabulary.md`. Use Part B swaps where they make a sentence plainer. Worked pairs: `source-2-wikipedia/before-after-examples.md`. When a frame hides a real tradeoff ("without sacrificing freshness"), state the tradeoff the material gives.

**Cut, don't reword, costless sentences.** When a flagged sentence is generic and the material offers nothing specific to put in its place, delete it (the second-order check in `source-1-own-research/false-positives.md`). Rewording it just moves the vagueness.

**Don't put words in the writer's mouth.** Never turn a general claim into a first-person stance, decision, or lesson the writer didn't state ("I'd pay for...", "That night taught me..."). Personal voice comes from the writer's material, not from the rewrite.

**Don't introduce new tells.** Before the handoff, re-scan every sentence you wrote for Part A words and Source 5 frames, especially "matters more than," "this matters," "rather than," "isn't X, it's Y," "without sacrificing," "can help you," "makes it easier," and "in practice." A rewrite that trades one tell for another isn't done.

**Pseudo-specific numbers:** replace an unsourced "twenty minutes" or "a handful" with what the material actually says, or say less. Never swap in a different made-up number.

**Headings:** sentence case, direct and descriptive, no dramatic reframes. Banned: "The Hidden Truth About X," "Not a tool. A system." Correct: "Why community moderation matters."

**Analogy, metaphor, and mannered prose:** default is none. Use an analogy only when the subject is unfamiliar or abstract, the analogy clarifies instead of decorating, it's shorter than the literal explanation, it can't mislead, and it sounds normal read aloud. Frequency: under 800 words, none; 800 to 1,500 words, one at most; longer, one per 1,500 words. Banned setups: "Think of it as," "Imagine," "Picture this," "It is like," "A bridge between," "The DNA of," "The glue that holds." Banned metaphor verbs for abstract subjects: sanded down, bolted on, stitched together, woven, baked in, sparked, distilled, crystallized. Use literal verbs: cut, added, removed, changed, caused, showed, explained, fixed. Graphite measured this "mannered prose" (metaphor in place of a direct statement) at about 1.6 to 2.5 times the human level in current Claude and Gemini models.

**Rhythm:** mix sentence lengths deliberately, avoid three or more similar-length sentences in a row, allow natural digressions and self-corrections. The auditor's Gate 2 verifies by count.

**Dashes:** write without em or en dashes (Gate 1) unless the voice sample shows the writer uses them.

### Citations and sources

Never invent a source, and never "repair" a suspect citation (a dead link, a DOI to the wrong paper, a source that doesn't support its sentence, leaked chatbot markup) so it looks plausible. Keep the claim and its citation exactly as given, or cut the claim if it can't stand without the source, and list the citation in the handoff for the author to verify.

## Anti-overcorrection

The goal is writing that is human and precise, not messy for its own sake. Don't strip a strong, polished voice for being polished; don't replace precise technical language with vague casual language; don't remove structure that helps clarity; don't trade accuracy for a conversational tone; don't overuse slang or fragments; don't force quirks; don't flatten a distinctive voice. Perfect grammar and formal register are not AI tells (`source-2-wikipedia/caveats-and-human-signals.md`).

**Synonym swapping doesn't work.** Swapping "utilize" for "use" while keeping the sentence structure, paragraph template, and rhythm leaves the measured signal in place (Source 4), and most measured tells are multi-word frames, not single words (Source 5). Change clause structure, pacing, transitions, emphasis, and paragraph weight together.

**Meaning drift is the main risk.** Never let a rewrite soften a claim, drop a qualifier, change a number, or garble a name, quote, or citation, and take extra care past about 800 words. Check each cut against the detector's annotation and the fact-lock list. The auditor catches drift afterwards; the aim is to give it nothing to catch.

## Handoff to `humanize-ai-auditor`

Return:
- the rewritten piece;
- the fact-lock list from Phase 1;
- specific notes, never canned ones ("cut the 'Despite challenges' close," not "improved clarity and flow while preserving meaning"): costly details left alone on purpose, places where the voice sample overrode a default, structural changes made for narrative findings, and any suspect citations for the author.

`humanize-ai-auditor` turns this handoff into the run's scratchpad (`assets/scratchpad-template.md` in that skill), so this stage never writes a separate one.
