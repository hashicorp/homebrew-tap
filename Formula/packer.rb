# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.10.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.10.2/packer_1.10.2_darwin_amd64.zip"
    sha256 "fd5e20c951051e9533175a6958eb11233921f62141c749149ef12992073c7c77"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.10.2/packer_1.10.2_darwin_arm64.zip"
    sha256 "b23ebef504b48a6d99b975726eb593504bfe1858f63609418e4704c19ef4e538"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.10.2/packer_1.10.2_linux_amd64.zip"
    sha256 "6ed412d212e6948f956a92099d6f941ddb470ff30ab40432622f5e68d594ec46"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.10.2/packer_1.10.2_linux_arm.zip"
    sha256 "34d9504945531ca35647fea4b21ecd22846640d99d01d52bedfd1c32d92a8420"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.10.2/packer_1.10.2_linux_arm64.zip"
    sha256 "c87ac9845a6cbabeb397d46948a2d59111d87c6413fe837aafbaee9cf602e0a9"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
