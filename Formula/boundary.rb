# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.19.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.19.3/boundary_0.19.3_darwin_amd64.zip"
    sha256 "fb6c4bb18b66ee896eea544082c33b883135c8360a6417288051c135bd897952"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.19.3/boundary_0.19.3_darwin_arm64.zip"
    sha256 "434442f01c8b77a6b061825efd8657973e18436cf4d482c3d4fdb1b14cf0aa2b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.19.3/boundary_0.19.3_linux_amd64.zip"
    sha256 "55e69a4a4b1b28e204d875ceb1979425151a0da409f781556c0387d77bb0ebdb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.19.3/boundary_0.19.3_linux_arm.zip"
    sha256 "f056823ba63693f9aab041f7fe0fbfc3b57aab4e0f8baf1c6d77fc4b9297717b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.19.3/boundary_0.19.3_linux_arm64.zip"
    sha256 "957879fe6f38626114a895866dd4aef718c23b7dacc8b65e48b9c0d816296328"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
