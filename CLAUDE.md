# Project Instructions

This repository represents one independent electronics learning project of the **MawjaLab** brand.

## Brand context (MawjaLab)

- This project belongs to the MawjaLab brand (موجة لاب) — Arabic-language electronics and embedded education.
- On the maintainer's machine, this repository is checked out inside the `mawjalab/` brand workspace. That ancestor folder contains the binding brand definition: `CLAUDE.md` (brand rules), `brand/` (`BRAND-CORE.md`, `visual-identity.md`, `content-rules.md`, master assets) and `.claude/skills/` (brand skills).
- Claude Code loads the brand rules automatically through parent-directory inheritance. All brand-relevant work — naming, colors, typography, logos, titles, wording, thumbnails, PCB silkscreen — must be based on those predefined brand files, not on improvisation.
- **Read-only** access to the brand folder is explicitly allowed. Brand assets this project needs (e.g. silkscreen logo, thumbnail template) must be **copied into this repository** — never referenced through paths outside the repository. The init script copies them into `media/brand/` automatically; the remaining manual steps are tracked in the Brand Setup checklist in `PROJECT.md`.
- This repository will be public: absolute local paths must not appear in any committed file. If the brand workspace is unavailable (e.g. a public clone), the brand files already copied into this repository are authoritative.

## Repository boundary

- Work only inside this repository.
- Sole exception: read-only access to the ancestor MawjaLab brand folder (`CLAUDE.md`, `brand/`, `.claude/skills/`), see Brand context.
- Do not read or modify sibling repositories.
- Do not introduce relative dependencies on sibling directories.
- Do not use files outside the repository as hidden runtime dependencies.

## Engineering objective

Document and implement the complete development process from project idea to validated hardware or software.

## Engineering rules

- Requirements must be traceable.
- Technical decisions require documented justification.
- Datasheet-derived values must identify the source document and section.
- Clearly distinguish assumptions, calculations, simulations and measurements.
- Do not claim physical validation without measurement evidence.
- Do not fabricate test results.
- Preserve editable CAD source files.
- Generated manufacturing files must not replace source files.

## Documentation rules

- Explain decisions, not only outcomes.
- Preserve the educational sequence.
- Use diagrams where they improve understanding.
- State risks and unresolved questions explicitly.

## Before modifying files

1. Read `project.yaml`.
2. Read `PROJECT.md`.
3. Inspect the relevant documentation.
4. Identify the current project phase.
5. State assumptions.

## After modifying files

1. List modified files.
2. List checks performed.
3. Report unresolved risks.
4. Update project status where appropriate.
