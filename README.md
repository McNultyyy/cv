## CV

The CV is written in [Typst](https://typst.app) — `cv.typ` is the single source of truth.

### Build locally

```
.\build.ps1
```

This wraps `typst compile`. Install Typst with `winget install Typst.Typst` (Windows), `brew install typst` (macOS), or `cargo install typst-cli`.

### Build Process (CI)

1. Push updates to `master`.
2. GitHub Actions ([build-cv.yml](.github/workflows/build-cv.yml)) compiles `cv.typ` into a PDF.
3. The PDF is attached to the [latest release](https://github.com/McNultyyy/cv/releases/latest) — direct link: [cv.pdf](https://github.com/McNultyyy/cv/releases/latest/download/cv.pdf).
