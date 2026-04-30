# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.21.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.3+ent/boundary_0.21.3+ent_darwin_amd64.zip"
    sha256 "0a5d6eef25c96455f5be8c356598e419796cd8283f86a201d0e3f0c76a1478fb"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.21.3+ent/boundary_0.21.3+ent_darwin_arm64.zip"
    sha256 "9685ebe84caa70498463478a52cfa4680fb1d04430621f7a07981b5a33fd371c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.3+ent/boundary_0.21.3+ent_linux_amd64.zip"
    sha256 "f6b857fd643d6ea50e0cc3c2ae0fa16c47c3fe082b10433ea14ae636adacd575"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.3+ent/boundary_0.21.3+ent_linux_arm.zip"
    sha256 "e4955405d778f800ac289559e1d757049f6ee63d338c4ee43a2306ab1eefd753"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.3+ent/boundary_0.21.3+ent_linux_arm64.zip"
    sha256 "b46501d4045820ca26e69b2cf0ec558c392d55bf783588281f07f88fd3f91516"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
