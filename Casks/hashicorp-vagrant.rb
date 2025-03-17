# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-vagrant" do
  version "2.4.3"
  arch arm: "arm64", intel: "amd64"
  sha256 arm: "3cfe992d505271620da797cd1c43648dc9cf546c3d90f7c4d45f04741d29803f",
         intel: "3cfe992d505271620da797cd1c43648dc9cf546c3d90f7c4d45f04741d29803f"
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
