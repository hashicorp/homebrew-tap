# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.20.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.20.0/boundary_0.20.0_darwin_amd64.zip"
    sha256 "b047158acd5439d77bfc7683cb936d21fcdf6642504d406bcc9b5afcd04184fe"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.20.0/boundary_0.20.0_darwin_arm64.zip"
    sha256 "a81271dd226551f6f9b3819626b66a65575e2b6db956ec049df341fbe6ce72fe"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.20.0/boundary_0.20.0_linux_amd64.zip"
    sha256 "86ea36272497cdabf98e659025db86ba4234c1d88ae78e0b264d70dacf2eb122"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.20.0/boundary_0.20.0_linux_arm.zip"
    sha256 "45e5f65c0745afadfe1aedfd4b590cb4f918fadfa42c893a2a31054ef7fe1cb8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.20.0/boundary_0.20.0_linux_arm64.zip"
    sha256 "646242641041d1681514642d7c9c6b675565e292d7e1f999c93783ae4dfadd02"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
