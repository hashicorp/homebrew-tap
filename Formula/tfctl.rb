# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Tfctl < Formula
  desc ""
  homepage "https://www.terraform.io"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfctl/0.4.0/tfctl_0.4.0_darwin_amd64.zip"
    sha256 "19786ebddb3cbd922402d21577e85842385910a666e62b1f9b0de46520c527d7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfctl/0.4.0/tfctl_0.4.0_darwin_arm64.zip"
    sha256 "e53f2b965eec2435d5543ff4b6ff799b4beac0e0c233a3a355158abe4c524632"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfctl/0.4.0/tfctl_0.4.0_linux_amd64.zip"
    sha256 "055d365cf165708dd304747f27a7242c51ce61a0bf680bd83fd3abe7cbcaa356"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfctl/0.4.0/tfctl_0.4.0_linux_arm.zip"
    sha256 "055d365cf165708dd304747f27a7242c51ce61a0bf680bd83fd3abe7cbcaa356"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfctl/0.4.0/tfctl_0.4.0_linux_arm64.zip"
    sha256 "5f2caf7900b8f43dd72f390b992bafceab4ae85bbc58b60325bb1888ef9a0e53"
  end

  conflicts_with "tfctl"

  def install
    bin.install "tfctl"
  end

  test do
    system "#{bin}/tfctl --version"
  end
end
