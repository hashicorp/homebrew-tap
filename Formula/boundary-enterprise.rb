# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.19.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.19.0+ent/boundary_0.19.0+ent_darwin_amd64.zip"
    sha256 "1cdfeede825aa6e8b4e33db74f142a5261145e750b0894ef95868557113ff8f8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.19.0+ent/boundary_0.19.0+ent_darwin_arm64.zip"
    sha256 "b774919526235000a009d44247ddcc4730418b8d4714e504252902564e0f0e83"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.19.0+ent/boundary_0.19.0+ent_linux_amd64.zip"
    sha256 "8e7c825b05fa543bbe77c7e885783f811544b68f5e2c772bc1f8e3fc33218a41"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.19.0+ent/boundary_0.19.0+ent_linux_arm.zip"
    sha256 "0fb81cfed285be085f6e4c21002c23c39eba2d43f5fc99d4d807ef75eb954b2f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.19.0+ent/boundary_0.19.0+ent_linux_arm64.zip"
    sha256 "6747bcb646272da59b73ef70f65bec4fd99b6293e64c7b56535b7d966a9f9fff"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
