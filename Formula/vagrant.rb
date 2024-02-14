# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vagrant < Formula
  desc "Development environment"
  homepage "https://www.vagrantup.com/"
  version "2.4.1"

  if OS.linux? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/vagrant/2.4.1/vagrant_2.4.1_linux_amd64.zip"
    sha256 "73a3dacf3f36fb4af8ef514aeff245833d086430614f0c183be7e263553dd7c2"
  end

  conflicts_with "vagrant"

  def install
    bin.install "vagrant"
  end

  test do
    system "#{bin}/vagrant --version"
  end
end
