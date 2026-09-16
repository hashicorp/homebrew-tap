# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.21.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.3/boundary_0.21.3_darwin_amd64.zip"
    sha256 "d349e100b3f951caca9ed46a509458a0f5a265e7c6a8c0fca612d922a9e15af4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.21.3/boundary_0.21.3_darwin_arm64.zip"
    sha256 "7d64c6bf6ca437b10a143d47bb85cfaff0af7ba83c598a38b1ac275d2acc75c1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.3/boundary_0.21.3_linux_amd64.zip"
    sha256 "1a948c143b849cedba91127aa11155c6006d84051282a0d93f3d89525b460d12"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.3/boundary_0.21.3_linux_arm.zip"
    sha256 "382e5df3f0a6961bec4711e09f443d199255ba88afdf8db4bd19bbdde5ed6349"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.3/boundary_0.21.3_linux_arm64.zip"
    sha256 "7b023a78f3ba4c100d665daf9a93861785396a40b7d3e5878c1e86b48d24b966"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
