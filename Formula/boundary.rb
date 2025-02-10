# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.19.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.19.0/boundary_0.19.0_darwin_amd64.zip"
    sha256 "7440eb11a96f500785069e423225c2ca84f0726d668e33ef7b3e30a6bbdf05bc"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.19.0/boundary_0.19.0_darwin_arm64.zip"
    sha256 "fef1c9f5f02c8cdb0394cfa5be9e99f0a05a53be095a6f55a498e25abb6f1991"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.19.0/boundary_0.19.0_linux_amd64.zip"
    sha256 "38ca73d3fb419e6d6194be19aa6dd3f54dd7ec0151bf87de2deeb43510378020"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.19.0/boundary_0.19.0_linux_arm.zip"
    sha256 "f4b0e21c889686d9c4479a416a063efaeeb1a0ef74b305518b713ff1f87e6783"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.19.0/boundary_0.19.0_linux_arm64.zip"
    sha256 "e0df9a9a7d2528e0ad315488651448dfcc1c6644c8c955c0b55658983bfba23c"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
