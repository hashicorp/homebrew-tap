# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-vagrant" do
  version "2.4.5"
  arch arm: "arm64", intel: "amd64"
  sha256 arm: "abe3a21b54ade42c16d50562f34a821c071bed568104c799ef9ca2e013fb9f9d",
         intel: "abe3a21b54ade42c16d50562f34a821c071bed568104c799ef9ca2e013fb9f9d"
  url "https://releases.hashicorp.com/vagrant/#{version}/vagrant_#{version}_darwin_#{arch}.dmg",
      verified: "hashicorp.com/vagrant/"
  name "Vagrant"
  desc "Development environment"
  homepage "https://www.vagrantup.com/"

  livecheck do
    url "https://github.com/hashicorp/vagrant"
    strategy :git
  end

  pkg "vagrant.pkg"

  uninstall script: {
    executable: "uninstall.tool",
    input: ["Yes"],
    sudo:  true,
  },
  pkgutil: "com.vagrant.vagrant"

  zap trash: "~/.vagrant.d"

end
