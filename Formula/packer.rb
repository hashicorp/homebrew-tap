# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.11.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.11.0/packer_1.11.0_darwin_amd64.zip"
    sha256 "7f2a9bcaf339864da0458f676d8b6581a2c274929327fb15a9a7d24e8ea8dcf5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.11.0/packer_1.11.0_darwin_arm64.zip"
    sha256 "d4933bbd36fa63ff904ba94fb02630a2489491eedf01af79c4cfb674bf989476"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.11.0/packer_1.11.0_linux_amd64.zip"
    sha256 "dcac06a4c671bbb71e916da5abe947ebf4d6aa35c197e21c7c7b1d68cb8b7cad"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.11.0/packer_1.11.0_linux_arm.zip"
    sha256 "644ff27386993ef09b29169c383b70c0c92aef6bce53bdd9f87b945c4a6a31bb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.11.0/packer_1.11.0_linux_arm64.zip"
    sha256 "0edd69e9cf34687d118610ed5de88fc18a2d3e2d9d3600ff3e76eaac08afd5cb"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
