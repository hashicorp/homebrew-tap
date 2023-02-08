# HashiCorp Homebrew Tap

## What is Homebrew?

Package manager for macOS (or Linux), see more at https://brew.sh

## What is a Tap?

A third-party (in relation to Homebrew) repository providing installable
packages (formulae) on macOS and Linux.

See more at https://docs.brew.sh/Taps

## How do I install packages from here?

```sh
brew install hashicorp/tap/name
```

You can also only add the tap which makes formulae within it
available in search results (`brew search` output):

```sh
brew tap hashicorp/tap
```

Note: to clone the tap via SSH you will need to use:

```sh
brew tap hashicorp/tap https://github.com/hashicorp/homebrew-tap
```

While you may search across taps, it is necessary to always use
fully qualified name (incl. the `hashicorp/tap/` prefix)
when refering to formulae in external taps such as this one
outside of search.

## What packages are available?

With the following commands, you can install the latest generally available (GA) version of each product:
```sh
# Formulae
brew install hashicorp/tap/boundary
brew install hashicorp/tap/consul
brew install hashicorp/tap/consul-dataplane
brew install hashicorp/tap/consul-enterprise
brew install hashicorp/tap/consul-template
brew install hashicorp/tap/consul-terraform-sync
brew install hashicorp/tap/hc-install
brew install hashicorp/tap/hcdiag
brew install hashicorp/tap/levant
brew install hashicorp/tap/nomad
brew install hashicorp/tap/nomad-enterprise
brew install hashicorp/tap/nomad-pack
brew install hashicorp/tap/packer
brew install hashicorp/tap/sentinel
brew install hashicorp/tap/terraform
brew install hashicorp/tap/terraform-ls
brew install hashicorp/tap/vault
brew install hashicorp/tap/vault-enterprise
brew install hashicorp/tap/waypoint

# Casks
brew install hashicorp/tap/hashicorp-boundary-desktop
brew install hashicorp/tap/hashicorp-vagrant
```

Prereleases (including as alpha's, beta's, and release candidates) will not be available in this tap.

## Why should I install packages from this tap?

Formulae for the same HashiCorp software may exist in other taps
or the [community-maintained main tap](https://github.com/Homebrew/homebrew-core).
This may raise a question of why would someone prefer one tap over the other.

The _community-maintained tap_ compiles HashiCorp software on Homebrew's own infrastructure, and builds it according to the local formulae definition.

Formulae _in this tap_ are maintained by HashiCorp, which means that it distributes
the exact (byte-to-byte) same binaries which are published to https://releases.hashicorp.com

 - macOS binaries are signed by HashiCorp and the signature can be verified
	per instructions on the [HashiCorp's Security](https://www.hashicorp.com/security#code-signature-verification) page
 - Teams maintaining HashiCorp software choose Go version and any build flags _deliberately_ while
 	factoring in support, security and other concerns. Binaries distributed through this tap reflect this.
 - Updating of formulae is automated, which means that updates become available as they're released.

### Why doesn't HashiCorp maintain formulae in the `homebrew-core` (main tap)?

Homebrew's core team prefers to keep `homebrew-core` as community maintained and built from source to maintain consistency across vendors in terms of expectations around contents and updates. See [relevant discussion](https://discourse.brew.sh/t/maintenance-of-formulas-by-vendor/7649) for more information.

## Contributing

Check out our [contribution guidelines for this project](./CONTRIBUTING.md)
