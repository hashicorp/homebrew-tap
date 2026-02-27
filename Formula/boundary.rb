# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.21.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.1/boundary_0.21.1_darwin_amd64.zip"
    sha256 "d090ef8db6df84565f9f3eeb3fc7d24a2b4f8fff061b26eaae38c008ada3ba0c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.21.1/boundary_0.21.1_darwin_arm64.zip"
    sha256 "fa74d345c71bfa480086815fe2ffe97285cbe5789325e0911f7b36275849e28a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.1/boundary_0.21.1_linux_amd64.zip"
    sha256 "ab9f2b2a7624ecd351a9e6f3ef85e61e37eaa3665a6e38a4036b3486e925f8b4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.1/boundary_0.21.1_linux_arm.zip"
    sha256 "294fb965838688c24324ec85226e91543464457f4eaba93d2b74031d66f52aa6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.1/boundary_0.21.1_linux_arm64.zip"
    sha256 "623c773b71a086ca728d20a19e4ce5386c5a0b1d1ef95af97da49a7965c47696"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
