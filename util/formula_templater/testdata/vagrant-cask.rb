# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-vagrant" do
  version "2.3.6"
  arch arm: "arm64", intel: "amd64"
  sha256 arm: "4daf4d4c323cce7bf98065ecf5338e9800038a522cd81356c77555d9cd2f0db9",
         intel: "4daf4d4c323cce7bf98065ecf5338e9800038a522cd81356c77555d9cd2f0db9"
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
