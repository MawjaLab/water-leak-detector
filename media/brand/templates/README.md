# MawjaLab Templates

SVG-Quellen zu `docs/visual-identity.md` §11 (#8–#11). Workflow pro Video: SVG kopieren, Texte/Foto tauschen, rendern — nichts anderes anfassen („Build once").

## Bearbeiten

1. **Foto einsetzen:** `rect#foto-platzhalter` ersetzen durch
   `<image href="foto.jpg" width="…" height="…" preserveAspectRatio="xMidYMid slice"/>` (Maße wie das rect). Hinweistext-Zeile löschen.
2. **Titel/Chip:** nur die `<text>`-Inhalte ändern. Regeln: max. 4 Wörter, keine Episodennummern, ein Chip = ein Suchbegriff (§5).
3. **short-hook.svg:** vor dem Export die Gruppe `g#ui-guides` löschen (zeigt nur die Plattform-UI-Zonen).
4. Kapitelkarten sind final — nicht editieren, direkt die PNGs aus `../export/` verwenden.

## Rendern (Chrome headless, nutzt die installierten Plex-Fonts)

```bash
cd docs/brand/templates
# Thumbnail (1280x720):
google-chrome --headless=new --disable-gpu --hide-scrollbars \
  --window-size=1280,720 --screenshot=out.png "file://$PWD/thumbnail-flagship.svg"
# Short (1080x1920): --window-size=1080,1920
# Kapitelkarte (1920x1080): --window-size=1920,1080
# Lower Third (transparent): zusätzlich --default-background-color=00000000
```

Fertige Renderings liegen in `../export/`.
