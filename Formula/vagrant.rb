# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Vagrant < Formula
  desc "Development environment"
  homepage "https://www.vagrantup.com/"
  version "2.4.8"

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vagrant/2.4.8/vagrant_2.4.8_linux_amd64.zip"
    sha256 "95d7e0c1b47bb7f9cfab9fe23d5a0f877f79aa6e5ef9ffe4b960fb8fd5db44f4"
  end

  conflicts_with "vagrant"

  def install
    bin.install "vagrant"
  end

  test do
    system "#{bin}/vagrant --version"
  end
end
