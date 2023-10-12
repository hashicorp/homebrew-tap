# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.14.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.14.0/boundary_0.14.0_darwin_amd64.zip"
    sha256 "1c72fb6eec955220d8ef9192f789e2a45ef33eafe9550bf344f5f3563872a802"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.14.0/boundary_0.14.0_darwin_arm64.zip"
    sha256 "81382e6318e350a0ff5b8817b49717d113d72f092b34c6936d08e946fc4fa2c6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.14.0/boundary_0.14.0_linux_amd64.zip"
    sha256 "08de61de0c4aa47608ab414199c50eed1569993ea56b0d058004c7fb2bd1d560"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.14.0/boundary_0.14.0_linux_arm.zip"
    sha256 "47b4b33341fa7b5b11ce1479110562de0ce831545c999f2e8f5f1ba77075f625"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.14.0/boundary_0.14.0_linux_arm64.zip"
    sha256 "f039c4af2823905e621c0c8e6eacad592931d28bc136ac1b9485f82e0bcee043"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
