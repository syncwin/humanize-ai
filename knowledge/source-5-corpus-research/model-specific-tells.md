# Model-Specific Tells: Corpus Research (Graphite AI Tells, 2026)

**Last verified:** 2026-10-05

**Contents:** Sources · What this source adds · Frame families · Per-family tells · Stylistic features · Human-writing markers · Mannered prose · Trends · Limitations · How to use this file

## Sources

- Gregory Druck, Jose Luis Paredes, and Ethan Smith, **"AI Tells,"** Graphite research, published 2026-09-16. https://graphite.io/five-percent/research/ai-tells
- Same authors, **"AI Tells: Opus 5.5 Update,"** Graphite research, published 2026-10-01. https://graphite.io/five-percent/research/ai-tells-opus-5-5-update

Figures below are quoted or paraphrased from those two pages. Ratios are "times the human rate" after length normalization unless a row says otherwise. Graphite publishes the underlying tells data and article data for download; check it before quoting a ratio that isn't listed here.

**Method in one paragraph.** 10,000 human web articles from Common Crawl, all published before ChatGPT launched (30 November 2022), paired by topic with 90,000 AI articles from nine models (GPT-4.1, GPT-5, GPT-5.6 Sol, GPT-6 Astra, Claude Opus 4, Opus 4.6, Opus 5, Gemini 2.5 Pro, Gemini 3.1 Pro). Each AI article was written from a GPT-4.1 summary of the human article, so both cover the same subtopics. A "tell" is a word, two- or three-word phrase, or frame (common words with gaps of one to three less common words, written with `_`) used at least twice the human rate and passing frequency thresholds. The update adds Claude Opus 5.5 and uses 9,974 aligned topics.

## What this source adds

Source 2 (Wikipedia) catalogs patterns editors see in the wild. Source 4 explains how detectors score text. This source answers a third question: **which words and frames does each current model family overuse against matched human writing, and how fast does that list change?** Headline numbers:

- 12,877 unique tells across the nine models; each model has 2,355 to 3,746. Opus 5.5 has 2,548 (Opus 5: 2,666; Opus 4.6: 3,059; Opus 4: 3,746).
- 65% of tells belong to one model family only.
- Between the two latest versions of a family, 55% to 72% of tells are unique to one version. GPT-6 Astra has about 3,700 tells (3,687), and only 45% of the tells across Astra and GPT-5.6 Sol are shared.

Practical consequence: no word list is complete, and any list goes stale with the next model release. Frames and patterns travel better than single words.

## Frame families (shared across models)

| Family | What it does | Examples (model, × human rate) |
|---|---|---|
| Definition by contrast | Says what something is by saying what it isn't | "the _ is not simply" (Astra, 576×), "rather than relying" (Astra, 187×), "not simply" (Astra, 157×), "rather than merely" (Opus 5, 160×), "less like a _ and more like" (Opus 5, 105×), "is not just a _ it is" (Gemini 3.1 Pro, 153×), "is more than a _ it" (Opus 5.5, 98×), "rather than simply" (Opus 5.5, 32×) |
| Flagging importance | Tells the reader something matters instead of showing why | "matters because" (Astra 357×, Opus 5 132×), "this matters" (Opus 5.5, 116×), "why _ matters" (Opus 5.5, 92×), "matters more than" (Opus 5, 93×), "distinction matters" (Astra; no human occurrences), "absolutely essential" (Gemini, 32×) |
| Avoiding tradeoffs | Promises a benefit with no cost | "without requiring" (Astra, 70×), "without losing" (Astra 22×, Opus 5 6.1×, Gemini 5.4×), "without sacrificing" (Gemini 7.8×, Astra 6.4×, Opus 5 4.3×), "without compromising" (Gemini 5.2×, Opus 5 2.6×) |
| Transitions | Signposts between ideas | "another dimension" (Astra, 117×), "together these" (Astra, 95×), "looking ahead the" (Opus 5.5, 40×), "adds another layer" (Opus 5.5, 27×), "what comes next" (Opus 5.5, 24×), "ultimately this" (Gemini, 78×), "furthermore the" (Gemini, 43×), "in practice" (Opus 5.5, 7×) |
| Evaluative adjectives | Rates without describing | "dependable" (Astra 59×, Opus 5.5 23×), "practical" (Astra, 26×), "deliberate" (Opus 5, 26×), "profound" (Gemini, 25×), "immense" (Gemini, 22×), "incredibly" (Gemini, 18×), "steady" (Opus 5.5, 11×), "thoughtful" (Opus 5.5, 9×), "meaningful" (Astra 13×, Opus 5.5 8×) |

## Per-family tells

**GPT (OpenAI).** Hedges and qualifies more than Claude: "may provide" (36× the Opus 5 rate; 18× the Opus 5.5 rate), "not necessarily" (17× to 18×), "does not establish" (275× the Opus 5.5 rate). Corrective framing ("rather than," "not just," "not simply," "does not") keeps rising: Astra uses it about 12× the human rate. "may" is about 3× as frequent in Astra as in GPT-4.1. Marketing words ("payoff," "unlock," "elevate," "amplify," "streamline," "boost," "leverage," "wins," "tangible") are 73% rarer in Astra than in GPT-4.1. Sol overused "in addition" (14× Astra); Astra overuses "need not" (17× Sol).

**Claude (Anthropic).** Frames things as unusually important or extreme: "single most" and "arguably the most" (no occurrences in Astra), "every single" (112× Astra), "enormously" (45× Astra). Opus 5.5 still leans on superlatives against Astra: "the most popular" (45×), "perhaps the most" (29×), "the most powerful" (24×), "one of the best _ about" (79×). "Less X, more Y" comparisons reached about 82× the human rate. Hype words ("groundbreaking," "paramount," "unprecedented," "revolutionary," "invaluable," "profound," "exceptional") fell across versions while **concrete-sounding numbers and timeframes** rose: "twenty minutes," "ten minutes," "five minutes," "a dozen," "a handful," "six months," "a decade," "two or three." Opus 5 used "is genuinely" 1,021 times against 4 in the human corpus; Opus 5.5 dropped it (Opus 5 uses it 26× as often), along with "matters enormously" (15×) and "an enormous amount" (8×). Opus 5.5 added helpfulness language: "is especially helpful" (12× Opus 5), "can help you" (8×), "makes it easier" (6×), "helps you avoid" (5×).

**Gemini (Google).** Intensifiers, formal transitions, and guide language: "incredibly" (1,835× Astra), "additionally" (1,139× Astra), "absolutely" (110× Astra), "furthermore" and "this comprehensive guide" (no occurrences in Astra). Intensifiers ("absolutely," "entirely," "highly," "incredibly") reached about 13× the human rate. Contractions ("it's," "don't," "you're," "isn't," "doesn't") nearly disappear in Gemini 3.1 Pro; precision words ("exactly," "precisely," "specifically") rise.

## Stylistic features

- **Sentence-length variation:** much lower in every model than in human writing. This is the measured basis for the rhythm gate in `../source-4-detector-methodology/statistical-detector-signals.md`.
- **Vocabulary:** AI articles show *wider* vocabulary within an article (higher MTLD) and longer words (5.2 to 5.7 characters per word against 4.9 for human writing). Wide vocabulary inside one piece does not mean varied style across pieces.
- **Em dashes:** no longer a consistent tell. GPT-6 Astra uses about one-eighth of the pre-ChatGPT human rate (88% below), Gemini 3.1 Pro has nearly stopped, Opus 5 was near the human rate, and Opus 5.5 uses 0.015 per 1,000 words against 2.92 for Opus 5 (99% lower). Both Opus 5.5 and Astra now sit far *below* human writers. A text with no dashes tells you nothing about who wrote it.
- **Exclamation marks and parenthetical asides:** human writers use exclamation marks more than a hundred times as often as each of the three current models, and interrupt themselves with parenthetical asides far more often.

## Human-writing markers

Graphite also measured what human writing does more often. These feed `ai-pattern-remover`'s Phase 2, and they only count when the material is real:

- first person ("we all know," "we're going to")
- direct reader address ("you can't," "did you know")
- casual qualifiers ("pretty," "sort of")
- small anecdotes ("he said," "years ago")
- personal experience ("my favorite," "mom," "last year")
- personal enthusiasm ("love to," "excited to")
- contractions, exclamation marks, parenthetical asides

Never invent an anecdote, a relative, or a "last year" to hit this list. A fabricated personal detail fails the Specificity Gradient (`../source-1-own-research/false-positives.md`) and the Experience Hierarchy in `ai-pattern-remover`.

## Mannered prose

Graphite uses Anthropic's term **mannered prose** for writing that substitutes metaphor and flourish for direct statement ("a dial worth turning" where "a parameter worth varying" says it plainly). Scored by Claude Opus 5 on 0 to 100 over a 1,000-topic subsample: Opus 5 and Gemini 3.1 Pro sit about 2.5× the human score, Astra about 1.2×. Claude's score rose 19% from Opus 4 to Opus 5, then Opus 5.5 fell 37% (10.57 against 16.75; human mean 6.65), still about 1.6× human. The remover's analogy and metaphor rules are the fix.

## Trends

- **Well-known tells are fading:** across 11 predefined features (hallmark words like "crucial" and "delve," "not X, it's Y" antithesis, boilerplate such as "it is important to note" and "at its core," formulaic closes, closing calls to action, sycophantic phrases, self-referential signposting, hedging, parenthetical asides, two list measures), average strength fell 21% to 50% per family, and combined frequency fell 41% to 86% from the earliest to the latest model. Opus 5.5 is 6% below Opus 5 and 53% below Opus 4 on this measure.
- **But AI writing is not consistently getting more human.** Word-distribution divergence from human writing (Jensen-Shannon, unigrams) fell for Claude (Opus 5 0.064 to Opus 5.5 0.052, 19% lower) and rose for GPT (Sol 0.101 to Astra 0.109, 8% higher). Nouns, verbs, adjectives, and adverbs account for about 79% of the gap between Astra and Opus 5.5.
- **Every model writes more like another model than like a human** across unigrams, bigrams, and trigrams. Some of that may come from the shared prompt.
- Semantic similarity to the paired human article barely changes across versions.

## Limitations (as stated by Graphite)

- Web articles only; tells may differ in conversations, fiction, email, or other genres.
- The human baseline predates ChatGPT, so style changes since 2022 can be misread as AI tells.
- One fixed generation prompt; a different prompt would change the tells.
- Mannered-prose scores are model-judged, so some evaluator bias is possible.
- Results cover only the model versions tested.
- Graphite does **not** recommend classifying authorship from individual tells; for that it points to AI detectors.

## How to use this file

1. **Frames over words.** Flag a frame family when it recurs in a passage; a single "in practice" or "dependable" is noise.
2. **Model-aware, not model-dependent.** If the person says which model drafted the text, check that family's row first. Never guess the model from the text and then treat the guess as evidence.
3. **Pseudo-specific numbers.** Round, plausible quantities and timeframes ("twenty minutes," "a handful," "six months") look specific but cost nothing to invent. The Specificity Gradient treats them as costless unless the source or the writer supplied them.
4. **Samples, not a full list.** The tables hold a few dozen of roughly 13,000 measured tells. Treat them as examples of each family.
5. **Re-check after a model release.** Tells churn by 55% to 72% between versions. The router's knowledge maintenance lists this source.
