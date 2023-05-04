# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.8.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.8.7/packer_1.8.7_darwin_amd64.zip"
    sha256 "4d155149abb90ea8ab25e48adb33a2182c08229f86dd34cb0d73b7e072520413"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.8.7/packer_1.8.7_darwin_arm64.zip"
    sha256 "c38623853677645a358d3b2179e0f1d671b34036aa53e6ced260951fa6973ccf"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.8.7/packer_1.8.7_linux_amd64.zip"
    sha256 "30d2f21bf882b619697e3af0e9080cbf4a3e89066c7ae11debfd9ea243d5946f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.8.7/packer_1.8.7_linux_arm.zip"
    sha256 "04293df603e9b461acbb3d0bcfcb6b46f814c20cb29dd77d2b71c3f7e84e09de"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.8.7/packer_1.8.7_linux_arm64.zip"
    sha256 "fcc9ef06326eb5b8d11a580049f43540a6d50604c063028d82540395d23653bb"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
