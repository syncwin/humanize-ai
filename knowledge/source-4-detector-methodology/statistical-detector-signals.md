# Statistical Detector Signals: Perplexity, Burstiness, and Reliability

**Sources:** publicly documented concepts behind AI-text classifiers (perplexity, burstiness, watermarking, provenance); the caveats in [Wikipedia:Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing) and the studies it cites; Liang et al. (2023) on non-native writers; Graphite's AI Tells research (Source 5); Article 50 of the EU AI Act. Full citations at the end.

**Last verified:** 2026-10-05

The other sources catch what a careful human editor would notice. This file covers what detector tools compute. A piece can pass every qualitative check and still score high on a detector, because detectors measure word- and sentence-level statistics, not "does this sound human." This file is the canonical home for those mechanics and for Gate 2's rationale.

**Applies to every content type**, unlike `../source-3-research-paper/narrative-structure-tells.md`.

## The two core metrics

**Perplexity:** how predictable each word is given what came before. A language model picks high-probability words by default, so raw output leans toward the *most expected* word: "the cat sat on the mat," not "the cat sat on the windowsill, watching pigeons argue over a dropped bagel." Low perplexity reads as more AI-typical; surprising but accurate word choices read as more human.

**Burstiness:** how much sentence structure varies across a piece. People write unevenly: a short, blunt sentence, then a long one that winds through a few ideas, then another short one. Models default to uniform length and rhythm. Graphite measured lower sentence-length variation in every model it tested (Source 5).

Commercial classifiers combine these with lexical and structural features; perplexity and burstiness remain the inputs most of them start from.

## Why pattern rules aren't enough on their own

Removing overused words, chatbot leakage, and formulaic structure all help, but none of them forces higher perplexity or burstiness. A sentence with no "delve," perfectly grammatical, can still be the single most predictable way to say its idea. That is why the auditor runs a separate, countable rhythm gate.

## Hard requirements (Gate 2, checked on every piece)

**Sentence-length variance, counted, not eyeballed:**
- No more than two consecutive sentences within about 4 words of each other in length.
- Every paragraph of 3 or more sentences has at least one sentence under 8 words and one over 20, unless the paragraph is too short for that range.
- A flat count (for example 14, 15, 13, 16) fails even if every sentence reads fine alone. Fix by cutting one sentence to a short one or merging two into a longer one, not by rephrasing at the same length.

**Perplexity: don't default to the first, safest phrasing.** For any sentence carrying content (not a connective), ask whether this is the phrasing almost any writer or model would produce. If so, look for a specific, less expected substitute: a concrete detail, an unusual but accurate word, an example instead of a category. This is the Specificity Gradient (`../source-1-own-research/false-positives.md`) at the word level: a costly detail is almost always a higher-perplexity one.

**Run both as a final mechanical pass,** the same way `../source-2-wikipedia/formatting-tells.md` gets a final scan. Count sentence lengths per paragraph before delivering.

## What this does not mean

Don't manufacture variance. A short sentence bolted on that adds nothing, or an obscure word chosen only because it's unexpected, is its own tell and fails the fabrication-cost test. Graphite found AI articles already use a *wider* vocabulary within each article and longer words than human writers (5.2 to 5.7 characters per word against 4.9), so reaching for rarer words moves text the wrong way. The goal is the variance and specificity that unforced writing already has.

## How detection works now

- **Classifier-based** (GPTZero, Pangram, Originality.ai, Copyleaks, Turnitin's AI module): trained models scoring perplexity, burstiness, and lexical and structural features together. Vendors publish their own accuracy figures; independent results are lower and vary by genre, length, and model.
- **Watermark-based:** some providers (for example Google DeepMind's SynthID) bias token selection in a way only their own tools can detect. It survives light edits, weakens under heavy paraphrase or mixing with human text, and only exists for models that implement it. This plugin can't detect or affect it.
- **Provenance-based** (C2PA and similar): signed metadata attached at creation, a disclosure layer rather than a writing signal. Irrelevant to the rewriting task.

## Reliability: a score is one noisy signal

- **Tools beat chance but err.** Wikipedia's guide warns against relying on detectors alone and notes that paraphrasing, markup, spacing changes, and models absent from the detector's training data all shift scores (RAID benchmark, Dugan et al., 2024; Dik et al., 2025, on GPTZero).
- **Bias against non-native writers.** Liang et al. (2023) found widely used detectors consistently misclassified essays by non-native English writers as AI-generated while identifying native writers' essays accurately, and warned against using detectors in evaluative or educational settings.
- **Model churn.** Tells shift 55% to 72% between consecutive model versions, and every model writes more like other models than like people (Source 5). A detector trained on last year's models can miss this year's.
- **Known weak spots** (qualitative; vendors document their own thresholds): very short text gives unstable scores; hybrid text (part human, part AI) is the hardest case; domain-constrained writing (legal, technical, medical) is naturally predictable and draws false positives.
- **People aren't better.** See `../source-2-wikipedia/caveats-and-human-signals.md`.

So: a residual non-zero score does not mean the writing still reads as AI-generated to a person, and a low score does not prove a person wrote it. Treat a score as one signal. Never sacrifice a real, specific detail or the writer's voice to chase the last few points on one tool.

## Why synonym swapping fails

Swapping "utilize" for "use" while keeping the same sentence structure, paragraph template, and rhythm leaves the measured signal where it was: the probability profile and the sentence-length pattern don't change. Graphite also counted roughly 13,000 measured tells, most of them multi-word frames, so a word list can't cover them. Real humanization changes clause structure, pacing, transitions, emphasis, and paragraph weight together. That is `ai-pattern-remover`'s job.

## Rewriting changes facts if nothing checks it

The risk this plugin is built around: a rewrite aimed at sounding human can soften a claim, drop a qualifier, round a number, or garble a name, quote, or citation, and the risk grows with length and with the number of specific figures. Wikipedia's guide records the related failure where an AI rewrite that claims to "remove promotional tone" adds it, and where retrieval-enabled tools attach paraphrases to sources that never said them. `humanize-ai-auditor`'s fact-lock exists for this, and it outranks any detector score.

## Regulatory note (awareness only, not legal advice)

Article 50 of the EU AI Act has applied since 2 August 2026. Under Article 50(4), deployers of an AI system that generates or manipulates text **published to inform the public on matters of public interest** must disclose that the text was AI-generated or manipulated, unless the content went through human review or editorial control and a natural or legal person holds editorial responsibility for the publication. The European Commission published guidelines on these obligations in August 2026. This plugin does not decide whether the rule applies; it reminds the person when it might. Consult counsel for client work.

## Citations

- Wikipedia contributors, "Wikipedia:Signs of AI writing," revision 1377935935, read 2026-10-05. https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing
- Dugan, L. et al. (2024). "RAID: A Shared Benchmark for Robust Evaluation of Machine-Generated Text Detectors." ACL 2024. arXiv:2405.07940
- Dik, S., Erdem, O., and Dik, M. (2025). "Assessing GPTZero's Accuracy in Identifying AI vs. Human-Written Essays." arXiv:2506.23517
- Liang, W., Yuksekgonul, M., Mao, Y., Wu, E., and Zou, J. (2023). "GPT detectors are biased against non-native English writers." *Patterns* 4(7). arXiv:2304.02819
- Druck, G., Paredes, J. L., and Smith, E. (2026). "AI Tells" and "AI Tells: Opus 5.5 Update." Graphite. https://graphite.io/five-percent/research/ai-tells
- Regulation (EU) 2024/1689 (AI Act), Article 50. https://artificialintelligenceact.eu/article/50/ ; European Commission, "Guidelines on transparency obligations for providers and deployers of certain AI systems." https://digital-strategy.ec.europa.eu/en/policies/guidelines-ai-transparency-obligations
