# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.18.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.18.0+ent/boundary_0.18.0+ent_darwin_amd64.zip"
    sha256 "3adbf10fa3343f521ee6c2760455f1a578d4af975e782d3f0e5703802f905564"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.18.0+ent/boundary_0.18.0+ent_darwin_arm64.zip"
    sha256 "ecaa14ad6cfb1b0e7b428420a62da4aff35fb5d2bd0e8044015fdf808c31e72a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.18.0+ent/boundary_0.18.0+ent_linux_amd64.zip"
    sha256 "b94b9aa5259d5228209ee5ee6e69ebaf7ca34058c5a1c835ea54923df6acae69"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.18.0+ent/boundary_0.18.0+ent_linux_arm.zip"
    sha256 "7a00437ce9b9490db0e93b4e0bdceb723c9b6d7d97b010b18908428ab134b3e9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.18.0+ent/boundary_0.18.0+ent_linux_arm64.zip"
    sha256 "319c91a2137d8ffb9595aa801dedd19f806f868a577010e35b591a45eb13ff39"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
