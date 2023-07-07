# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vagrant < Formula
  release_repository = +ENV["HOMEBREW_HASHICORP_ARTIFACT_REPOSITORY_HOST"] || "https://releases.hashicorp.com"

  desc "Development environment"
  homepage "https://www.vagrantup.com/"
  version "2.4.0"

  if OS.linux? && Hardware::CPU.intel?
    url release_repository << "/vagrant/2.4.0/vagrant_2.4.0_linux_amd64.zip"
    sha256 "a638c22f9dd35481a4486bdb0eca614ad695036aa444cc3aace4513d3de0cbbe"
  end

  conflicts_with "vagrant"

  def install
    bin.install "vagrant"
  end

  test do
    system "#{bin}/vagrant --version"
  end
end
