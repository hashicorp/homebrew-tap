# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vagrant < Formula
  desc "Development environment"
  homepage "https://www.vagrantup.com/"
  version "2.4.4"

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vagrant/2.4.4/vagrant_2.4.4_linux_amd64.zip"
    sha256 "df23965eb470a98be9ca6a5aa1414743ba3bf39451c4d2e4eb9b506c74e376ba"
  end

  conflicts_with "vagrant"

  def install
    bin.install "vagrant"
  end

  test do
    system "#{bin}/vagrant --version"
  end
end
