# AI Patterns: Deep Reference (Content, Language, Tone, Structure)

**Sources:** sections marked **(Wikipedia)** paraphrase [Wikipedia:Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing), revision 1377935935, read 2026-10-05 (CC BY-SA 4.0; see `NOTICE.md`). Sections marked **(house reference)** are this plugin's own worked templates and examples, built to match those signs. Frequency figures marked **(Graphite)** come from Source 5.

**Last verified:** 2026-10-05

Read this when a Tier 2 finding is ambiguous or an edge case comes up. `ai-pattern-detector` uses it to name patterns; `ai-pattern-remover` uses the fixes.

**Contents:** 1. Why AI text reads generic · 2. Content patterns · 3. Language and grammar patterns · 4. The six sentence templates · 5. Negative parallelism edge cases · 6. Tone heuristics · 7. Rhythm · 8. Structural defaults · 9. Double-adjective stacking · 10. Change notes, messages, and English variety

---

## 1. Why AI text reads generic (Wikipedia)

A language model predicts the most statistically likely continuation, so its output **regresses to the mean**: specific, unusual facts get smoothed into generic, positive statements that would fit many subjects. "Inventor of the first train-coupling device" becomes "a revolutionary titan of industry." The subject gets less specific and more exaggerated at the same time. Most patterns below are forms of that one move, which is why the Specificity Gradient (`../source-1-own-research/false-positives.md`) is the filter for all of them.

## 2. Content patterns (Wikipedia)

**Undue significance, legacy, and broader trends.** Arbitrary details framed as representing or contributing to something bigger. Words to watch: *stands/serves as, is a testament/reminder, a pivotal/crucial/vital/key role or moment, underscores/highlights its importance, reflects broader, symbolizing its enduring, contributing to the, setting the stage for, marking/shaping the, represents a shift, key turning point, evolving landscape, focal point, indelible mark, deeply rooted.* Variants: placing the subject amid "broader debates" or "public discussions"; a hedged preamble admitting the detail is minor, followed by its importance anyway; biology text that dwells on "the broader ecosystem" or conservation efforts that don't exist. Fix: state what happened or what is different, and stop.

**Canned emphasis on notability and media coverage.** Proving importance by listing where something was covered and what kind of outlet it was, instead of saying what the coverage said. Words to watch: *independent coverage, local/national media outlets, trade publications, featured/profiled in, written by a leading expert, active social media presence.* More common in tools released in 2025 or later. Fix: say what a named source reported, or cut the list.

**Superficial analyses.** A present-participle phrase tacked onto a fact to comment on its significance: *highlighting, underscoring, emphasizing, ensuring, reflecting, symbolizing, contributing to, fostering, encompassing, enhancing, valuable insights, aligns/resonates with.* Retrieval-enabled chatbots attach these to a named source ("Roger Ebert highlighted the lasting influence") whether or not the source says anything like it. Fix: cut the -ing rider; keep it only if a source actually supports it, and then attribute it plainly.

**Promotional, ad-like language.** Travel-guide or press-release tone even when told to be neutral. Words to watch: *boasts, vibrant, rich, profound, showcasing, exemplifies, commitment to, natural beauty, nestled, in the heart of, groundbreaking, renowned, diverse array.* Older models (GPT-4 era) were blatantly positive; newer ones are subtly positive and avoid obvious superlatives. A rewrite that claims to "remove promotional tone" can add it. Fix: state what the thing is and does.

**Vague expression of connection.** Instead of the actual relationship ("was CEO of," "taught science at"), the text says two things are "associated with," "connected to," or "in connection with" each other, sometimes stacked ("particularly associated with"). Seen often in 2025 and 2026 output. Fix: name the relationship the source gives, or drop the claim.

**Vague attributions and overgeneralized opinions.** *Industry reports, observers have cited, experts argue, some critics argue, several sources/publications* (when one is cited), and *such as* before a list that is actually complete. Views from one or two sources presented as widely held; "scholars" when one person is cited. Fix: name who said it, or say less.

**Outline-like "challenges and future prospects."** "Despite its [praise], [subject] faces several challenges...", then a vaguely positive close or speculation about initiatives. Often under headings like "Challenges and Legacy" or "Future Outlook." The sign is the rigid formula, not any mention of challenges. Fix: state the specific problem and its known status, or cut.

**"X and Y" headings and "Awards and recognition" sections.** Headings in the form "X and Y" are common in AI output, and "Awards and recognition" (or "Recognition") is close to universal in AI-written profiles. Fix: a heading that names what the section holds.

## 3. Language and grammar patterns (Wikipedia)

**High density of "AI vocabulary."** Full lists and eras live in `banned-vocabulary.md`. One or two such words can be coincidence; many of them, many times, in post-2022 text is one of the strongest signs.

**Avoiding "is," "are," and "has" (copula avoidance).** *serves as, stands as, marks, functions as, operates as, represents, boasts, features, maintains, offers.* Newer output gets more elaborate ("ventured into politics as a candidate" for "was a candidate," "began his career as" for "was"). In definitions it writes "X refers to..." as if the topic were the word. One study found "is" and "are" fell more than 10% in academic writing during 2023. Fix: use "is," "are," "has."

**Negative parallelism.** Three forms:
- "Not just X, but also Y" / "not only... but..." / "It's not just..., it's..."
- "Not X, but Y" / "It's not..., it's..." / "no..., no..., just..."
- "Y rather than X," the reversed form, especially common in Grok output and also seen in ChatGPT and Claude. **(Graphite)** measures the whole family as "definition by contrast": "rather than merely" at 160× the human rate in Claude Opus 5, "the _ is not simply" at 576× in GPT-6 Astra (Source 5).

Common in human "myths busted" writing too, so weigh it in clusters. Details in §5.

**Rule of three.** "Adjective, adjective, adjective" or three short parallel phrases, used to make a thin analysis look complete. Stronger where nobody would bother with a flourish (a change note, a reply, a caption).

**Encyclopedic leads that define a list or a broad title as a thing** ("X refers to the compilation of..."). Mainly a reference-writing sign.

## 4. The six sentence templates (house reference)

Each template has a definition, examples, and the fix.

### Template 1: The contrasting dichotomy

**Pattern:** dismiss or minimize X, then assert Y as the real answer ("not X, it's Y").

**Examples:**
- "It's not about working harder. It's about working smarter."
- "It's not about the content. It's about the connection."
- "It's not a platform problem. It's a positioning problem."
- "Success isn't about talent. It's about showing up every day."
- "Marketing isn't about selling. It's about storytelling."

**Why it reads as AI:** the rejected half adds no information and exists only for contrast. The construction is overused enough to be a fingerprint.

**Fix:** delete the dismissed half and state the positive claim.
- "Working smarter produces better results than working longer."
- "Connection is what makes content stick."

### Template 2: The triple attribute sequence

**Pattern:** three one- or two-word sentences for emphasis.

**Examples:** "Focused. Aligned. Measurable." · "Simple. Scalable. Repeatable." · "Clear. Consistent. Compelling." · "Bold. Human. Honest." · "Fast. Flexible. Future-proof."

**Why it reads as AI:** overrepresented in AI output, recognized instantly by trained readers, and it trades meaning for rhythm.

**Fix:** one normal sentence. "A good framework is simple, can scale, and produces consistent results."

### Template 3: The binary negative-to-positive

**Pattern:** "Not because X. But because Y."

**Examples:** "Not because it was easy. But because it was right." · "Not by posting every day. But by saying something worth reading." · "Not because we had a big budget. But because we had a clear message." · "Not through hustle. Through strategy."

**Fix:** state the positive claim directly.
- "We chose it because it was right, not because it was easy."
- "Saying something worth reading matters more than posting frequency."

### Template 4: The fragmented Q&A loop

**Pattern:** a question fragment answered by a fragment, often chained.

**Examples:** "And the fix? Better briefs." · "The result? Growth. The cost? Almost nothing." · "And the outcome? Exactly what we hoped." · "The secret? Consistency. The price? Patience." · "And the lesson? Show up."

**Why it reads as AI:** punchy once, mechanical when it appears identically across pieces.

**Fix:** a full sentence. "Better briefs fixed the problem." · "Consistency was the secret, and patience was the only real cost."

### Template 5: The conditional inclusivity frame

**Pattern:** "Whether you're [persona A] or [persona B], [result C] is true."

**Examples:**
- "Whether you're a seasoned professional or just starting out, this guide applies to you."
- "Whether you're managing a team of two or two hundred, the principles are the same."
- "Whether you're an introvert or an extrovert, your story deserves to be told."
- "Whether you're scaling fast or just getting started, consistency is the key."

**Why it reads as AI:** it signals inclusivity without earning it, with a symmetry people rarely produce naturally.

**Fix:** write for one audience, or state the scope plainly. "These principles apply at any team size." · "If you are just starting out, this guide is built for you."

### Template 6: The symmetric dual action

**Pattern:** "It not only [does X], but it also [does Y]."

**Examples:**
- "It not only saves you time, but it also dramatically improves quality."
- "This approach not only builds trust, but it also drives measurable results."
- "It not only addresses the symptom, but it also solves the root cause."

**Fix:** a plain sentence. "It saves time and improves quality." · "This approach builds trust and shows measurable results."

## 5. Negative parallelism edge cases (house reference)

**The pattern spans sentences, not just clauses.** Scan three or four sentences at a time:

> "Most businesses focus on getting new customers. But the real opportunity is in retaining the ones you already have. The problem isn't acquisition. It's loyalty."

Each sentence is fine alone; across four sentences it is negative parallelism twice. **Fix:** "Customer retention is a larger growth lever than acquisition at most stages of a business."

**Allowed contrast: correcting a specific fact.**
- "The event is Tuesday, not Thursday." (corrects a date)
- "The figure was $2.4 million, not $4.2 million." (corrects a number)

Contrast used for drama, persuasion, or rhetorical lift gets rewritten, however specific it sounds.

## 6. Tone heuristics (house reference)

Ask these before deciding a passage has a tone problem.

**Fake authority**
- Conclusions stated as settled fact with no evidence or firsthand experience?
- Expertise claimed through language ("as a strategic thinker...") instead of shown?
- "Studies show" or "experts agree" with nothing specific cited?

**Forced confidence**
- All natural uncertainty removed on a topic that is uncertain?
- Outcomes claimed that no one could know?
- Would a real expert hedge more?

**Artificial enthusiasm**
- Every topic gets the same emotional weight?
- Every outcome is remarkable, exciting, or transformative?
- Selling enthusiasm instead of sharing a view?

**Empty expertise signaling**
- Complex concepts named but never explained?
- Jargon standing in for understanding?
- More concerned with sounding knowledgeable than being useful?

**Generic motivational language**
- "You've got this," "Take that first step," "The journey starts now," "You owe it to yourself." No information; remove.

**Importance flagging, tradeoff avoidance, helpfulness phrasing (Graphite).** "This matters," "why X matters," "matters because"; "without sacrificing," "without losing," "without compromising"; "can help you," "makes it easier," "helps you avoid," "is especially helpful." Each tells the reader what to think instead of giving the fact that would make them think it. See Source 5 for rates by model.

**Mannered prose (Graphite, using Anthropic's term).** Metaphor and flourish in place of a direct statement: "a dial worth turning" for "a parameter worth varying." Fix with the analogy rules in `ai-pattern-remover`.

**Polish is not a tone problem by itself.** Perfect grammar and a formal register are ineffective indicators (`caveats-and-human-signals.md`). Only flag polish when it comes with the patterns above.

## 7. Rhythm (house reference)

**Why burstiness matters:** human writing varies sentence length because thought is uneven: some ideas need room, others land harder short. AI text runs at a steady medium length. Graphite measured lower sentence-length variation in every model it tested (Source 5).

**Diagnostic:** count the words in each sentence of a paragraph. If every sentence falls between 12 and 22 words, the rhythm is flat. Human paragraphs range from about 4 to 40+ words.

**Fixing flat rhythm:**
1. Find the most important claim. Cut it to its shortest form and let it stand alone.
2. Find the most complex supporting detail. Give it the full sentence it needs.
3. Use the short sentence as a pivot, not a conclusion.

**Flat:** "Content strategy requires clear planning before execution begins. You need to understand your audience before writing anything. Every piece should serve a specific goal for the reader. Consistency over time is more important than occasional perfection." (8, 9, 10, 9 words: flat)

**Varied:** "Content strategy starts before you write a word. Understand the audience first: not the general audience, the specific person this piece is for. Every piece serves one goal. Not multiple goals, not a theme. One thing the reader should know or do when they finish." (8, 15, 5, 6, 11 words: varied)

The hard, countable version of this rule is Gate 2 in `humanize-ai-auditor`, explained in `../source-4-detector-methodology/statistical-detector-signals.md`.

## 8. Structural defaults (house reference)

**The predictable essay arc:** Problem → Agitate → Solution → Call to Action. Content that follows it beat for beat should be restructured.

**The uniform paragraph:** paragraphs of equal length with the same inner shape (topic sentence, two support sentences, transitional close). Vary paragraph length; let a paragraph be one short sentence sometimes.

**Puffery and its fix:**
- "a key turning point in..." → state what changed
- "a pivotal moment that..." → state what happened
- "a major paradigm shift..." → state what is different now
- "setting the stage for..." → state what came next
- "at the intersection of..." → state the actual relationship
- "the future of X is here" → state what changed or exists now

## 9. Double-adjective stacking (house reference)

A small cousin of the rule of three: two adjectives (or an adverb and an adjective) on nearly every noun, often when the text is trying to sound formal or scientific.

**Before:** "It plays a role in the ecosystem and contributes to the region's rich cultural heritage, serving as a major railway hub and improving operational efficiency across the regional transportation landscape."

**After:** "It supports the local economy. The site is also a railway hub, and recent upgrades improved transfer times."

Fine occasionally. It becomes a tell only when nearly every noun in a passage gets the treatment. Count across a paragraph, as with the rule of three.

## 10. Change notes, messages, and English variety (Wikipedia)

**Change notes and edit summaries.** AI-written summaries of an edit follow rigid templates: canned assurance that the change complies with guidelines (*refined, enhanced, streamlined, improved clarity and flow, neutral tone, verifiability*), procedural statements about what was *not* changed (*preserved, retained, avoided, ensured, while preserving the original meaning*), stress on the presence of sources (*added sourced content, with independent secondary sources*) instead of what the content says, and itemized parameter or template names. The more assurances stacked in one note, the stronger the sign. **This applies to this plugin's own notes:** the scratchpad and handoff notes name the specific change ("cut the 'Despite challenges' close; kept the 2019 date"), never a canned summary.

**Messages and replies.** "I hope this message finds you well," "I am writing to...," "I understand your concern(s) regarding...," "Dear [Organization] Team," and long replies split into titled sections. Also: itemized claims of having followed every rule, and asking critics to "focus on the content" instead of how it was produced.

**English variety mismatch.** Many chatbots default to American English. A writer from India or the UK writing about a local subject would usually use their own variety, so a sudden switch is a signal. Non-native writers mix varieties too, so weigh it only as part of a cluster. When rewriting, match the writer's variety (spelling, dates, idiom).

**Writing style that shifts suddenly** within one person's work (flawless prose next to their usual messages), or that tracks the AI style of each year, is a pattern editors use across many texts. It needs more than one document, so this plugin only mentions it when the person supplies older samples.
