# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.17.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.17.0+ent/boundary_0.17.0+ent_darwin_amd64.zip"
    sha256 "f76a791a6879478f9013b0f53dad51107bd3ed2f7f8f8f55f2f8fb7899844f6b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.17.0+ent/boundary_0.17.0+ent_darwin_arm64.zip"
    sha256 "8ad2695aaddb378b344efda29398c979b0ec807d8cb2d9ad28614afd517fb260"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.17.0+ent/boundary_0.17.0+ent_linux_amd64.zip"
    sha256 "caa06bc9b96328f690823f34d55fa3f694b2a10d474ad60a22e2fea309934f8f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.17.0+ent/boundary_0.17.0+ent_linux_arm.zip"
    sha256 "5e3f76207848834ffebef27798433acdf62a210d5239a391ff3589a774cde85b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.17.0+ent/boundary_0.17.0+ent_linux_arm64.zip"
    sha256 "37f90d79607b4536ce126c40f8207c1540066df6dade273ee403d21b11870856"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
