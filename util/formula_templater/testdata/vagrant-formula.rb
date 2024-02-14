# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vagrant < Formula
  desc "Development environment"
  homepage "https://www.vagrantup.com/"
  version "2.3.6"

  if OS.linux? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/vagrant/2.3.6/vagrant_2.3.6_linux_amd64.zip"
    sha256 "71a616220e0f68d4882573afed4263a362eaafd14833a4f7e7c26f0cc0490157"
  end

  conflicts_with "vagrant"

  def install
    bin.install "vagrant"
  end

  test do
    system "#{bin}/vagrant --version"
  end
end
