# To use this interactively: `brew install just` / `choco install just` / https://just.systems
set windows-shell := ["pwsh", "-NoLogo", "-Command"]

marp-version := "4.5.1"
marp := "npx --yes @marp-team/marp-cli@" + marp-version
slides := "Slides.md"
site-dir := "_site"

# Runs as default recipe
[private]
help:
  @just --list --unsorted

# Live-preview the slides in a browser, reloading on save
present:
  {{marp}} -s .

# Build the HTML deck, PDF and assets into _site/ (this is what CI publishes)
build: clean copy-assets
  {{marp}} "{{slides}}" -o "{{site-dir}}/index.html"
  {{marp}} "{{slides}}" -o "{{site-dir}}/slides.pdf" --allow-local-files

# Render any markdown file to a PDF
make-pdf markdown-file pdf-file:
  {{marp}} "{{markdown-file}}" -o "{{pdf-file}}" --allow-local-files

# Remove build output
[unix]
clean:
  rm -rf "{{site-dir}}"

# Remove build output
[windows]
clean:
  if (Test-Path "{{site-dir}}") { Remove-Item -Recurse -Force "{{site-dir}}" }

[private]
[unix]
copy-assets:
  mkdir -p "{{site-dir}}"
  cp -R assets "{{site-dir}}/assets"

[private]
[windows]
copy-assets:
  New-Item -ItemType Directory -Force "{{site-dir}}" | Out-Null
  Copy-Item -Recurse assets "{{site-dir}}/assets"
