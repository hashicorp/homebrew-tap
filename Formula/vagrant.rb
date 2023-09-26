# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vagrant < Formula
  desc "Development environment"
  homepage "https://www.vagrantup.com/"
  url "https://releases.hashicorp.com/vagrant/2.4.1/vagrant_2.4.1_linux_amd64.zip"
  version "2.4.1"
  sha256 "73a3dacf3f36fb4af8ef514aeff245833d086430614f0c183be7e263553dd7c2"

  depends_on arch: :x86_64
  depends_on :linux

  conflicts_with cask: [
    "hashicorp-vagrant",
    "vagrant",
  ]

  def install
    bin.install "vagrant"
  end

  test do
    system "#{bin}/vagrant", "--version"
  end
end
