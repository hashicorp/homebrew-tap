# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.13.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.13.2+ent/boundary_0.13.2+ent_darwin_amd64.zip"
    sha256 "d2b40febc40060999d7b1eb899794434b0271796b64ed2455bf606b23d67712a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.13.2+ent/boundary_0.13.2+ent_darwin_arm64.zip"
    sha256 "3ad618107346f7bcfcbb389f782a314351921c65b3d7bb4643ac71d80dea6579"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.13.2+ent/boundary_0.13.2+ent_linux_amd64.zip"
    sha256 "dda11361809ce2b99d49653af677d676b30b4599e2663174f8950cf346734be0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.13.2+ent/boundary_0.13.2+ent_linux_arm.zip"
    sha256 "7d8903f0042fb52f439f3a3cfddf0bdd56c7c3599c5b5ae10ce40d669c50bdb2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.13.2+ent/boundary_0.13.2+ent_linux_arm64.zip"
    sha256 "8d4a12cffc69e7bd94fb91e393a06f4dee3389927fe3f79e3924beeb98e281b4"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
