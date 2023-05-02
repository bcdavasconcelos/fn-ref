# fn-ref

A temporary solution for cross-referencing footnotes in LaTeX and HTML with Pandoc and Quarto. The extension is based on the script provided by Shafayet Khan Shafee (@shafayetshafee) for the problem posed by Gustavo Gomes (@guslaet) at [StackOverflow](https://stackoverflow.com/questions/76030546/how-to-cross-reference-footnotes-and-page-numbers-in-quarto-pdf). On the same matter, see also [1](https://github.com/jgm/pandoc/issues/1603), [2](https://github.com/lierdakil/pandoc-crossref/issues/215).

This extension offers the ability to cross-reference footnotes using markdown syntax. The markdown syntax is simple: add the anchor to the footnotes using `[]{#fn-label}` and then cite using `@fn-label`.

## Installing

```bash
quarto add bcdavasconcelos/fn-ref
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Usage

Add the following to your `_quarto.yml` file:

```yaml
quarto:
  pandoc:
    extensions:
      - bcdavasconcelos/fn-ref
```

## Example

```markdown
---
filters:
  - fn-ref
---

This extension offers the ability to cross-reference footnotes[^1]. See footnote @fn-label1.

[^1]: []{#fn-label1} The footnote label should come at the begining.


```
