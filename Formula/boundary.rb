# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.21.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.2/boundary_0.21.2_darwin_amd64.zip"
    sha256 "6ff94517c5b51776e8177d886993eb0c15f44be4fadf35a30693b428ce2223ee"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.21.2/boundary_0.21.2_darwin_arm64.zip"
    sha256 "73ab30c664ac1c913b477361d06e043b352eedfb7c4b73295ee0af3c40eb2210"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.2/boundary_0.21.2_linux_amd64.zip"
    sha256 "a52aaa65de6de280ae3bbcb24a567766236b3b5e5736aa6556dd77c594e8b18d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.2/boundary_0.21.2_linux_arm.zip"
    sha256 "5dd1105d7769bfa9051f9968147bd10fe4b347529d5a2d78d4cbb7809ddfc377"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.2/boundary_0.21.2_linux_arm64.zip"
    sha256 "b20983aed20b09e3031ed7912cd478020b34863f24f1bd7ec2ae7b96470c2968"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
