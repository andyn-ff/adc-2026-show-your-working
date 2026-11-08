# Show your working

Slides and links for my ADC 2026 talk.

- **Slides:** https://andyn-ff.github.io/adc-2026-show-your-working/
- **PDF:** https://andyn-ff.github.io/adc-2026-show-your-working/slides.pdf

## Slides

Slides use [`marp`](https://marp.app). See `Justfile` for rendering the slides. Pushes to `main` rebuild and publish them to GitHub Pages.

### Gotcha: keep images local and resized

Put slide images in `assets/`, resized to about 1920 px on the long edge, and reference them as `assets/foo.jpeg`. Don't link to remote images.

When building the PDF, marp (via Chrome) embeds remote images **losslessly at full original resolution**, but embeds local JPEGs unchanged. With a handful of remote stock photos, the PDF grew to 111 MB. Using local 1920 px copies keeps it to a few MB.
