# Narrative-Structure Tells (Fiction and Story-Driven Content)

**Source:** Jenna Russell, Rishanth Rajendhran, Chau Minh Pham, Mohit Iyyer, and John Wieting, "StoryScope: Investigating idiosyncrasies in AI fiction," COLM 2026. [arXiv:2604.03136](https://arxiv.org/abs/2604.03136) (v6, 10 August 2026). Findings and statistics are paraphrased and summarized for practical use, not reproduced from the paper.

**Last verified:** 2026-10-05

The other sources catch surface signals: vocabulary, formatting, chatbot leakage, sentence rhythm. Those are the fastest tells to fix and the fastest for model makers to train away. This file covers a deeper layer that survives surface editing: the narrative choices a story makes, not the words it uses.

## The study in brief

- 10,272 writing prompts, each written by a human author and by five LLMs: 61,608 stories of about 5,000 words each.
- StoryScope induces 304 discourse-level narrative features across 10 dimensions and deliberately leaves style out.
- Narrative features alone separate human from AI stories at 93.2% macro-F1, and attribute a story to one of six authors (human or one of five models) at 68.4% macro-F1, keeping over 97% of the performance of models that also use stylistic cues.
- A compact set of 30 core features carries much of the signal.
- After AI stories were rewritten to strip clichés and purple prose, narrative-based detection barely moved (95.5% to 93.9%). These choices are structural, not stylistic residue.

**When this file applies:** fiction, short stories, personal narratives, case studies with a real story arc, and any long-form piece where a sequence of events carries it. It does not apply to reference writing, technical documentation, or content with no narrative to speak of (the same limit as the story-structure guidance in `ai-pattern-remover`).

## Where AI-generated narrative tends to default

**States the theme instead of trusting the reader.** Narrators in AI stories spell out the moral roughly 77% of the time, against about 52% for human stories. AI dialogue is more often a vehicle for philosophical debate (59% against 34%). A story whose meaning is stated outright by the end is showing a signal, not just a style choice.

**Resolves too cleanly.** AI stories favor tight single causal chains, protagonist-driven resolutions, and few or no subplots (79% "no subplots" against 57% for humans). Endings lean toward internal acceptance instead of ambiguity, and human stories frame a protagonist's choices as more morally ambiguous. A story that ties every thread and explains exactly how the protagonist feels at the end is doing what AI fiction reliably does.

**Routes emotion through the body, and only through the body.** AI fiction conveys feeling through physical sensation and bodily metaphor (a tightening chest, cold sweat) far more than human writing (81% against 38%), leans on smell imagery (82% against 57%), and rarely names an emotion plainly (8% against 29%). "Show, don't tell" becomes a tell when it is the only mode.

**Avoids naming real things.** AI fiction references other works, authors, or cultural touchstones about half as often (24% against 47%), and its references are vague ("an old story her grandmother used to tell" instead of a named tale). Human writers break the fourth wall and address the reader far more often (28% against 7%).

**Stays chronologically linear.** Human authors use flashbacks, time jumps, and nonlinear structure to delay revelations much more; the paper reports greater temporal complexity in human stories. If a piece has a real reason to reorder time and doesn't, reconsider it.

**Converges on the same defaults.** Across all five models, AI stories cluster in one region of narrative space; human stories spread out and land in unusual territory far more often (in the rarest 10% of narrative choices more than three times as often as AI stories). A story that takes the safest option at every fork is doing what AI fiction does in aggregate.

## Per-model fingerprints

The paper's attribution features include examples by model: **Claude** produces notably flat event escalation, **GPT** over-indexes on dream sequences, and **Gemini** defaults to describing characters externally. Use these only as tie-breakers when the person says which model drafted the story.

## Surface tells in fiction (outside this paper)

Wikipedia's guide notes that fiction has its own stock tells it doesn't catalog, giving the overused character name "Elara Voss" and "whispering woods" as examples. Flag recurring stock names and settings as Tier 3 evidence, the same way as overused words.

## Applying this alongside the rest of the workflow

Run these checks after the standard pattern pass (`../source-2-wikipedia/ai-patterns-deep.md`), not instead of it. Fixing vocabulary and formatting does nothing for these tells, and fixing these does nothing for chatbot leakage or overused words; they sit on different layers and need separate checks.

This is the deepest layer the plugin addresses and the most expensive to fix: it usually means restructuring (adding a subplot, leaving something unresolved, reordering time), not editing a sentence. Treat it as a review of the story's design once its structure is set, not a line edit.

## What not to do with this

Don't force every story into flashbacks, ambiguous endings, and literary references to "pass" as human. That defeats the purpose of the Specificity Gradient (`../source-1-own-research/false-positives.md`): a story that resolves nothing because a checklist said so is just a different formula. Use these as questions about the piece's actual material, not a quota.
