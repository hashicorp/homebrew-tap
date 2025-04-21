# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-vagrant" do
  version "2.4.4"
  arch arm: "arm64", intel: "amd64"
  sha256 arm: "955b1011273721928dbf3316194bf402e1f2a817a7ba98e6e1863d4413e54a44",
         intel: "955b1011273721928dbf3316194bf402e1f2a817a7ba98e6e1863d4413e54a44"
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
