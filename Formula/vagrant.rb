# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vagrant < Formula
  desc "Development environment"
  homepage "https://www.vagrantup.com/"
  version "2.3.7"

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vagrant/2.3.7/vagrant_2.3.7_linux_amd64.zip"
    sha256 "4f5f6c55f9cb3ede37cd4a928f023e7ec0a3328125e76ae1166dc7908f1f48cb"
  end

  conflicts_with "vagrant"

  def install
    bin.install "vagrant"
  end

  test do
    system "#{bin}/vagrant --version"
  end
end
