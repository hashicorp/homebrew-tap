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

With the following commands, you can install the latest version of each product:
```sh
# Formulae
brew install hashicorp/tap/boundary
brew install hashicorp/tap/consul
brew install hashicorp/tap/consul-template
brew install hashicorp/tap/consul-terraform-sync
brew install hashicorp/tap/nomad
brew install hashicorp/tap/packer
brew install hashicorp/tap/sentinel
brew install hashicorp/tap/terraform
brew install hashicorp/tap/vault
brew install hashicorp/tap/waypoint

# Casks
brew install hashicorp/tap/hashicorp-boundary-desktop
```

*Note:* Vagrant is currently available as a cask from Homebrew core and not provided by this tap.
You can install it via

```sh
brew install vagrant
```

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

We welcome contributions! Before getting started, ensure you have golang installed and have your go environment variables set up properly. If you're new to go, we recommend following the [goenv installation guide](https://github.com/syndbg/goenv/blob/master/INSTALL.md) and installing the latest stable version. 

### Adding New Product Support

See a project available on releases.hashicorp.com that isn't available via the homebrew tap? You can add support for a new Formula or Cask by following the below steps:

- Clone this repo: `git clone git@github.com:hashicorp/homebrew-tap.git`

- Add the project to the [supported list](https://github.com/hashicorp/homebrew-tap/blob/master/util/lambda_trigger/lambda_trigger.go#L25) under `util/lambda_trigger/lambda_trigger.go`

- If the project should be delivered as a [Cask](https://github.com/Homebrew/homebrew-cask) (rather than a Formula), additionally add the project to the [supported list](https://github.com/hashicorp/homebrew-tap/blob/master/util/lambda_trigger/lambda_trigger.go#L54) under `util/lambda_trigger/lambda_trigger.go`

- Make your additions to `util/formula_templater/config.hcl`

For example, to add Formula support for a new project that's live on [releases.hashicorp.com](https://releases.hashicorp.com/), `awesomeproject`, you can add the following snippet to the config file:

```
formula {
    product = "awesomeproject"
    name = "AwesomeProject"
    desc = "Awesome Project"
    homepage = "https://github.com/hashicorp/awesomeproject"
    architectures {
        darwin_amd64 = true
        darwin_arm64 = true
        linux_amd64 = true
        linux_arm = true
        linux_arm64 = true
    }
}
```

To add Cask support (rather than Formula support), add the following key/value pairs to the `formula` block above:

```
    cask = true
    cask_app = "awesomeproject.app"
```

Note: Any project that is live on [releases.hashicorp.com](https://releases.hashicorp.com/) that has binaries available for any/all of the above architectures can be supported via Homebrew Formula's. Any `.app` or `.dmg` can be supported via Homebrew Casks. Ensure that the architecture list accurately matches what is available on the releases site for the specific project you want to support. If a `darwin_arm64` binary isn't available yet, for example, you can set the value for that key to `false`. 

- Build the formula templater: `cd util/formula_templater && go build`

- Use the templater to create the project specific Formula or Cask file, and pipe the output to the appropriate location: `./formula_templater awesomeproject 1.0.0 ./config.hcl > /path/to/homebrew-tap/Formula|Cask/awesomeproject.rb`

- Open a PR with your changes, and we'll review and merge. Post-merge, you can expect the new project to be available via the HashiCorp Homebrew Tap in just a minute or so
