# Formatting-Level AI Tells

**Source:** [Wikipedia:Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing), section "Style," paraphrased from revision 1377935935, read 2026-10-05 (CC BY-SA 4.0; see `NOTICE.md`). Em-dash rates from Graphite's AI Tells research (Source 5). The dash rule itself is this plugin's house style, enforced as Gate 1 in `humanize-ai-auditor`.

**Last verified:** 2026-10-05

Vocabulary and tone are half of it. Chatbots also have visual and structural habits that show even when the prose is clean.

## Em dashes and en dashes: a house rule, no longer strong evidence

**As evidence, the em dash is now weak.** Graphite (Source 5) measured GPT-6 Astra at about one-eighth of the human rate, Gemini 3.1 Pro near zero, and Claude Opus 5.5 at 0.015 per 1,000 words (99% below Opus 5). In September 2026 Wikipedia's guide noted the sign seems less common in current output and may move to its historical indicators. What still points to older AI text is *how* dashes are used: spaced em dashes ( — ) in pat, "punched up" sales rhythm, piled onto parallelisms, in places where a person would use a comma, colon, or parentheses. Count a dash only as part of a cluster, and never read a text *without* dashes as human.

**As output, the rule stays.** Readers still see the em dash as the classic AI tell, so dashes cost credibility whatever their cause. Delivered text therefore uses no em dashes (—) and no en dashes (–), and no spaced hyphen ( - ) or double hyphen (--) doing a dash's job. Hyphens inside compound words ("well-known," "pre-1.0") are fine; for number ranges write "5 to 7." The one override: a voice sample that shows the writer uses dashes habitually.

Replace each dash, in order of preference:

1. A period: start a new sentence.
2. A comma: a tight aside.
3. A colon: an explanation or list follows.
4. Parentheses: a true aside.
5. Restructure the sentence.

**Before:** The new policy — announced without warning — affects thousands of workers.
**After:** The new policy, announced without warning, affects thousands of workers.

Scan for the literal characters `—` (U+2014) and `–` (U+2013), and for ` - ` and ` -- ` between words. Any hit means the pass isn't done.

## Overuse of boldface

Chatbots bold phrases mechanically, often every mention of a key term, "key takeaways" style (a habit from READMEs, slide decks, and listicles). Keep bold for real emphasis.

**Before:** It blends **OKRs (Objectives and Key Results)**, **KPIs**, and **Business Model Canvas (BMC)**.
**After:** It blends OKRs, KPIs, and visual strategy tools like the Business Model Canvas.

## Inline-header vertical lists

A list where each item starts with a bolded label and a colon, then a sentence. Variants: no separator between label and text, or bullets typed as `•`, `-`, `–`, or emoji.

**Before:**
- **User Experience:** The interface has been significantly improved.
- **Performance:** Enhanced through optimized algorithms.
- **Security:** Strengthened with end-to-end encryption.

**After:** The update improves the interface, speeds up load times through optimized algorithms, and adds end-to-end encryption.

Prose beats a labelled bullet list unless the content really is a reference list.

## Headings

- **Title case:** chatbots capitalize every main word. Use sentence case.
  **Before:** `## Strategic Negotiations And Global Partnerships`
  **After:** `## Strategic negotiations and global partnerships`
- **Title repeated as a heading** at the top of a piece that already has a title.
- **Headings that only hold other headings**, with no text of their own.
- **Skipped or misused levels:** sections that start at the third level, or many top-level headings.
- **Thematic breaks (`---`) between every section,** a Markdown habit.
- **"X and Y" headings**, and "Awards and recognition" sections in particular (see `ai-patterns-deep.md`).

## Small, unnecessary tables

Two- or three-row tables for facts that read better as a sentence ("Metric | Figure," "Name | Designation"). Keep tables for data people will scan or compare.

## Emoji as formatting

Emoji in front of headings or bullets (🚀 💡 ✅). Rarer in current models but still seen. Remove unless the writer's own voice and platform use them, such as a casual social post.

## Curly quotation marks: match the destination

Curly quotes (“ ” ‘ ’) alone prove nothing. ChatGPT and DeepSeek usually produce them; Claude and Gemini usually don't. Word, macOS, iOS, and grammar tools convert straight quotes automatically, and professional typesetting (Chicago style, newspapers) uses curly ones. The meaningful sign is **inconsistency**: curly and straight quotes or apostrophes mixed in one text, which happens when chatbot output is pasted into human-typed text. Normalize to one style, whichever the destination uses; straight quotes are the default for web and plain text.

**Before:** He said “the project is on track" but others didn't agree.
**After:** He said "the project is on track" but others didn't agree.

## Applying this file

Run one fast mechanical scan before delivery, after the content-level checks: dashes, boldface, labelled lists, heading hygiene, tiny tables, emoji, quote consistency, and leftover markup from `chatbot-leakage.md`. `humanize-ai-auditor` owns the scan; `ai-pattern-detector` only reports what it sees.
