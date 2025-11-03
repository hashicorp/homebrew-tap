# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.20.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.20.1+ent/boundary_0.20.1+ent_darwin_amd64.zip"
    sha256 "bb47181bc80853404e07d556b1c47e38340ab68b8d8193580c27d496fb5eb687"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.20.1+ent/boundary_0.20.1+ent_darwin_arm64.zip"
    sha256 "3add1eaacbb1dede60a01b0a721c7fdd5fa0875632911000375faebba27dd99b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.20.1+ent/boundary_0.20.1+ent_linux_amd64.zip"
    sha256 "e790785aed8e8d6ecfaaf2c3b7a3ce6ac04d8244336dea73313a8424893d0278"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.20.1+ent/boundary_0.20.1+ent_linux_arm.zip"
    sha256 "86870cd59edd04510b62b60aea43df4ed214019a3ed106fae6e7d83e7cb6b525"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.20.1+ent/boundary_0.20.1+ent_linux_arm64.zip"
    sha256 "c8bf5dace96ab9492991c8a469781bc758fe5e48bddf1dceeba1cd597783cb76"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
