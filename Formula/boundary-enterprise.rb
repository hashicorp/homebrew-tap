# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.15.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.15.0+ent/boundary_0.15.0+ent_darwin_amd64.zip"
    sha256 "63e5d5ab2654e1d988aa3fa02eeeca70e09ed2dbadfc94d74140a203790eab66"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.15.0+ent/boundary_0.15.0+ent_darwin_arm64.zip"
    sha256 "708948210320e1da51c927ec0153e315c254c4c49b408ad88f4adf9c6e8b9776"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.15.0+ent/boundary_0.15.0+ent_linux_amd64.zip"
    sha256 "84f34447beed9b8a32d11dbbedd1e622b6ccf673ebfcedb92e77de9ad161a55f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.15.0+ent/boundary_0.15.0+ent_linux_arm.zip"
    sha256 "c4cd47de0eb9afc3848155eac4bfa1554db4bc332dcfddf2111d5c5003acc7f7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.15.0+ent/boundary_0.15.0+ent_linux_arm64.zip"
    sha256 "e374c276ab9799c4f9526163bff367eb5581d168a97247b0ffb46ad690c3d309"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
