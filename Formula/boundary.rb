# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.17.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.17.1/boundary_0.17.1_darwin_amd64.zip"
    sha256 "47afd877823fc88b90f5f56711105efe9c1099fbbbaf10021a4e45ddbf622b49"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.17.1/boundary_0.17.1_darwin_arm64.zip"
    sha256 "b179c2e263d964437e0e25f0e74f04c402663d064fff369d1e7677e5e7055044"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.17.1/boundary_0.17.1_linux_amd64.zip"
    sha256 "8125803b2642b811cdb8ea8efc4bbf015fda50c72fe21e34f1cbe061c55e7b98"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.17.1/boundary_0.17.1_linux_arm.zip"
    sha256 "35cb4d7ba9ef4309e45b0af3b536b9e71f14b369488736b9e3deca9d65308ac2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.17.1/boundary_0.17.1_linux_arm64.zip"
    sha256 "7b383989ec7b3646e94f4b2ad0899c50fbdcd364ba9bb504868ba019102c9f3f"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
