# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.14.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.14.2+ent/boundary_0.14.2+ent_darwin_amd64.zip"
    sha256 "3deb1649041bc8ec41a63d7d135aa8caa905a5cb6f930ca55e28ef1057ea3bc3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.14.2+ent/boundary_0.14.2+ent_darwin_arm64.zip"
    sha256 "b7f78f62036c2c211d332d8753a128466e55eddd8894e5d516e8d01619a9f4c2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.14.2+ent/boundary_0.14.2+ent_linux_amd64.zip"
    sha256 "1a15e042f0e33cf3c5e72a55972c814b2a2a4b86f2cfccf51e00557261f04017"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.14.2+ent/boundary_0.14.2+ent_linux_arm.zip"
    sha256 "076109dd22c405497b745cb3115727f616d7fa886b61851a5cc600b541d8c9d3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.14.2+ent/boundary_0.14.2+ent_linux_arm64.zip"
    sha256 "58f745448d5a10f87ae2a0490f9c367b30447b23986ab0a84727af4351e2d439"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
