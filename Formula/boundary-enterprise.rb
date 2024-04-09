# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.15.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.15.4+ent/boundary_0.15.4+ent_darwin_amd64.zip"
    sha256 "91425365abf46ae0c13d1f148018d21b95996e01a11f78f70d461a4f2715cf77"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.15.4+ent/boundary_0.15.4+ent_darwin_arm64.zip"
    sha256 "1293601c822aab4122d1c0d7f8143473d18630cd87674c6f41f241a67c3566e2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.15.4+ent/boundary_0.15.4+ent_linux_amd64.zip"
    sha256 "764b534ead3fa1eb3f864eb7c14eb8f9388c99da4654601e054efbb9c881dde0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.15.4+ent/boundary_0.15.4+ent_linux_arm.zip"
    sha256 "5a31ac9c050ef0f52f211d3e8b14481a2f8c99799964c9fe64e9622db2fb106c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.15.4+ent/boundary_0.15.4+ent_linux_arm64.zip"
    sha256 "abd30471a18f977413050ab292f4a5e965b99f4c39221aecbb6a154cf7cc939f"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
