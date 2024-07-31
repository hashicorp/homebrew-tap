# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.17.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.17.0/boundary_0.17.0_darwin_amd64.zip"
    sha256 "b96b7f95e7cee5b52b4627ff3ccb1c12f6ebc9fb4b8f177cce6956ec8a60903a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.17.0/boundary_0.17.0_darwin_arm64.zip"
    sha256 "2f06e033b3d413600247fe651c2356c7dd38ac2a2f12045cf6f529c12e1b7a3d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.17.0/boundary_0.17.0_linux_amd64.zip"
    sha256 "fa2ef52e6ac7b802196a9ecd195e16cf430d36e260ea618284d1d40492f6cc67"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.17.0/boundary_0.17.0_linux_arm.zip"
    sha256 "3d3cb95a8e3564798e0c456ff884df0c99d80cdea0f7912e68c008782005a3c8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.17.0/boundary_0.17.0_linux_arm64.zip"
    sha256 "3f7b4de56b1ad76c0b103be2748442addb3070ade156fd2622286614bbf6573f"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
