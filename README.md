# petems/homebrew-tap

Peter Souter's personal [Homebrew](https://brew.sh/) tap — a mix of casks
for macOS apps and legacy formulae from the HashiCorp ecosystem.

## Add the tap

    brew tap petems/tap

## Casks

| Cask | Description |
|---|---|
| [`cc-dailyuse-bar`](https://github.com/petems/cc-dailyuse-bar) | Menu bar app for monitoring Anthropic Claude Code usage |

Install with:

    brew install --cask petems/tap/cc-dailyuse-bar

## Formulae (legacy)

The [`Formula/`](./Formula) directory contains tooling from when this tap
focused on HashiCorp products (consul, nomad, packer, terraform,
terraform-ls, vault). These are unmaintained — kept for archival reasons —
and may not work with current Homebrew or upstream releases. PRs to update
or retire them are welcome.
