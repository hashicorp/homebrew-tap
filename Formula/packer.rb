# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.11.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.11.1/packer_1.11.1_darwin_amd64.zip"
    sha256 "08daab53fa0edeeb95d44d93dfe78e2ac7b667e1c35c6a19c7edc665967e7424"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.11.1/packer_1.11.1_darwin_arm64.zip"
    sha256 "86262421358282ce7e64a80505902486dd91ece808d188443747c47ab80e686d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.11.1/packer_1.11.1_linux_amd64.zip"
    sha256 "07a9d92fe98d7bb4be09392c06ef6c4f9ffbc905fe6c29fff0622432367f01cc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.11.1/packer_1.11.1_linux_arm.zip"
    sha256 "ae820f1f97aae5b674cf76ac69797ecf42c85a1e0671f0499302a803a88a3e63"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.11.1/packer_1.11.1_linux_arm64.zip"
    sha256 "2666f40bde53f4684ba5a3d52a38c02d6ba45fd114c38ea6a0925bedd2e16ad0"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
