# Compliance Checklist

The single list of AI-verifiable checks `humanize-ai-auditor` runs. It says what to verify, not why; the reasons live in the knowledge files (paths under `${CLAUDE_PLUGIN_ROOT}/knowledge/`).

**Every check that applies to the content type gets run, every time.** Length and content type change which checks apply and how results are shown, never whether an applicable check runs.

---

## Content-type applicability matrix

Identify the content type first (router Step 1, confirmed by the detector), then run only what the matrix marks. A two-line caption shouldn't get the 2,000-word treatment, and fiction checks shouldn't run on a sales email.

| Check category | Long-form (blog, article, case study) | Short-form (social, captions) | Email and replies | Fiction / narrative | Sales, marketing | Reference / technical |
|---|---|---|---|---|---|---|
| Chatbot leakage, placeholders, citation markup | Always | Always | Always | Always | Always | Always |
| Gate 1 dashes and formatting scan | Always | Always | Always | Always | Always | Always |
| Gate 2 rhythm and predictability | Always | Always; lighter under ~3 sentences | Always | Always | Always | Always |
| Vocabulary and frames (evidence lists) | Always | Always | Always | Always | Always | Always |
| Content-level patterns | Always | Only those that fit the length (rule of three, fake-candid hooks, contrast framing); skip section-shaped ones | Message templates, contrast framing, importance flagging | Always | Always | Only where it doesn't fight required precision |
| Narrative-structure tells | Only if framed as a story (case study or testimonial with a real arc) | Skip | Skip | Always | Skip | Skip |
| Experience Hierarchy and story structure | Where the piece calls for a personal angle | Where relevant, brief | Where relevant | Always | Where relevant | Skip; neutral voice is correct |
| Heading rules | If headings exist | N/A | N/A | N/A | If headings exist | If headings exist |
| Specificity Gradient | Always | Always | Always | Always | Always | Always |
| Fact-lock (numbers, names, quotes, dates, claims) | Whenever a rewrite happened | Whenever a rewrite happened | Whenever a rewrite happened | Real-world framing only | Whenever a rewrite happened | Whenever a rewrite happened |
| Analogy and mannered-prose rules | Always | Rarely applies | Always | Use judgment; fiction has its own norms | Always | Always |
| One-person test | Where audience specificity matters | Where audience specificity matters | Always | N/A | Always | N/A |

No clear match: use the long-form column, the most complete set.

---

## AI-verifiable, checked before every delivery

### Leakage and statistical signals (always)
- [ ] No collaborative phrasing, advice-to-the-user text, cutoff or retrieval disclaimers, unfilled placeholders, chatbot citation markup, chatbot tracking parameters, or mixed markup (`source-2-wikipedia/chatbot-leakage.md`)
- [ ] Sentence lengths counted per paragraph: no more than two consecutive sentences within ~4 words of each other; paragraphs of 3+ sentences have one under 8 words and one over 20 where length allows (`source-4-detector-methodology/statistical-detector-signals.md`)
- [ ] No em dashes or en dashes, and no spaced hyphen or double hyphen used as a dash, unless a voice sample overrides (`source-2-wikipedia/formatting-tells.md`)
- [ ] Content-carrying phrasing checked for the default-predictable choice where a specific one exists

### Vocabulary and formatting (always)
- [ ] Evidence-list words and frames (`source-2-wikipedia/banned-vocabulary.md` Part A, `source-5-corpus-research/model-specific-tells.md`) not clustered; any left are quoting or discussing the pattern itself
- [ ] Boldface, labelled lists, title case, title-as-heading, headings with no text, skipped heading levels, separators between every section, tiny tables, and emoji checked (`source-2-wikipedia/formatting-tells.md`)
- [ ] Quotation marks and apostrophes consistent (all straight or all curly, matching the destination)
- [ ] English variety consistent with the writer (spelling, dates, idiom)

### Content-level patterns (per the matrix)
- [ ] No significance or legacy inflation, notability or media-coverage claims, superficial -ing analyses, promotional language, vague association ("associated with," "in connection with"), vague attributions or inflated source counts, "despite challenges" formula, "X and Y" or "Awards and recognition" headings, copula avoidance, negative parallelism (any of the three forms), rule-of-three defaults, double-adjective stacking, false ranges, meta-commentary, participle padding, predictable problem/solution/takeaway arc, passive subjectless fragments, or fake-candid hooks (`source-2-wikipedia/ai-patterns-deep.md`)
- [ ] No fake authority, forced confidence, artificial or uniform enthusiasm, empty expertise, motivational filler, importance flagging ("this matters," "why X matters"), tradeoff avoidance ("without sacrificing"), or helpfulness phrasing ("can help you," "makes it easier")
- [ ] Analogies present pass all five permission conditions, or there are none; no mannered prose (metaphor where a direct statement works)
- [ ] Emails and replies: no message templates ("I hope this message finds you well," "I am writing to," "I understand your concern")

### Narrative-structure tells (fiction and story-driven content only)
- [ ] Theme not spelled out by the narrator; morals shown, not stated
- [ ] Plot not artificially tidy; loose ends or ambiguity where the story calls for them
- [ ] Emotion not routed only through the body; some feelings named directly
- [ ] Specific, named references where a character would plausibly know something specific
- [ ] Reader address or nonlinear structure used where it fits, not defaulted away from
- [ ] No recurring stock names or settings
- [ ] Detail: `source-3-research-paper/narrative-structure-tells.md`

### Structure and headings (where the content has them)
- [ ] Headings in sentence case, no dramatic reframes
- [ ] First sentence isn't throat-clearing or scene-setting
- [ ] Ending doesn't restate points already made; no "In summary" paragraph

### Fabrication cost (always)
- [ ] Every claim run through the Specificity Gradient: would it cost a stranger real effort to fake this exact detail? (`source-1-own-research/false-positives.md`)
- [ ] No pseudo-specific numbers or timeframes added without a source
- [ ] No anecdote, person, figure, or source invented to sound human
- [ ] Nothing specific flattened while chasing a pattern elsewhere on this list
- [ ] Sentences the rewrite added or changed introduce no new tells (re-run the vocabulary and frame check on them)
- [ ] No first-person stance, decision, lesson, or experience attributed to the writer that the original didn't state

### Fact-lock verification (whenever a rewrite happened)
- [ ] Every number, statistic, name, date, direct quote, URL, citation, and specific claim matches the original, or the change is intended and listed
- [ ] No qualifier, hedge, or degree of certainty quietly softened or strengthened
- [ ] Every citation still points to the same source and supports the same sentence; suspect citations listed for the author, not repaired

### Voice and audience fit
- [ ] Matches the writing sample, if one was given
- [ ] Passes the one-person test where audience specificity matters
- [ ] Reads as something the author would write and stand behind, not just a piece that cleared every rule above
- [ ] Change notes in the scratchpad are specific, not canned

---

## Manual: the author checks these

The auditor can't run them. List them plainly; never mark them passed.

- [ ] Optional: AI-detector scores on more than one tool, read as noisy signals, not targets (`source-4-detector-methodology/statistical-detector-signals.md`)
- [ ] Suspect citations verified
- [ ] Final human read-through before publishing
