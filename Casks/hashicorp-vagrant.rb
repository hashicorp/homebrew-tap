# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

cask "hashicorp-vagrant" do
  version "2.4.9"
  arch arm: "arm64", intel: "amd64"
  sha256 arm: "8de08bd435ef8ae0fc5fbd6acefa9c68e62fb898c5ae0fbdacd26853bea9d4d6",
         intel: "8de08bd435ef8ae0fc5fbd6acefa9c68e62fb898c5ae0fbdacd26853bea9d4d6"
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
