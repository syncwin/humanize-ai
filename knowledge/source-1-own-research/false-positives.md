# The Specificity Gradient: Deciding What Not to Touch

**Source:** SyncWin's own editing research (Source 1). Not synced from outside; it changes only through real editing work. Related outside evidence is pointed to, not merged in.

**Last verified:** 2026-10-05

This is the canonical statement of the filter. `ai-pattern-detector` applies it to every finding and keeps only a short version.

Most humanizing guides work as a list: here are things that look like AI, except don't flag these specific exceptions. That approach breaks down because the exception list always trails the pattern list: someone finds a new false positive every week and the list grows forever.

This plugin uses one test instead, applied per detail.

## The test: could a stranger fabricate this without effort?

For any sentence or passage you're about to edit for "sounding AI," ask:

**If someone who had never touched this subject tried to fabricate this exact sentence, would it cost them anything to get right?**

- **Costs nothing to fabricate** → likely synthetic, safe to edit. Generic claims, rounded-off descriptions, safe hedges, tidy transitions. A model produces these by default because they need no real knowledge.
- **Costs something to fabricate** → likely genuine, leave it alone. A specific number someone would have to look up. An opinion with a reason attached that could be argued with. A detail so oddly specific that inventing it would take more effort than having lived it. A contradiction the writer hasn't smoothed over.

This is a **gradient**, not a binary list. The more effort a detail would take to fake, the further it sits from "safe to homogenize," whether or not it contains a word or structure from the pattern lists.

## Pseudo-specific details cost nothing

Some details *look* specific and cost nothing: round, plausible quantities and timeframes ("twenty minutes," "a handful," "two or three," "six months," "a decade"), a "recent study" with no name, a percentage with no source. Graphite measured Claude using exactly these concrete-sounding numbers and timeframes more with each version (`../source-5-corpus-research/model-specific-tells.md`). Treat them as costless unless the source material or the writer supplied them. A number that would need checking is costly; a number anyone would guess is not.

## Why this catches what exception lists miss

A fixed exception list (curly quotes are fine, one em dash is fine, formal vocabulary is fine) protects only the cases someone already wrote down. The fabrication-cost test asks the same question every time, so new edge cases resolve themselves without a list update.

It also catches the inverse failure: prose that hits zero flagged patterns in `../source-2-wikipedia/ai-patterns-deep.md` but is still bland and generic enough that anyone could have written it about anything. Passing every rule in a checklist is not the same as costing something to produce.

Outside corroboration: Wikipedia's guide explains AI text as a regression to the mean, where specific, unusual facts get replaced by generic, positive statements (`../source-2-wikipedia/ai-patterns-deep.md` §1). The gradient is the same idea turned into an editing decision.

## Applying it

Before cutting or rewriting anything flagged elsewhere:

1. **Isolate the specific claim or detail**, not the whole paragraph.
2. **Ask what it would take for someone with zero connection to the subject to write that exact detail.** If the honest answer is "nothing, they'd guess something plausible," edit it. If it's "they'd need to actually know this," stop: leave the detail, and fix the surrounding pattern that flagged the passage without touching the detail itself.
3. **When unsure, leave it.** An unnecessary edit (flattening real voice) costs more than a missed tell: a missed tell can be caught in the next pass, and a flattened human detail is gone.

## Second-order check: worse, or just blander?

If cutting a phrase only makes the piece shorter without making the claim more specific or defensible, the edit is chasing the *appearance* of humanization. Real edits replace a costless claim with a costly one, or cut it and say less. They don't reshuffle the same vagueness into different words.

## Use it in both directions

- **When detecting:** a costly detail inside a flagged sentence lowers confidence that the sentence is synthetic.
- **When rewriting:** never manufacture costly-looking detail. An invented anecdote, figure, or source is worse than the generic sentence it replaced, and it breaks the fact-lock. If the piece needs a specific that isn't in the material, ask the writer or say less.
