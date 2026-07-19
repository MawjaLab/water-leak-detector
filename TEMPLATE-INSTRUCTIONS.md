# Using This Template

## Brand note (MawjaLab)

Create new projects inside the `mawjalab/` brand workspace. When `init-project.sh` runs there, it copies the required brand assets into `media/brand/` automatically; the remaining manual steps (KiCad title block, silkscreen, title rules) are tracked in the Brand Setup checklist in `PROJECT.md`. The `brand-new-project` skill wraps the same flow with additional brand defaults. The project `CLAUDE.md` documents how the brand files are accessed.

## After creating a new repository

Interactive initialization:

```bash
./tools/setup/init-project-interactive.sh
```

Or non-interactively:

```bash
./tools/setup/init-project.sh \
  --name "Project name" \
  --type hardware-software \
  --description "Project description" \
  --channel "YouTube channel"
```

## Allowed project types

- hardware
- software
- hardware-software

## Afterwards

```bash
git add .
git commit -m "Initialize project from template"
git push
```
