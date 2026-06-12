# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class tfctl < Formula
  desc ""
  homepage "https://www.terraform.io"
  version "0.2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfctl/0.2.0/tfctl_0.2.0_darwin_amd64.zip"
    sha256 "f4b82849d15dd3b7cef94c9c440d1fdadc6d64e0a56b0a1bf2bc3c247e674a8b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfctl/0.2.0/tfctl_0.2.0_darwin_arm64.zip"
    sha256 "70f781f8c718f0289e8ee6c5cba55a56e54371183795d1277948849e38f85965"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfctl/0.2.0/tfctl_0.2.0_linux_amd64.zip"
    sha256 "ed7dd6c49ac906f3180f9f1c4ba440f19e662fac6508f4e78261772b688178ed"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfctl/0.2.0/tfctl_0.2.0_linux_arm.zip"
    sha256 "ed7dd6c49ac906f3180f9f1c4ba440f19e662fac6508f4e78261772b688178ed"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfctl/0.2.0/tfctl_0.2.0_linux_arm64.zip"
    sha256 "9e456947a1363c8dad964695d38af3b2c6da1ab2b56340b04d1480b82540ab7e"
  end

  conflicts_with "tfctl"

  def install
    bin.install "tfctl"
  end

  test do
    system "#{bin}/tfctl --version"
  end
end
