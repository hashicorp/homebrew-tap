# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "1.0.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/1.0.1+ent/boundary_1.0.1+ent_darwin_amd64.zip"
    sha256 "f43beba75a82691afa1c3261d881077bd860862de2c17bb96b6707f6f963079c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/1.0.1+ent/boundary_1.0.1+ent_darwin_arm64.zip"
    sha256 "e2ad45320f2e4d975bcab2561886aadec9dd7a3253f92db29f2b55024b615698"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/1.0.1+ent/boundary_1.0.1+ent_linux_amd64.zip"
    sha256 "f74035e77cc4dab5c7f0f4c1fd886489ed6c8c6f928a456dea60f9424fec20bd"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/1.0.1+ent/boundary_1.0.1+ent_linux_arm.zip"
    sha256 "99836b80f34850216a18649f47ca330a4c33b2bd9932f5c3c8f4cbf3cb5f7fdc"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/1.0.1+ent/boundary_1.0.1+ent_linux_arm64.zip"
    sha256 "9b5f5ba8cc9204f6e9f988b22000f1fed9845e424fc7712978906c0c1443d64d"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
