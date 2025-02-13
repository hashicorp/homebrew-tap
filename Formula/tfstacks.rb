# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Tfstacks < Formula
  desc "Terraform Stacks CLI"
  homepage "https://www.terraform.io/"
  version "0.6.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/0.6.1/tfstacks_0.6.1_darwin_amd64.zip"
    sha256 "7360a67111ffe9b00a6723207368abf0e0e02364cd50f0dd6da9314abce5437a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfstacks/0.6.1/tfstacks_0.6.1_darwin_arm64.zip"
    sha256 "2cadc7be71edd15c5cb5183b202dd7b6a4ac5f2c15c36a8429e4e7c864028f7e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/0.6.1/tfstacks_0.6.1_linux_amd64.zip"
    sha256 "b57be141b3db3efa8170dc5bfb0f631b27cd22f2bca469d67858792c9c5e16f5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/0.6.1/tfstacks_0.6.1_linux_arm.zip"
    sha256 "49b0ac96f2986d77c2be3121f6afc268b6d12e3c0f9aa0c1b35da4d5a555c8d6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/0.6.1/tfstacks_0.6.1_linux_arm64.zip"
    sha256 "b2165e12be6665fa980ad25f461b17f4c254eeaaf77f61b9cca00200a062908a"
  end

  conflicts_with "tfstacks"

  def install
    bin.install "tfstacks"
  end

  test do
    system "#{bin}/tfstacks --version"
  end
end
