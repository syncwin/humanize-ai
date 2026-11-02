# Banned Vocabulary: Evidence Lists and House-Style Swaps

**Sources:** Part A paraphrases [Wikipedia:Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing), section "High density of 'AI vocabulary' words" (revision 1377935935, read 2026-10-05; CC BY-SA 4.0, see `NOTICE.md`) and Graphite's AI Tells research (Source 5). Part B is this plugin's house style.

**Last verified:** 2026-10-05

This file holds two different kinds of list. Keep them apart:

- **Part A, evidence:** words and frames that research measured as overused by language models. These count as Tier 3 evidence in `ai-pattern-detector`, and only in clusters.
- **Part B, house style:** plain-language swaps that make most writing better. Many of these words are *not* evidence of AI on their own, and some ("in order to," hedges like "perhaps") are more common in human writing than in AI writing (`caveats-and-human-signals.md`). Use Part B when rewriting; don't cite it as proof that a text is AI-written.

When a listed term turns up in text being rewritten, pick the alternative that fits the sentence's meaning. If none fits, rewrite the sentence in plain language. Where no alternative is listed, delete the term or restructure the sentence.

---

## Part A: Evidence-backed AI vocabulary

**Read literally.** A word being overused does not make its synonyms overused, and context matters ("underscore" can mean an underline mark or film music).

**Density, not presence.** One or two of these in a piece can be coincidence. Many of them, many times, in text written after 2022 is one of the strongest signs, because they co-occur.

**Wikipedia's words to watch, by era** (rough boundaries):

| Era (dominant model) | Words that recur together |
|---|---|
| 2023 to mid-2024 (GPT-4) | *Additionally* (especially opening a sentence), *boasts*, *bolstered*, *crucial*, *delve*, *emphasizing*, *enduring*, *garner*, *intricate/intricacies*, *interplay*, *key* (adjective), *landscape* (abstract), *meticulous/meticulously*, *pivotal*, *underscore*, *tapestry*, *testament*, *valuable*, *vibrant* |
| Mid-2024 to mid-2025 (GPT-4o) | *align with*, *bolstered*, *crucial*, *emphasizing*, *enhance*, *enduring*, *fostering*, *highlighting*, *pivotal*, *showcasing*, *underscore*, *vibrant* |
| Mid-2025 onward (GPT-5) | *emphasizing*, *enhance*, *highlighting*, *showcasing*, plus the notability phrases in `ai-patterns-deep.md` §2 (*independent coverage*, *featured in*, *active social media presence*) |

Also listed without an era: *deep dive*, *highlight* (verb), *robust*, *showcase*. "Delve" was heavily overused in 2023 and early 2024, faded later in 2024, and dropped sharply in 2025, so its absence means little now. **Grok** overuses pseudo-scientific words (*causal*, *empirical*, *correlate*) and still overuses *underscore* in 2026.

**Graphite's measured families (2026 models).** Frames travel better than single words; full tables with rates in `../source-5-corpus-research/model-specific-tells.md`:

| Family | Examples |
|---|---|
| Definition by contrast | "rather than simply/merely," "not simply," "is not just a _ it is," "less like a _ and more like," "is more than a _ it" |
| Flagging importance | "this matters," "why _ matters," "matters because," "matters more than," "absolutely essential" |
| Avoiding tradeoffs | "without sacrificing," "without losing," "without compromising," "without requiring" |
| Transitions | "looking ahead the," "what comes next," "adds another layer," "another dimension," "together these," "ultimately this," "furthermore the" |
| Evaluative adjectives | dependable, practical, meaningful, deliberate, measured, steady, thoughtful, profound, immense |
| Hype words (fading in Claude) | groundbreaking, paramount, unprecedented, revolutionary, invaluable, profound, exceptional |
| Marketing words (fading in GPT) | payoff, unlock, elevate, amplify, streamline, boost, leverage, wins, tangible |
| Intensifiers (rising in Gemini) | absolutely, entirely, highly, incredibly, remarkably |
| Superlatives (Claude) | "single most," "arguably the most," "every single," "perhaps the most," "the most powerful," "enormously" |
| Helpfulness (Claude Opus 5.5) | "can help you," "makes it easier," "helps you avoid," "is especially helpful" |

---

## Part B: House style, plain-language swaps

These tables are SyncWin's editing preferences. Terms that also appear in Part A are evidence as well; the rest are only style.

### Core list

| Banned Term | Natural Alternatives |
|---|---|
| delve | explore, examine, look into, go through, cover |
| realm | area, field, world, space, domain |
| harness | use, apply, draw on, put to work |
| unlock | use, access, open, reveal, find |
| tapestry | mix, combination, range, picture |
| paradigm | model, approach, framework, way of thinking |
| cutting-edge | latest, current, advanced, new |
| revolutionize | change, transform, overhaul, reshape |
| intricate / intricacies | complex, detailed, nuances, specifics |
| showcase | show, display, demonstrate, feature |
| crucial | key, important, essential, necessary |
| pivotal | key, critical, deciding, central |
| surpass | beat, exceed, outperform, go beyond |
| meticulously | carefully, thoroughly, precisely, in detail |
| vibrant | lively, active, strong, rich |
| unparalleled | unmatched, unique, exceptional, the best |
| underscore | highlight, show, confirm, reinforce |
| leverage | use, apply, draw on, rely on |
| synergy | cooperation, combined effort, coordination |
| innovative | new, original, fresh, different |
| game-changer | shift, major change, turning point |
| testament | proof, sign, evidence, demonstration |
| meticulous | careful, precise, exact, thorough |
| highlight | note, point out, show, mention |
| emphasize | stress, note, point out, focus on |
| boast | have, include, offer, feature |
| groundbreaking | new, first, original, significant |
| align | match, fit, work with, agree with |
| foster | build, grow, support, develop, encourage |
| enhance | improve, increase, strengthen, add to |
| holistic | complete, full, whole, overall |
| garner | get, earn, build, collect |
| accentuate | highlight, stress, draw attention to |
| pioneering | first, early, original, leading |
| trailblazing | first, original, new |
| unleash | release, use, apply, bring out |
| versatile | flexible, adaptable, useful in many ways |
| transformative | significant, major, life-changing |
| redefine | change, rethink, reshape |
| seamless | smooth, easy, simple, straightforward |
| optimize | improve, refine, adjust, fine-tune |
| scalable | flexible, expandable, can grow |
| robust | strong, solid, reliable, thorough |
| breakthrough | advance, discovery, new development |
| empower | help, enable, give the tools to, allow |
| streamline | simplify, cut, reduce, make faster |
| frictionless | smooth, easy, without friction |
| elevate | improve, raise, lift, strengthen |
| adaptive | flexible, adjustable, responsive |
| effortless | easy, simple, straightforward |
| data-driven | based on data, evidence-based |
| insightful | useful, revealing, informative |
| proactive | ahead of time, early, prepared |
| mission-critical | essential, necessary, required |
| visionary | forward-thinking, ambitious, long-term |
| disruptive | new, challenging, changing the field |
| reimagine | rethink, redesign, reconsider |
| unprecedented | new, first-ever, never seen before |
| intuitive | easy to use, clear, simple |
| democratize | open up, make accessible, share widely |
| accelerate | speed up, increase, push forward |
| state-of-the-art | latest, advanced, best available |
| dynamic | active, changing, energetic |
| immersive | engaging, deep, hands-on |
| supercharge | boost, power up, significantly improve |
| enduring | lasting, long-term, permanent |
| captivate | interest, engage, draw in, hold attention |
| navigate | handle, manage, work through, deal with |
| spearhead | lead, drive, start, head up |
| bespoke | custom, tailored, made for |
| cognizant | aware, knowing, conscious of |
| encompass | include, cover, contain, span |
| hitherto | until now, previously, before this |
| catalyst | trigger, cause, driver, spark |
| comprehensive | complete, full, thorough, detailed |
| arsenal | set, range, collection, toolkit |
| craft / crafting | write, build, create, make, develop |
| convey | share, communicate, say, express |
| cornerstone | foundation, base, core, key part |
| employ | use, apply, rely on |
| engage | work with, involve, connect with |
| formidable | strong, serious, impressive, real |
| hone | sharpen, improve, develop, refine |
| hub | center, base, core, home |
| tailored | custom, specific, designed for, made for |
| blueprint | plan, model, guide, framework |
| deploy | use, launch, apply, roll out |
| cadence | pace, rhythm, pattern, timing |
| capture | record, take, get, show, reflect |
| compelling | strong, clear, convincing, interesting |
| align with | match, fit, work with, agree with |
| valuable | useful, worth having, helpful |
| interplay | mix, connection, relationship |
| key (as filler adjective) | main, important [only if it adds meaning: otherwise cut] |
| landscape (abstract, e.g. "content landscape") | field, industry, space [or name it specifically] |
| actually (as filler) | [delete unless contrasting a real assumption] |
| focal point | center, main subject, main point |
| indelible mark | lasting effect, permanent change [or state the specific effect] |
| deeply rooted | long-standing, established, traditional |

---

### Corporate buzzwords

| Banned Phrase | Natural Alternative |
|---|---|
| continuous improvement | always improving, getting better over time |
| solution development | building fixes, creating answers |
| strategic alignment | working toward the same goal |
| operational excellence | running things well |
| streamline operations | simplify how things work |
| drive synergies | work better together |
| best-in-class | top quality, the best option available |
| scalable infrastructure | systems that can grow |
| facilitate | help, support, make possible |
| utilisation / utilize | use |
| endeavour | effort, try, work |
| implementation | setup, rollout, process |
| methodology | method, approach, process, system |
| leverage (verb) | use, draw on, rely on |
| best practices | what works, proven methods [only with specific detail] |

---

### Marketing clichés

| Banned Phrase | Natural Alternative |
|---|---|
| unlock the power of | use, make the most of |
| take your X to the next level | improve your X, strengthen your X |
| unparalleled excellence | outstanding quality, great results |
| revolutionize the way | completely change how, reshape the way |
| game-changing solution | effective fix, useful approach |
| unleash your potential | do your best work, show what you can do |
| moving the needle | making progress, showing results |
| actionable insights (as filler) | specific steps, things you can actually do |
| in the digital landscape | online, in this space, in this industry |
| in today's fast-paced world | [delete entirely] |
| circle back | follow up, return to, revisit |
| deep dive | close look, detailed review |
| level up | improve, get better, progress |
| at the end of the day | ultimately, in the end, what matters is |
| foster growth | help grow, support development |
| elevate your brand | strengthen your brand, improve how your brand is seen |
| game plan | plan, strategy, approach |
| drive impact | create results, make a difference |

---

### Inflated verb phrases

These are Wikipedia's copula-avoidance sign (`ai-patterns-deep.md` §3), so they count as evidence in clusters.

| Inflated Form | Plain Verb |
|---|---|
| serves as | is |
| stands as | is |
| marks a | is |
| represents a | is |
| boasts a | has |
| features a | has, includes |
| offers a | gives, provides |
| plays a role in | affects, influences, contributes to |
| helps to | helps, makes it easier to |
| aims to | aims to → [rewrite: say what it does, not what it tries to do] |
| seeks to | tries to, intends to |
| is designed to | [rewrite: say what it does] |
| is intended to | [rewrite: say what it does] |

---

### Weak hedging qualifiers

Style, not evidence: Wikipedia lists hedges ("perhaps," "tends to") among signs of *human* writing, and GPT-family models hedge more than others (Source 5). Cut stacked hedges ("may potentially"); keep a hedge the facts require.

| Banned Phrase | Natural Alternative |
|---|---|
| It is important to note that | [state the fact directly] |
| It should be mentioned that | [state the fact directly] |
| It is worth noting that | [state the fact directly] |
| One might argue that | Some argue that, Some believe |
| It could be suggested that | Some suggest, Research suggests |
| may potentially | may, might [not both] |
| could possibly | could, might [not both] |
| might be considered | is, can be seen as |
| appears to indicate | suggests, shows, indicates |
| it goes without saying | [delete: if it goes without saying, don't say it] |

---

### Dead sentence openers

No alternative. Restructure the sentence. "In order to" is here for concision only: Wikipedia lists it as more common in human writing, so it is not evidence.

- In today's... / In today's fast-paced world...
- In the digital age... / In the modern era...
- It is important to note that...
- It is worth noting...
- In order to...
- Let's dive in / Let's explore / Let's unpack
- Moving forward...
- What makes this particularly interesting is...
- In this article, I will cover...
- Despite its strengths, X faces challenges...
- If you are reading this, chances are...
- So without further ado...

---

### Dead transition words

Transition words in isolation are an ineffective indicator (`caveats-and-human-signals.md`); "Additionally" opening a sentence and Gemini's "furthermore" are the measured exceptions (Part A). Swap them for flow, not as proof.

| Banned | Natural Alternative |
|---|---|
| Furthermore | Also, And, [none: start a new sentence] |
| Additionally | Also, And, Plus |
| Moreover | Also, Beyond that, On top of this |
| With that in mind | [make the connection explicit or delete] |
| It is also worth mentioning | [state the point directly] |
| On top of that | Also, And, Beyond that |
| In conclusion (outside a conclusion) | [delete: just make the concluding statement] |
| Consequently | So, Which means, As a result |

*"With that being said" is an allowed, intentional pivot, not filler.*

---

### Delete without replacement

These have no natural alternative. Remove completely. Do not substitute.

**Fake engagement:**
Let that sink in, Read that again, Full stop, Nobody is talking about this,
Most people don't realize, Are you paying attention, You are not ready for this

**Fake casual expressions:**
"And honestly?", "Here's the thing.", "You know what's wild?",
"That changes everything.", "And that was the moment."

**Storytelling clichés:**
"Everything changed when...", "Little did they know...",
"And then it hit me...", "The stars aligned", "time stood still"

For storytelling clichés, replace with the specific event described directly:
Instead of "And then it hit me..." → describe what actually happened in concrete detail.
