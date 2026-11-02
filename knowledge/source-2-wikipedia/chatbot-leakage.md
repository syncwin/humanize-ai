# Chatbot Leakage: Highest-Signal Tier

**Source:** [Wikipedia:Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing), sections "Communication intended for the user," "Markup," and "Citations." Paraphrased from revision 1377935935, read 2026-10-05 (CC BY-SA 4.0; see `NOTICE.md`).

**Last verified:** 2026-10-05

The guide treats leftover chatbot text and broken citation markup as among the most reliable signs there are, more reliable than any word or tone pattern. Treat a hit here as near-certain, not "possible." Check this tier **first**: it catches text that was written as a reply to a person and pasted into content meant to stand alone.

## Collaborative phrasing left in

Lines addressed to the person who prompted the chatbot:

- "Certainly! Here is your...", "Of course!", "Sure, here's a revised version"
- "You're absolutely right!"
- "I hope this helps," "Let me know if you'd like me to adjust...", "Would you like me to add...", "Is there anything else...", "a more detailed breakdown"
- any line that offers to keep working instead of being content

## Advice or prewriting pasted as content

Text written *to* the user about the content, not the content itself: "In this section, we will discuss...", "ensure that the content is presented in a neutral tone," "Here's a template for your page. You can copy and paste...", "Delete this section before submission," or instructions to a reviewer. A chatbot asked to write for a platform often names that platform's rules in the output ("this complies with LinkedIn best practices"); people rarely state that their writing is *for* the place it appears.

## Cutoff, retrieval, and usage disclaimers

- Knowledge-cutoff lines: "As of my last knowledge update...", "Up to my last training update..."
- Retrieval failures stated as facts: "While specific details are limited/scarce...", "not widely documented/available/disclosed," "in the provided sources/search results," "based on available information." These are often followed by what the information "likely" is. The guess, and the claim that it "isn't documented," are both speculation. About people, the same move reads "maintains a low profile" or "keeps personal details private."
- 2026 usage disclaimers, usually a negative parallelism: "[claim] should be treated as [tradition/opinion] rather than as [fact]."
- Older refusals ("As an AI language model, I...") are now rare; see `caveats-and-human-signals.md`, Historical indicators.

## Placeholders never filled in

Mad Libs-style blanks the user was meant to replace: "[Your Name]," "[Describe the specific section...]," "**[Specific Topic]**," "(Add your channel URL here)," "(If available)," placeholder dates such as "2025-XX-XX," and fake citation fields such as `INSERT_SOURCE_URL_30` or `PASTE_YOUTUBE_VIDEO_URL_HERE`. Check whether a blank belongs to a real template before calling it a tell.

## Chatbot citation and formatting markup

Internal markup that leaks when chatbot output is copied. Each one is close to proof that a chatbot touched the text (it doesn't prove the chatbot wrote all of it):

| Tool | What leaks |
|---|---|
| ChatGPT | `:contentReference[oaicite:0]{index=0}`, `oai_citation`, source names followed by `+1` or `+3`, `citeturn0search0` (also `turn0image0`, `turn0news0`, `turn1file0`), `({"attribution":{"attributableIndex":"1009-1"}})` |
| Gemini | `[cite: 1]` or `[cite: 3, 12, 13]`, `[span_1](start_span)` and `[span_1](end_span)` |
| Grok | `<grok-card data-id="..." data-type="citation_card">`, `grok_render_citation_card_json` |
| DeepSeek | lenticular-bracket citations such as `【85†L261-269】` |
| Perplexity | `[attached_file:1]`, `[web:1]`, links containing `ppl-ai-file-upload` |
| Unattributed (seen since June 2026) | `:::writing{variant="document" id="12345"}` with a closing `:::` |

**Tracking parameters on cited URLs:** `utm_source=chatgpt.com` or `utm_source=openai` (ChatGPT), `utm_source=copilot.com` (Microsoft Copilot), `referrer=grok.com` (Grok). These show the tool *found* the source; someone may have used it only to look up a citation for their own text.

**Footnote return arrows** (`↩`) around footnotes, copied from a chat interface.

## Markdown leaking into another format

Chatbots default to Markdown. In plain prose, a CMS field, or another markup language, watch for literal `**bold**`, `##` headings, triple-backtick fences (including a fence labelled with the target format, such as ```` ```wikitext ````), `---` before every heading, and heading levels that start below the top level. **Mixed markup languages in one text are a strong sign; Markdown alone is not.** Developers, writers, and many apps use Markdown every day.

## Fabricated or mismatched citations

Hallucinated references: DOIs that don't resolve or lead to unrelated papers, ISBNs that fail their checksum, several dead links that no web archive has ever seen, book citations with no page number (or a page that doesn't contain the claim), and named references that are defined but never used. A real source cited for a claim it doesn't make is the commonest form, and retrieval-enabled chatbots now attach invented paraphrases to named people ("Roger Ebert highlighted the lasting influence...").

This plugin does not verify citations. It flags suspect ones for the author and never "repairs" them to look plausible.

## Why this tier ranks first

A word like "delve" is probabilistic: plenty of people write it. A literal "I hope this helps!" at the end of a blog post, or an `oaicite` tag, is not something a person produces while writing that content. Fix this tier first: it is the tell most likely to be real and usually the fastest to fix. For how far to trust any single sign, see `caveats-and-human-signals.md`.
