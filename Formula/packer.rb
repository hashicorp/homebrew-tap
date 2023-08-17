# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.9.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.9.3/packer_1.9.3_darwin_amd64.zip"
    sha256 "5c50c94c8c5d21138f584d03e9399a342597b186ca11f3c6779fe0665dc9be31"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.9.3/packer_1.9.3_darwin_arm64.zip"
    sha256 "ba9fa96be6caabaa4157f9384f6e22f4f4a2cc871fd64e68e745c46c3c9846b2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.9.3/packer_1.9.3_linux_amd64.zip"
    sha256 "44d798b1defdfd2396a4106979d54848278876e3c190102c43c41b10e150b0c2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.9.3/packer_1.9.3_linux_arm.zip"
    sha256 "97bd871d07f4f159832562810be318c2c2ebe319229ee6e42d953f246fe426e4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.9.3/packer_1.9.3_linux_arm64.zip"
    sha256 "fc42f4e70f5466286f675f07fc6c4386a0a7eafdee78537c67c5c0722fb43c81"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
