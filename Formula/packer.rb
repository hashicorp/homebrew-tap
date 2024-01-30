# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.10.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.10.1/packer_1.10.1_darwin_amd64.zip"
    sha256 "84738b75dee704d8e366bd21869322ec2e37634620049998d2d508f59f64b912"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.10.1/packer_1.10.1_darwin_arm64.zip"
    sha256 "7bbd3d9326dae3a2306665c45ffa8f9b51704bbbee1a675d9523a6abc736374e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.10.1/packer_1.10.1_linux_amd64.zip"
    sha256 "e6cfde9514758a7f8684006b3c7f527411d1018a2162ab1376f8aa067546949d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.10.1/packer_1.10.1_linux_arm.zip"
    sha256 "5026a7d8ae595ba291e3a6679e095669fcd918a61a068a04e7c8ab969114b848"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.10.1/packer_1.10.1_linux_arm64.zip"
    sha256 "a6bf810360a972a7f8f33ad04873ab36ed80df2f6d31e272be820a6b5af268a5"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
