# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  release_repository = +ENV["HOMEBREW_HASHICORP_ARTIFACT_REPOSITORY_HOST"] || "https://releases.hashicorp.com"

  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.14.3"

  if OS.mac? && Hardware::CPU.intel?
    url release_repository << "/boundary/0.14.3/boundary_0.14.3_darwin_amd64.zip"
    sha256 "75e4418b56324f3d95bc8e624bd934ce2bdb228696db33ec2095cb578cfe5e8b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url release_repository << "/boundary/0.14.3/boundary_0.14.3_darwin_arm64.zip"
    sha256 "1d6c9a6405f79c25fdc4c945d69587b4eb639833099ae996d7ae4f4871264769"
  end

  if OS.linux? && Hardware::CPU.intel?
    url release_repository << "/boundary/0.14.3/boundary_0.14.3_linux_amd64.zip"
    sha256 "284ffea85f2853b87b783a2d1e6cd4ceb0b0c3ad8d15233cd7d634ce53363327"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url release_repository << "/boundary/0.14.3/boundary_0.14.3_linux_arm.zip"
    sha256 "5173f04e3108e3845f5fa55c8ed85a9c06dd9e4c72fda5d71ad86bc001ddf56e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url release_repository << "/boundary/0.14.3/boundary_0.14.3_linux_arm64.zip"
    sha256 "e18b335cdddcffefdc60e496dd39770f5936f7ac014d23cd019a2e7cb7e99dc5"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
