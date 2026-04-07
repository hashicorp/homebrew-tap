# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.21.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.2+ent/boundary_0.21.2+ent_darwin_amd64.zip"
    sha256 "b995abef2aaf417557699eaaec3c4b0d8b4a59be12be99fc5900a5e6bf454d9b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.21.2+ent/boundary_0.21.2+ent_darwin_arm64.zip"
    sha256 "492cb0a95bf637b51f578bc129b13d404e0213ffd8e385a91a37fbe83ba3252e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.2+ent/boundary_0.21.2+ent_linux_amd64.zip"
    sha256 "4dead3871bb9600a765660fd0ab2fe864f3a6907633f018f0c7480ffb1fec0c8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.2+ent/boundary_0.21.2+ent_linux_arm.zip"
    sha256 "ac4d375629d6b4543f745ede442d144046b3823b7401c2cc3f3d51b36ebf5e4c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.2+ent/boundary_0.21.2+ent_linux_arm64.zip"
    sha256 "7af664a5f2e97b343f2a189e3a67843a6084015fda918268c8e089be1f4a88cb"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
