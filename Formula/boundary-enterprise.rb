# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.16.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.16.0+ent/boundary_0.16.0+ent_darwin_amd64.zip"
    sha256 "4596f83956ecb83ca2e6fd60f5da5aa213a8a8d6eef0a37f3790559f9d2a3041"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.16.0+ent/boundary_0.16.0+ent_darwin_arm64.zip"
    sha256 "9ab33294ce838b17c78794d4a4396a41d526050551448099110e074927c18a2d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.16.0+ent/boundary_0.16.0+ent_linux_amd64.zip"
    sha256 "6c0c25f3ffe6e0f6ba7b8c4132c0a9b9b9dd925044eacac94382f87c190e4c2d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.16.0+ent/boundary_0.16.0+ent_linux_arm.zip"
    sha256 "45a968e64eff6d99d6363d1a485e2e25b10dd336dde6ea8af3959c1e8b84e5b9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.16.0+ent/boundary_0.16.0+ent_linux_arm64.zip"
    sha256 "d70bef385be295c2eb1855db2b4ffd866e76e32b620a30ad58ab419ae8668f4f"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
