# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.14.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.14.0/packer_1.14.0_darwin_amd64.zip"
    sha256 "a71345d4a15184aa5afc055c541c625b0e1e863f4a20c5908d22b7a3346fb8de"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.14.0/packer_1.14.0_darwin_arm64.zip"
    sha256 "48346ea23421e5b77638d8d33d616ebfac371e688a1b8113b75bbc37e3c1bcdb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.14.0/packer_1.14.0_linux_amd64.zip"
    sha256 "ce313ccd3f7f9606cb2eb02db49607960fbaa1ed76bf24b7c4a0850ce743d66a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.14.0/packer_1.14.0_linux_arm.zip"
    sha256 "84e811196b3c4ada2c6180722851a4f5b627d1bb40d3798e9a1914c50e1c4483"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.14.0/packer_1.14.0_linux_arm64.zip"
    sha256 "d2a9775c5ae399bdfe7d4b271d45861e18425fffd325043aa8b48f83a96d00cd"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
