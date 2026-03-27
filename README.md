# wisdom

A personal collection of accumulated wisdom, built up over decades.

## Contents

- **[quotes.txt](quotes.txt)** — The main collection. Plain text, one quote per
  block, separated by `================================================================` lines.
  A `PROVENANCE` section at the top logs the history of the file.
- **[CONSOLIDATION.md](CONSOLIDATION.md)** — Full account of how quotes.txt was assembled:
  what files were found, what was decided, what was done, and what was retired.

## Format

```text
================================================================

Quote text here.
  -- Author

================================================================
```

## quotes.txt — Provenance

### Source files used to build quotes.txt

| File                                                                            | Lines | Date               | Role                                                                   |
|---------------------------------------------------------------------------------|------:|--------------------|------------------------------------------------------------------------|
| `~/repos/pk/org-roam-logseq-nodes-MichaelRWolf/pages/20230711112147-quotes.org` | 6,366 | 2025-10-30         | **Primary source** — the hand-maintained org-roam master               |
| `~/miscellaneous_bits_and_gribbles/misc/quotes.txt`                             | 1,608 | created 2014-11-10 | Oldest plain-text collection; contributed 9 unique pre-org-mode quotes |
| `~/Library/CloudStorage/Dropbox/quotes.txt (Symlink Backup Copy)`               | 2,706 | 2020-01-12         | Dropbox-synced snapshot; no unique content beyond the above            |

### Obsolete derivatives (do not edit)

These files were created from the primary source at various points and are now
superseded. Each has a warning prepended.

| File                                                                          | Lines | Notes                                                          |
|-------------------------------------------------------------------------------|------:|----------------------------------------------------------------|
| `~/quotes_archived_2023-04-28.txt`                                            | 6,149 | Read-only snapshot                                             |
| `~/quotes_archived_2024_08_04.txt`                                            | 6,320 | Read-only snapshot                                             |
| `~/quotes_archived_2024_09_12.txt`                                            | 6,345 | Read-only snapshot                                             |
| `~/repos/writing/quotes_2025-02-14.org`                                       | 3,506 | Working subset from tagging experiment                         |
| `~/repos/writing/quotes_2025-02-14_tagged.org`                                | 6,407 | Auto-tagged version (largest, but tags were machine-generated) |
| `~/repos/writing/test/quotes_tagged_by_concept.org`                           | 3,596 | Intermediate tagging output                                    |
| `~/Downloads/quotes_tagged.org`                                               | 3,544 | Partial tagging run                                            |
| `~/Downloads/quotes_autotagged.org`                                           | 4,173 | Intermediate tagging output                                    |
| `~/obsidian-vault/pages/20230711112147-quotes.org`                            | 3,541 | Obsidian copy — truncated/stale                                |
| `~/org-roam-logseq-from-iCloud-Drive-Archive/pages/20230711112147-quotes.org` | 6,366 | iCloud archive — same as primary source                        |
| `~/miscellaneous_bits_and_gribbles/misc/quotes.txt`                           | 1,608 | Oldest source — content merged in                              |

### Irrelevant files (different content entirely)

Files whose names matched `*quotes*` but contain unrelated content:

| File                                                 | Content                                          |
|------------------------------------------------------|--------------------------------------------------|
| `~/repos/Job_Search/.../Tableau_Software/quotes.txt` | Company-specific interview quotes, 2008          |
| `~/repos/Training/doc/color_quotes.txt`              | Resistor color code mnemonic — not a quotes file |
| `~/repos/CoreNLP/src/.../ExtractQuotesUtil.java`     | Stanford NLP Java source                         |
| `~/repos/simple-agent/tests/.../*.approved.txt`      | ApprovalTests fixture files                      |
| `~/repos/marktext/test/.../Blockquotes.md`           | Markdown test data                               |
| `*.org~`                                             | Emacs auto-backup files                          |

### File relationship tree

```text
Plain-text era (~2008–2014)
│
├── misc/quotes.txt  (1,608 lines, created 2014)
│     └── grew via Dropbox sync ──→  Dropbox/quotes.txt  (2,706 lines, 2020)
│                                          │
│                    [pasted into org-mode, ~2023; duplicates then de-duped]
│                                          │
▼                                          ▼
Org-roam era (July 2023 – Oct 2025)
│
└── 20230711112147-quotes.org  (6,366 lines, Oct 2025)  ← PRIMARY SOURCE
      │
      ├── Read-only snapshots
      │     ├── quotes_archived_2023-04-28.txt  (6,149)
      │     ├── quotes_archived_2024_08_04.txt  (6,320)
      │     └── quotes_archived_2024_09_12.txt  (6,345)
      │
      ├── Tagging experiment (Feb 2025)
      │     ├── quotes_2025-02-14.org            (3,506 — working subset)
      │     ├── quotes_2025-02-14_tagged.org     (6,407 — auto-tagged)
      │     ├── Downloads/quotes_tagged.org      (3,544 — partial run)
      │     └── Downloads/quotes_autotagged.org  (4,173 — intermediate)
      │
      └── Sync copies
            ├── obsidian-vault/.../20230711112147-quotes.org  (3,541 — stale/truncated)
            └── org-roam-logseq-from-iCloud-Drive-Archive/...  (6,366 — same as primary)
                        │
                        [merge: primary + 9 unique quotes from misc/quotes.txt]
                        │
                        ▼
                wisdom/quotes.txt  (6,415 lines)  ◄── YOU ARE HERE
                ~/quotes.txt  (symlink)
                https://github.com/MichaelRWolf/wisdom/blob/main/quotes.txt
```

## Future

Other files may be added over time (e.g., `books.txt`, `sites.txt`).

## License

MIT
