# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vagrant < Formula
  desc "Development environment"
  homepage "https://www.vagrantup.com/"
  version "2.4.7"

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vagrant/2.4.7/vagrant_2.4.7_linux_amd64.zip"
    sha256 "3ecafba03ff8185b516d45d75abde6a4e1d28379009baaf3614b83449bd9295f"
  end

  conflicts_with "vagrant"

  def install
    bin.install "vagrant"
  end

  test do
    system "#{bin}/vagrant --version"
  end
end
