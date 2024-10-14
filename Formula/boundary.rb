# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.18.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.18.0/boundary_0.18.0_darwin_amd64.zip"
    sha256 "8c1f87ec7e44d9b8391fe4be22eb948fc67d19b1639b9dfd0980b582cd0956b2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.18.0/boundary_0.18.0_darwin_arm64.zip"
    sha256 "4b47e688517a25b34f29d8cf3a9678d3e892e61aaa0c21766338a3c2481fce88"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.18.0/boundary_0.18.0_linux_amd64.zip"
    sha256 "cc5759da4edff2e75e67a8515e4c7ba36c4392e63448c23a74c84df5f8123eb6"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.18.0/boundary_0.18.0_linux_arm.zip"
    sha256 "caa71eb40dd0ea57e56e25eee5cc6c259357dae5160b9bdb429eb45204055ec2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.18.0/boundary_0.18.0_linux_arm64.zip"
    sha256 "d02e7c0186c1d2926e9b0cde739c5da8fccc44d582ea1b5c667d33c54b1642af"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
