# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.9.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.9.4/packer_1.9.4_darwin_amd64.zip"
    sha256 "cc7961f98771f61a395bc365fe114f3b1fca0a981135a0b7ba1d66d59bea9c14"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.9.4/packer_1.9.4_darwin_arm64.zip"
    sha256 "3777ec24244147a26d71ffa349a965b33905f5cfbd6f6d5ce30c27dd62f208bb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.9.4/packer_1.9.4_linux_amd64.zip"
    sha256 "6cd5269c4245aa8c99e551d1b862460d63fe711c58bec618fade25f8492e80d9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.9.4/packer_1.9.4_linux_arm.zip"
    sha256 "e1343eaf1f87806c63e67b1bb6c218d2cbb18ce74d570c9197441cd4cae6ba67"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.9.4/packer_1.9.4_linux_arm64.zip"
    sha256 "f00a4fc221b20a166cfac8a63513054775988a068667517bb3edcfab8b1700ba"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
