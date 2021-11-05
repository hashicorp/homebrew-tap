## 🎉 Contributing 🎉

We welcome contributions! Thanks for taking the time. Before getting started, ensure you have golang installed and have your go environment variables set up properly. If you're new to go, we recommend following the [goenv installation guide](https://github.com/syndbg/goenv/blob/master/INSTALL.md) and installing the latest stable version. 

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
