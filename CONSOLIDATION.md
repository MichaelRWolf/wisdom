# Quotes Consolidation — What Was Done

## Context

Decades of accumulated quotes existed across ~14 locations in plain text,
Dropbox, org-mode, org-roam, Obsidian, and iCloud. At some point the old
plain-text content was pasted into an org-mode file (creating duplicates),
then de-duped. The goal was to identify the canonical "sum of all parts",
land it in a single git-tracked repo, and retire all the scattered copies.

Completed: 2026-03-26

---

## What Was Found

| Lines |  Size | Modified   | File                                                                                                         |
|------:|------:|------------|--------------------------------------------------------------------------------------------------------------|
| 6,407 | 195KB | 2025-02-14 | `repos/writing/quotes_2025-02-14_tagged.org` — auto-tagged, largest but tags were machine-generated          |
| 6,366 | 198KB | 2025-10-30 | `repos/pk/org-roam-logseq-nodes-MichaelRWolf/pages/20230711112147-quotes.org` ← **chosen as primary source** |
| 6,366 | 194KB | 2025-10-30 | `org-roam-logseq-from-iCloud-Drive-Archive/pages/20230711112147-quotes.org` — same content, iCloud copy      |
| 6,345 | 197KB | 2024-09-12 | `~/quotes_archived_2024_09_12.txt` — read-only snapshot                                                      |
| 6,320 | 196KB | 2024-08-04 | `~/quotes_archived_2024_08_04.txt` — read-only snapshot                                                      |
| 6,149 | 191KB | 2023-04-28 | `~/quotes_archived_2023-04-28.txt` — read-only snapshot                                                      |
| 4,173 | 107KB | 2025-02-14 | `~/Downloads/quotes_autotagged.org` — intermediate tagging artifact                                          |
| 3,544 | 101KB | 2025-02-14 | `~/Downloads/quotes_tagged.org` — partial tagging run                                                        |
| 3,541 | 112KB | 2025-05-21 | `obsidian-vault/pages/20230711112147-quotes.org` — truncated/stale Obsidian copy                             |
| 3,506 | 108KB | 2025-02-14 | `repos/writing/quotes_2025-02-14.org` — working subset from tagging experiment                               |
| 2,706 |  81KB | 2020-01-12 | `Library/CloudStorage/Dropbox/quotes.txt (Symlink Backup Copy)` — Dropbox-era snapshot                       |
| 1,608 |  46KB | 2014-11-10 | `miscellaneous_bits_and_gribbles/misc/quotes.txt` — **oldest plain-text collection**                         |

### Pre-existing symlink chain (now retired)

```text
~/quotes.org ──→ ~/20230711112147-quotes.org ──→ ~/org-roam-logseq-from-iCloud-Drive-Archive/pages/20230711112147-quotes.org
~/quotes.txt ──→ ~/20230711112147-quotes.org ──→ same target
```

---

## What Was Decided

- **Format:** plain `.txt` with `================================================================` separators.
  No Markdown, no org-mode. The original format from the pre-org era.
- **Location:** `~/repos/wisdom/quotes.txt` in its own public repo (`wisdom`),
  separate from other repos so future auto-commit hooks won't pollute their logs.
- **Symlink:** `~/quotes.txt` → `~/repos/wisdom/quotes.txt` (single hop).

---

## Steps Performed

### 1. Created repo and raw copy (commit `2891efb`)

- `git init ~/repos/wisdom`
- Copied `repos/pk/org-roam-logseq-nodes-MichaelRWolf/pages/20230711112147-quotes.org`
  verbatim as `quotes.txt` (6,366 lines)
- Prepended PROVENANCE section
- Added MIT LICENSE and README.md

### 2. Stripped org-mode boilerplate (commit `6df4b84`)

Removed from the top of `quotes.txt`:

- `:PROPERTIES:` / `:ID:` / `:END:` block
- `#+title: Quotes` line
- `* Adding to quotes file...` section (file-history notes, ~30 lines)
- `* Quotes` section heading

Converted throughout:

- `* heading text` → `heading text` (stripped '* ' prefix, kept content)

Result: 6,373 → 6,343 lines.

### 3. Created GitHub repo and updated symlink (commit `6df4b84` pushed)

```bash
gh repo create wisdom --public
rm ~/quotes.org ~/quotes.txt ~/20230711112147-quotes.org   # removed symlinks only
ln -s ~/repos/wisdom/quotes.txt ~/quotes.txt
```

### 4. Merged unique pre-org-mode content (commit `feff41b`)

Diffed `miscellaneous_bits_and_gribbles/misc/quotes.txt` (1,608 lines, created 2014)
and `Dropbox/quotes.txt` (2,706 lines, 2020) against canonical using normalized
block comparison (both full `================================================================` and short `================` separators).

Found **9 unique quotes** not already in the org-roam master:

1. "In theory, there is no difference between theory and practice..." — Jan L.A. van de Snepscheut
2. "Who has time for a thousand words?" — Bootsy Haller
3. "a mind is a terrible thing to waste..." — ee cummings
4. "Syntax is complex, but the complexity is there for a reason..." — Steven Pinker
5. "Tell me, and I will forget; Show me, and I may remember..." — Association for Experiential Education
6. "When someone says 'I want a programming language...'" — Alan Perlis
7. "It is the profoundly erroneous truism..." — Alfred North Whitehead
8. "The great thing about multitasking is that several things can go wrong at once." — unknown
9. "Talking abut Music is like dancing about Architecture." — Elvis Costello

Also appended a reference block of quote-source URLs with live/dead status checked
on 2026-03-26 (commit `eb017a4`).

### 5. Added obsolescence warnings to all superseded files

Prepended a `WARNING: OBSOLETE FILE — DO NOT EDIT` block (with GitHub URL) to
all 14 related files across Groups A (read-only), B (git-tracked), and C (loose).
Group B repos committed. Read-only permissions on archives preserved.

### 6. Cleanup

- Removed `repos/writing/start_quotes_app` (script with stale file paths)
- Removed `repos/writing/temp/quotes.json` (intermediate JSON artifact)
- Removed `Dropbox/quotes.txt (Symlink Backup Copy) copy` (duplicate)
- Moved this document from `Second_Brain/PLAN_quotes_merge.md` to `wisdom/CONSOLIDATION.md`

---

## Final State

```text
~/repos/wisdom/
  quotes.txt      — 6,415 lines, canonical, plain text
  LICENSE         — MIT 2026
  README.md       — describes repo, provenance, relationship tree
  CONSOLIDATION.md — this file

~/quotes.txt  →  ~/repos/wisdom/quotes.txt   (single-hop symlink)

GitHub: https://github.com/MichaelRWolf/wisdom
```

### Files with obsolescence warnings (do not edit)

- `~/quotes_archived_2023-04-28.txt` (read-only)
- `~/quotes_archived_2024_08_04.txt` (read-only)
- `~/quotes_archived_2024_09_12.txt` (read-only)
- `~/repos/pk/org-roam-logseq-nodes-MichaelRWolf/pages/20230711112147-quotes.org`
- `~/repos/pk/org-roam-logseq-nodes-MichaelRWolf-working-backup/pages/20230711112147-quotes.org`
- `~/repos/writing/quotes_2025-02-14.org`
- `~/repos/writing/quotes_2025-02-14_tagged.org`
- `~/repos/writing/test/quotes_tagged_by_concept.org`
- `~/Downloads/quotes_tagged.org`
- `~/Downloads/quotes_autotagged.org`
- `~/obsidian-vault/pages/20230711112147-quotes.org`
- `~/org-roam-logseq-from-iCloud-Drive-Archive/pages/20230711112147-quotes.org`
- `~/Library/CloudStorage/Dropbox/quotes.txt (Symlink Backup Copy)`
- `~/miscellaneous_bits_and_gribbles/misc/quotes.txt`
