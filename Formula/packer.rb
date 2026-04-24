# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.15.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.15.2/packer_1.15.2_darwin_amd64.zip"
    sha256 "bd41944e993441332653e064266135c7945fc9d41c8dc080ff90109ebafc9ce6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.15.2/packer_1.15.2_darwin_arm64.zip"
    sha256 "42347a2f3abce00ad6b064ce71db275ac1409ff5ae3dbba93003e49ec3bd32e1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.15.2/packer_1.15.2_linux_amd64.zip"
    sha256 "8cc4bc94a7e6d8806dd754869945287918aaa3c55bebdfa5169e33cd1dcf35c6"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.15.2/packer_1.15.2_linux_arm.zip"
    sha256 "6624ff7bf81e1eeb18367704849c7b78b9c14625581da9a83c534c2a961b7e16"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.15.2/packer_1.15.2_linux_arm64.zip"
    sha256 "03543af87e164eedc6cd8d590f559d1b8d5d9c175f44d7ee1f4e88ae65bce918"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
