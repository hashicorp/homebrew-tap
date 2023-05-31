# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.9.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.9.0/packer_1.9.0_darwin_amd64.zip"
    sha256 "24fa8bbf492873e78bc6121309440c33eb38d62b8581dc95ca0aa26382c6325f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.9.0/packer_1.9.0_darwin_arm64.zip"
    sha256 "cc1cc68a585a7e96914b7c1950d458a754cfdf96e85c25ad7cce912440e911a0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.9.0/packer_1.9.0_linux_amd64.zip"
    sha256 "c23db707533b0db293e27480d38ef9ee7a2aaf337234159aef524f1ec7e10a6c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.9.0/packer_1.9.0_linux_arm.zip"
    sha256 "95a9adcc23a25a12e5912cb6398a865e1f9117cc47ca23bcccc6585f7c6b5bb9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.9.0/packer_1.9.0_linux_arm64.zip"
    sha256 "321a34b2311a6141328f16015e66471b779cdf3b310f150bc66a600ee2cea6e6"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
