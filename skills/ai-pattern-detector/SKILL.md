---
name: ai-pattern-detector
description: First stage of Humanize AI. Finds AI-writing tells in a piece of text, ranks each by how reliable it is (chatbot leakage, pattern clusters, vocabulary and frames, rhythm, narrative structure for fiction), and marks each one safe to edit or leave alone using the Specificity Gradient. Use when someone wants a diagnosis without a rewrite, such as "what makes this sound like AI?", "flag the AI patterns in this", "is this AI-written?", or "which lines would a detector catch?", and when /humanize-ai runs it. Also explains how a tell is tiered. On its own it never rewrites; humanize-ai-auditor closes the run with a detect-only scratchpad.
license: MIT
metadata:
  displayName: AI Pattern Detector
  version: '0.5.1'
  author: "@wasimness"
  company: SyncWin
---

# AI Pattern Detector

Produces one tiered, filtered findings list per piece: what looks AI-typical, ranked by signal strength, with every finding put through the Specificity Gradient in the same pass. Knowledge paths below are under `${CLAUDE_PLUGIN_ROOT}/knowledge/`.

**Contents:** Fast path · Knowledge used · Signal tiers · Weak and ineffective signals · Model-aware check · Rhythm signal · Narrative signal · Specificity Gradient filter · Content-type confirmation · Handoff

## Fast path and escalation

1. **Fast pass, always:** Tier 1 (chatbot leakage) and a mechanical formatting look (dashes, bold, headings, leftover markup). Cheapest and highest-confidence. Report formatting issues; `humanize-ai-auditor` enforces them.
2. **Escalate to the full pass** (Tier 2, Tier 3, rhythm) when the fast pass finds nothing, when the piece is long-form or high-stakes (client-facing, published, over about 500 words), or when the person asks for a thorough check.
3. **Narrative layer,** separately, for fiction or long-form with a real story arc, whatever the other passes found.
4. **The Specificity Gradient runs on every finding** at every level, even when only the fast pass ran.

## Knowledge used

- `source-2-wikipedia/chatbot-leakage.md`: Tier 1.
- `source-2-wikipedia/ai-patterns-deep.md` and `before-after-examples.md`: Tier 2.
- `source-2-wikipedia/banned-vocabulary.md` (Part A only) and `source-5-corpus-research/model-specific-tells.md`: Tier 3.
- `source-2-wikipedia/formatting-tells.md`: formatting signals.
- `source-2-wikipedia/caveats-and-human-signals.md`: what not to flag, and how sure to be.
- `source-3-research-paper/narrative-structure-tells.md`: narrative layer.
- `source-4-detector-methodology/statistical-detector-signals.md`: reasoning for rhythm findings.
- `source-1-own-research/false-positives.md`: the full Specificity Gradient.

On the full pass, open the file for each tier you run before reporting it. A fast pass on a short piece can work from the summaries below.

## Signal tiers

1. **Chatbot leakage: near-certain alone.** Collaborative phrasing ("I hope this helps," "Certainly!"), advice to the user pasted as content, cutoff and retrieval disclaimers ("not widely documented," "based on available information"), unfilled placeholders ("[Your Name]," "2025-XX-XX"), chatbot citation markup (`oaicite`, `turn0search`, `[cite: 1]`, `start_span`, `grok-card`, `【85†L261-269】`, `[attached_file:1]`, `:::writing`), chatbot tracking parameters (`utm_source=chatgpt.com`), mixed markup languages, and fabricated or mismatched citations.
2. **Pattern clusters: reliable together, not alone.** Content: significance and legacy inflation, notability and media-coverage claims, superficial -ing analyses, promotional tone, vague association ("associated with," "in connection with"), vague attributions and inflated source counts, the "despite challenges" formula, "X and Y" or "Awards and recognition" headings. Language: copula avoidance, negative parallelism (all three forms), rule of three, double-adjective stacking. Tone: fake authority, forced confidence, uniform enthusiasm, empty expertise, motivational filler, importance flagging, tradeoff avoidance, helpfulness phrasing, mannered prose. Structure: problem-agitate-solution arcs, uniform paragraphs, section summaries, canned change notes, message templates, English-variety mismatch.
3. **Vocabulary and frames: weakest alone.** Part A of `banned-vocabulary.md` and the frame families in Source 5. Count density across the piece; one "delve" proves nothing.

Don't flatten the tiers. A single listed word and a leaked "I hope this helps!" are different kinds of evidence.

## Weak and ineffective signals

- **Weak, count only inside a cluster:** em dashes (now rare in current models; a text *without* dashes says nothing), curly quotes (flag only a mix of curly and straight), elegant variation, didactic disclaimers, "In conclusion" summaries. These are mostly historical (`source-2-wikipedia/caveats-and-human-signals.md`).
- **Never flag on their own:** perfect grammar, a formal or academic register, mixed casual and formal registers, prose that just feels bland, isolated transition words, missing citations. Wikipedia's guide lists these as ineffective indicators.
- **Confidence:** heavy LLM users identify AI text correctly only about 90% of the time; casual readers do little better than chance. State findings as signs, never as proof of authorship.

## Model-aware check

If the person said which model drafted the text, check that family's row in Source 5 first (GPT: hedging and corrective framing; Claude: superlatives, "less X, more Y," pseudo-specific numbers, helpfulness phrasing; Gemini: intensifiers, formal transitions, missing contractions). Use it to prioritize, never to conclude, and never infer the model from the text. Tells shift 55% to 72% between versions, so the lists are samples.

## Rhythm signal

Flag paragraphs whose sentence lengths are flat, and phrasing that takes the single most predictable option where a specific one exists. Give the reasoning; the countable gate belongs to the auditor (Gate 2).

## Narrative signal (fiction and story-driven content only)

Run after the standard pass, as a separate axis, never merged into the tiers. Check the six defaults in `source-3-research-paper/narrative-structure-tells.md`: stated theme, tidy single-track resolution, emotion only through the body, unnamed references and no reader address, strict chronology, safest choice at every fork. Report findings as structural revision targets.

## Specificity Gradient filter

Every finding, from every tier and both extra axes, gets this before the list is final. Full statement and rationale: `source-1-own-research/false-positives.md`.

1. Isolate the specific claim or detail, not the whole paragraph.
2. Ask: could someone with no connection to the subject write this exact detail without effort? Yes → **safe to edit**. No → **leave alone**, and note that the surrounding pattern can be fixed around it.
3. Pseudo-specific details (round, plausible numbers and timeframes with no source, such as "twenty minutes" or "a handful") count as costless.
4. Unsure → leave it.
5. Second-order check: if a cut only shortens without making the claim more specific or defensible, it isn't a real fix. The same test applies to word choice: an obscure word picked only for unpredictability fails it.

## Content-type and mode confirmation

Reading the text is where the router's guesses get checked. If the type differs (a "blog post" with a real narrative arc, an "article" that is really a reply), say so and apply the right layers.

## Handoff

Return one findings list. Each item: tier (or "rhythm" or "narrative"), the quoted text, **safe to edit** or **leave alone**, and a one-line fabrication-cost reason. Add the confirmed content type, any suspect citations, and leakage that must be removed whatever else happens. `ai-pattern-remover` acts on this list directly; in detect-only mode it goes straight to `humanize-ai-auditor`, which writes the scoped scratchpad.
