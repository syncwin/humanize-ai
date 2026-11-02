# Caveats, Ineffective Indicators, and Signs of Human Writing

**Source:** [Wikipedia:Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing) (WikiProject AI Cleanup), sections "Caveats," "Signs of human writing," "Ineffective indicators," and "Historical indicators." Paraphrased from revision 1377935935, read 2026-10-05. Text licensed CC BY-SA 4.0; see `NOTICE.md`.

**Last verified:** 2026-10-05

This file is the canonical home for detection humility in this plugin. Other files point here instead of restating it.

## The guide's own framing

- The page is **descriptive, not prescriptive**: observations, not rules, and many signs are specific to Wikipedia.
- Every entry is a **sign of a possible problem, not the problem itself**. The guide asks readers not to treat the signs as the thing to fix, because cosmetic fixes "could just make detection harder" while the real problems (unsourced claims, fabricated citations, promotional framing, synthesis) stay. This plugin follows that: `ai-pattern-remover` fixes the underlying claim, and flags what it cannot fix (a citation that doesn't support its sentence) instead of polishing it.

## Detection ability (people and tools)

- **Tools:** detectors such as GPTZero and Pangram beat chance but have non-trivial error rates, and paraphrasing, markup, spacing changes, or a model the detector wasn't trained on all shift results (RAID benchmark, Dugan et al., ACL 2024; Dik et al., 2025, on GPTZero).
- **People:** a 2025 study found people no better than chance (Cheng et al., *Advances in Simulation*); a 2025 study on German theses found recognition rates of 57% for AI texts and 64% for human texts (Fiedler and Döpke). Heavy LLM users identified AI-written articles correctly about 90% of the time, so even an expert flags roughly one false positive in ten; light users did only slightly better than chance (Russell, Karpinska, and Iyyer, ACL 2025).
- **Convergence:** human speech and writing are absorbing LLM habits (studies from 2024 and 2025 on podcasts, academic writing, and word choice), and some writers now change their style to avoid accusations.

## Ineffective indicators (never flag on their own)

These are commonly cited, and the guide says they don't work, sometimes pointing the other way:

- **Perfect grammar.** Many skilled human writers produce it.
- **Mixed casual and formal registers, or "clinical yet emotional" language.** Common in technical people's casual writing, in younger writers, in neurodivergent writers, and in text with several authors.
- **"Bland" or "robotic" prose in general.** LLM output has specific traits (positive, verbose), and those are what count, not a vague feeling.
- **Fancy, academic, or formal prose.** Only *specific* words are overused; formality as such is not a tell.
- **Transition words in isolation.** Only a few transitions are overused, and essay-style human writing uses them too. (Source 5 shows "furthermore" and "additionally" are strong *Gemini* tells; that is a model-specific frequency signal, not a reason to flag one "furthermore.")
- **Unsourced content.** Most uncited text on the web predates LLMs, and chatbots now add citations routinely. A citation being present says nothing about whether it supports the sentence.

Also from Graphite (Source 5): do not classify authorship from individual tells.

## Signs of human writing

Observed over 25 years of Wikipedia, these appear *more* often in human-written text than in AI text (which defaults to a "formal, neutral" register):

- simple "is" and "has" sentences ("there is a," "it has a")
- plain verbs where AI picks stiff or euphemistic ones: *wrote* (not authored), *moved* (not relocated), *used* (not utilized), *tried* (not attempted), *died* (not passed away)
- definite or superlative statements in encyclopedic text ("one of the best," "is the only," "was the first"). Note the genre split: in web articles Graphite found Claude *overusing* superlatives (Source 5). Judge by genre.
- hedges and intensifiers ("very," "perhaps," "tends to")
- wordy constructions ("as a result of," "in order to," "all of the," "the fact that")

The last two bullets matter for `banned-vocabulary.md`: trimming "in order to" or a hedge can still be good editing, but their presence is not evidence of AI.

Other human signals the guide lists: text that predates 30 November 2022 (ChatGPT's public launch), and a writer who can explain their own choices or mistakes.

## Historical indicators (older models; low weight today)

Common in 2022 to 2024 output and much rarer now. They help with older text but weigh little against current models:

- **Didactic disclaimers:** "it's important to note," "it's crucial to remember," "may vary."
- **Section summaries:** paragraphs or sections that end "In summary," "In conclusion," "Overall," restating the point.
- **Prompt refusals:** "As an AI language model, I can't..."
- **Abrupt cut-offs** mid-sentence (old token limits; a broken paste can do the same).
- **Outdated access dates** on citations relative to the edit date.
- **Elegant variation** from repetition penalties (rotating synonyms for one thing). Non-native writers taught to avoid repetition do this too, for example in Italian schooling.
- **Em dashes** are heading the same way: in September 2026 the guide noted the sign seems less common in current output and may move to this section. See `formatting-tells.md` and Source 5.
