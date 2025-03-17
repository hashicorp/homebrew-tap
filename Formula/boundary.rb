# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.19.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.19.1/boundary_0.19.1_darwin_amd64.zip"
    sha256 "bd50ddfede5b854705a9cbfa5b6b080b71306b06428bf186c76bee579927f1b5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.19.1/boundary_0.19.1_darwin_arm64.zip"
    sha256 "3deca929d8e6d558545bc1530a27dd9fc7cc5e4e34e4e3fbf3fc6529d3e3ee34"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.19.1/boundary_0.19.1_linux_amd64.zip"
    sha256 "2fec8faf4de742538a79e4df93230ea0f7d216904b1a776083f705ca6ae124e9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.19.1/boundary_0.19.1_linux_arm.zip"
    sha256 "03fc5f10c7c4e564c1735370bdc745696ca8238ca736d55ebbdae7eb5c425da7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.19.1/boundary_0.19.1_linux_arm64.zip"
    sha256 "ba2eda1f28bb3563db06d6ecca0c2ef240fffa4d754fb78e88e7a3158e086157"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
