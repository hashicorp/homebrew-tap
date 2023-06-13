# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.13.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.13.0/boundary_0.13.0_darwin_amd64.zip"
    sha256 "59c01ef00146aa7b0df15376a7cb3df613b7baf5d04f19145754403772cf59a3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.13.0/boundary_0.13.0_darwin_arm64.zip"
    sha256 "e9ea1d985dfdf18edbf7ba35997fefa731cca31f3e6d0a26070d7ec971640b4e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.13.0/boundary_0.13.0_linux_amd64.zip"
    sha256 "cc9d2303067958ac63f772a26a684f7f6cda4664f7d8f6e39758dc46ee6de542"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.13.0/boundary_0.13.0_linux_arm.zip"
    sha256 "eba25a8a6b1df5041ff37f31944079c6e64714d0d880dbfec4d0d6009f3830f8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.13.0/boundary_0.13.0_linux_arm64.zip"
    sha256 "52a648ad255fadf6f6c6eb65893a15134b70d351f08b2ba3c5e8e66e454905db"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
