# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

release_repository = +ENV["HOMEBREW_HASHICORP_ARTIFACT_REPOSITORY_HOST"] || "https://releases.hashicorp.com"

cask "hashicorp-vagrant" do
  version "2.4.0"
  arch arm: "arm64", intel: "amd64"
  sha256 arm: "97806047dfc7e0c3818f946a1c954ab03d8f6d1ae45d1aa43e5bdbd7a8856631",
         intel: "97806047dfc7e0c3818f946a1c954ab03d8f6d1ae45d1aa43e5bdbd7a8856631"
  url release_repository << "/vagrant/#{version}/vagrant_#{version}_darwin_#{arch}.dmg",
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
