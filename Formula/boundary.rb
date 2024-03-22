# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.15.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.15.1/boundary_0.15.1_darwin_amd64.zip"
    sha256 "00941b6fa7fbcca3fe520054f591518ddf0774b3b34f41c8e7cf453a6f4251e4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.15.1/boundary_0.15.1_darwin_arm64.zip"
    sha256 "ddf18516ff0036cee1b42f95a5a2289a5201d15783abb566e6edc510a6048380"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.15.1/boundary_0.15.1_linux_amd64.zip"
    sha256 "50527710a49c6ca4b9037473d49485bca417deb8196639650b02c3970db137fd"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.15.1/boundary_0.15.1_linux_arm.zip"
    sha256 "8fa59ef5abf160c51c567ffa43e2392d531938d6a54b5e834aeddba0920d4aef"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.15.1/boundary_0.15.1_linux_arm64.zip"
    sha256 "103b891641607b3a5cb57ac2c819740ec1c6f33097919aaab7314f731af1a4d4"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
