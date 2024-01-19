# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vagrant < Formula
  desc "Development environment"
  homepage "https://www.vagrantup.com/"
  url "https://releases.hashicorp.com/vagrant/2.4.0/vagrant_2.4.0_linux_amd64.zip"
  version "2.4.0"
  sha256 "a638c22f9dd35481a4486bdb0eca614ad695036aa444cc3aace4513d3de0cbbe"

  depends_on arch: :x86_64
  depends_on :linux

  conflicts_with "vagrant"

  def install
    bin.install "vagrant"
  end

  test do
    system "#{bin}/vagrant", "--version"
  end
end
